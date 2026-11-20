import 'dart:developer';
import 'dart:io';

import 'package:ap_common_announcement_ui/src/api/announcement_helper.dart';
import 'package:ap_common_announcement_ui/src/ui/announcement_content_page.dart';
import 'package:ap_common_announcement_ui/src/ui/black_list_page.dart';
import 'package:ap_common_announcement_ui/src/ui/edit_page.dart';
import 'package:ap_common_announcement_ui/src/ui/editor_list_page.dart';
import 'package:ap_common_announcement_ui/src/utils/tag_colors.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum _DataType { announcement, application }

enum _ReviewFilter { all, pending, approved, rejected }

class AnnouncementHomePage extends StatefulWidget {
  const AnnouncementHomePage({
    super.key,
    this.loginDescriptionWidget,
    this.reviewDescriptionWidget,
    this.organizationDomain,
    this.enableNormalLogin = false,
    this.fcmToken,
  });

  final Widget? loginDescriptionWidget;
  final Widget? reviewDescriptionWidget;
  final String? organizationDomain;
  final bool enableNormalLogin;

  /// FCM token for push notification when application is
  /// approved/rejected. Pass from FirebaseMessagingUtils.instance.token.
  final String? fcmToken;

  static const String routerName = '/announcement';

  @override
  _AnnouncementHomePageState createState() =>
      _AnnouncementHomePageState();
}

class _AnnouncementHomePageState extends State<AnnouncementHomePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _reviewDescription =
      TextEditingController();

  AnnouncementLoginData? loginData;

  DataState<List<Announcement>> announcementState =
      const DataLoading<List<Announcement>>();
  DataState<List<Announcement>> applicationState =
      const DataLoading<List<Announcement>>();

  Set<String> _blackListSet = <String>{};

  Map<String, int> _tagsCount = <String, int>{};
  String? _selectedTag;

  /// null = all, true = approved, false = rejected,
  /// 'pending' uses a separate bool
  _ReviewFilter _reviewFilter = _ReviewFilter.all;

  FocusNode? usernameFocusNode;
  FocusNode? passwordFocusNode;

  TabController? _tabController;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  bool get _isLoggedIn => loginData != null;

  bool get _isAdmin =>
      loginData?.level != null &&
      loginData!.level != PermissionLevel.user;

  String _reviewStateText(bool? reviewStatus) {
    if (reviewStatus == null) {
      return context.ap.waitingForReview;
    }
    return reviewStatus
        ? context.ap.reviewApproval
        : context.ap.reviewReject;
  }

  @override
  void initState() {
    Future<dynamic>.microtask(() => _getPreference());
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _initTabController() {
    if (_tabController != null) return;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ApPageScaffold(
      title: Text(context.ap.announcementReviewSystem),
      actions: _buildAppBarActions(colorScheme),
      bottom: _isLoggedIn && _isAdmin
          ? TabBar(
              controller: _tabController,
              tabs: <Tab>[
                Tab(text: context.ap.allApplications),
                Tab(text: context.ap.allAnnouncements),
              ],
            )
          : null,
      floatingActionButton: _buildFab(),
      body: _isLoggedIn
          ? RefreshIndicator(
              onRefresh: () async {
                await _getAnnouncements();
                await _getApplications();
              },
              child: _buildContent(colorScheme),
            )
          : _buildLoginContent(colorScheme),
    );
  }

  List<Widget> _buildAppBarActions(ColorScheme colorScheme) {
    return <Widget>[
      if (_isLoggedIn && _isAdmin) ...<Widget>[
        IconButton(
          icon: const Icon(Icons.playlist_remove),
          tooltip: context.ap.blackList,
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const BlackListPage(),
              ),
            );
            _getBlackList();
          },
        ),
        if (loginData?.level == PermissionLevel.admin)
          IconButton(
            icon: const Icon(Icons.manage_accounts),
            tooltip: context.ap.editorList,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const EditorListPage(),
                ),
              );
            },
          ),
      ],
      if (_isLoggedIn)
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          tooltip: context.ap.logout,
          onPressed: _logout,
        ),
    ];
  }

  Widget? _buildFab() {
    if (!_isLoggedIn) return null;

    if (_isAdmin) {
      return FloatingActionButton(
        onPressed: () => _navigateToEdit(Mode.add),
        child: const Icon(Icons.add),
      );
    }

    return FloatingActionButton.extended(
      onPressed: () => _navigateToEdit(Mode.application),
      icon: const Icon(Icons.add),
      label: Text(context.ap.apply),
    );
  }

  Widget _buildContent(ColorScheme colorScheme) {
    if (_isAdmin) {
      return _buildAdminTabView(colorScheme);
    }
    return _buildUserView(colorScheme);
  }

  // ─── User View ─────────────────────────────────────────

  Widget _buildUserView(ColorScheme colorScheme) {
    return switch (applicationState) {
      DataLoading<List<Announcement>>() =>
        const Center(child: CircularProgressIndicator()),
      DataError<List<Announcement>>() => InkWell(
          onTap: _getApplications,
          child: HintContent(
            icon: ApIcon.classIcon,
            content: context.ap.clickToRetry,
          ),
        ),
      DataEmpty<List<Announcement>>() => HintContent(
          icon: ApIcon.classIcon,
          content: context.ap.noData,
        ),
      DataLoaded<List<Announcement>>(:final List<Announcement> data) =>
        _buildUserList(colorScheme, data),
    };
  }

  Widget _buildUserList(
    ColorScheme colorScheme,
    List<Announcement> apps,
  ) {
    final List<Announcement> filtered = switch (_reviewFilter) {
      _ReviewFilter.all => apps,
      _ReviewFilter.pending => apps
          .where((Announcement a) => a.reviewStatus == null)
          .toList(),
      _ReviewFilter.approved => apps
          .where((Announcement a) => a.reviewStatus == true)
          .toList(),
      _ReviewFilter.rejected => apps
          .where((Announcement a) => a.reviewStatus == false)
          .toList(),
    };

    return ListView.builder(
      padding: ApAppShell.contentPadding(context),
      itemCount: filtered.length + 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildRulesHint(colorScheme);
        }
        if (index == 1) {
          return _buildReviewFilterChips(colorScheme);
        }
        return _buildItemCard(
          colorScheme,
          _DataType.application,
          filtered[index - 2],
          isLast: index == filtered.length + 1,
        );
      },
    );
  }

  Widget _buildRulesHint(ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.info_outline,
            size: 18,
            color: colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: widget.reviewDescriptionWidget ??
                Text(
                  context.ap.newsRuleDescription2,
                  style: TextStyle(
                    color: colorScheme.onTertiaryContainer,
                    fontSize: 13,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  // ─── Admin Tab View ────────────────────────────────────

  Widget _buildAdminTabView(ColorScheme colorScheme) {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        _buildDataStateList(
          colorScheme,
          applicationState,
          _DataType.application,
          onRetry: _getApplications,
          showReviewFilter: true,
        ),
        _buildDataStateList(
          colorScheme,
          announcementState,
          _DataType.announcement,
          onRetry: _getAnnouncements,
          showTagFilter: true,
        ),
      ],
    );
  }

  Widget _buildDataStateList(
    ColorScheme colorScheme,
    DataState<List<Announcement>> state,
    _DataType dataType, {
    required VoidCallback onRetry,
    bool showTagFilter = false,
    bool showReviewFilter = false,
  }) {
    return switch (state) {
      DataLoading<List<Announcement>>() =>
        const Center(child: CircularProgressIndicator()),
      DataError<List<Announcement>>() => InkWell(
          onTap: onRetry,
          child: HintContent(
            icon: ApIcon.classIcon,
            content: context.ap.clickToRetry,
          ),
        ),
      DataEmpty<List<Announcement>>() => HintContent(
          icon: ApIcon.classIcon,
          content: context.ap.noData,
        ),
      DataLoaded<List<Announcement>>(
        :final List<Announcement> data,
      ) =>
        () {
          List<Announcement> filtered = data;

          if (showReviewFilter) {
            filtered = switch (_reviewFilter) {
              _ReviewFilter.all => filtered,
              _ReviewFilter.pending => filtered
                  .where(
                    (Announcement a) =>
                        a.reviewStatus == null,
                  )
                  .toList(),
              _ReviewFilter.approved => filtered
                  .where(
                    (Announcement a) =>
                        a.reviewStatus == true,
                  )
                  .toList(),
              _ReviewFilter.rejected => filtered
                  .where(
                    (Announcement a) =>
                        a.reviewStatus == false,
                  )
                  .toList(),
            };
          }

          if (showTagFilter && _selectedTag != null) {
            filtered = filtered
                .where(
                  (Announcement a) =>
                      a.tags?.contains(_selectedTag) ??
                      false,
                )
                .toList();
          }

          final bool hasHeader =
              (showTagFilter && _tagsCount.isNotEmpty) ||
                  showReviewFilter;
          final int headerCount = hasHeader ? 1 : 0;

          if (filtered.isEmpty && !hasHeader) {
            return HintContent(
              icon: ApIcon.classIcon,
              content: context.ap.noData,
            );
          }

          return ListView.builder(
            padding: ApAppShell.contentPadding(context),
            itemCount: filtered.length + headerCount,
            itemBuilder: (BuildContext context, int index) {
              if (index < headerCount) {
                return Column(
                  children: <Widget>[
                    if (showReviewFilter)
                      _buildReviewFilterChips(
                        colorScheme,
                      ),
                    if (showTagFilter &&
                        _tagsCount.isNotEmpty)
                      _buildTagFilterChips(colorScheme),
                  ],
                );
              }
              return _buildItemCard(
                colorScheme,
                dataType,
                filtered[index - headerCount],
                isLast: index == filtered.length + headerCount - 1,
              );
            },
          );
        }(),
    };
  }

  Widget _buildReviewFilterChips(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            for (final _ReviewFilter filter
                in _ReviewFilter.values)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(
                    switch (filter) {
                      _ReviewFilter.all => context.ap.all,
                      _ReviewFilter.pending =>
                        context.ap.waitingForReview,
                      _ReviewFilter.approved =>
                        context.ap.reviewApproval,
                      _ReviewFilter.rejected =>
                        context.ap.reviewReject,
                    },
                    style: const TextStyle(fontSize: 12),
                  ),
                  avatar: Icon(
                    switch (filter) {
                      _ReviewFilter.all => null,
                      _ReviewFilter.pending =>
                        Icons.schedule,
                      _ReviewFilter.approved =>
                        Icons.check_circle_outline,
                      _ReviewFilter.rejected =>
                        Icons.cancel_outlined,
                    },
                    size: 16,
                  ),
                  selected: _reviewFilter == filter,
                  selectedColor: switch (filter) {
                    _ReviewFilter.all => null,
                    _ReviewFilter.pending =>
                      colorScheme.tertiary.withAlpha(51),
                    _ReviewFilter.approved =>
                      colorScheme.primary.withAlpha(51),
                    _ReviewFilter.rejected =>
                      colorScheme.error.withAlpha(51),
                  },
                  onSelected: (_) {
                    setState(
                      () => _reviewFilter = filter,
                    );
                  },
                  showCheckmark: false,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagFilterChips(ColorScheme colorScheme) {
    final List<MapEntry<String, int>> sorted =
        _tagsCount.entries.toList()
          ..sort(
            (MapEntry<String, int> a, MapEntry<String, int> b) =>
                b.value.compareTo(a.value),
          );

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            FilterChip(
              label: Text(
                context.ap.all,
                style: const TextStyle(fontSize: 12),
              ),
              selected: _selectedTag == null,
              onSelected: (_) {
                setState(() => _selectedTag = null);
              },
              showCheckmark: false,
            ),
            const SizedBox(width: 8),
            for (final MapEntry<String, int> entry in sorted)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(
                    '${entry.key} (${entry.value})',
                    style: const TextStyle(fontSize: 12),
                  ),
                  selected: _selectedTag == entry.key,
                  selectedColor: tagColor(
                    entry.key,
                    colorScheme,
                  ).withAlpha(51),
                  onSelected: (_) {
                    setState(() {
                      _selectedTag =
                          _selectedTag == entry.key
                              ? null
                              : entry.key;
                    });
                  },
                  showCheckmark: false,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ─── Item Card ─────────────────────────────────────────

  Widget _buildItemCard(
    ColorScheme colorScheme,
    _DataType dataType,
    Announcement item, {
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ApUtils.pushCupertinoStyle(
            context,
            AnnouncementContentPage(announcement: item),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (item.description
                            .isNotEmpty) ...<Widget>[
                          const SizedBox(height: 4),
                          Text(
                            item.description,
                            style: TextStyle(
                              fontSize: 13,
                              color: colorScheme
                                  .onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: <Widget>[
                            if (dataType ==
                                _DataType.application)
                              _buildReviewStatusBadge(
                                colorScheme,
                                item.reviewStatus,
                              ),
                            if (item.applicant != null &&
                                _isAdmin)
                              _buildApplicantBadge(
                                colorScheme,
                                item.applicant!,
                              ),
                            for (final String? tag
                                in item.tags ?? <String>[])
                              if (tag != null)
                                _buildTagBadge(
                                  colorScheme,
                                  tag,
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Thumbnail
                  if (item.imgUrl.isNotEmpty) ...<Widget>[
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8),
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: ApNetworkImage(
                          url: item.imgUrl,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Action buttons
            if (_isAdmin && item.reviewStatus == null)
              _buildActionBar(colorScheme, dataType, item),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewStatusBadge(
    ColorScheme colorScheme,
    bool? reviewStatus,
  ) {
    final Color badgeColor;
    final IconData icon;
    if (reviewStatus == null) {
      badgeColor = colorScheme.tertiary;
      icon = Icons.schedule;
    } else if (reviewStatus) {
      badgeColor = colorScheme.primary;
      icon = Icons.check_circle_outline;
    } else {
      badgeColor = colorScheme.error;
      icon = Icons.cancel_outlined;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: badgeColor.withAlpha(26),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 12, color: badgeColor),
          const SizedBox(width: 4),
          Text(
            _reviewStateText(reviewStatus),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: badgeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicantBadge(
    ColorScheme colorScheme,
    String applicant,
  ) {
    final bool isBanned = _blackListSet.contains(applicant);
    final Color bgColor = isBanned
        ? colorScheme.errorContainer.withAlpha(128)
        : colorScheme.secondaryContainer.withAlpha(128);
    final Color fgColor = isBanned
        ? colorScheme.error
        : colorScheme.onSecondaryContainer;

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: applicant));
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(applicant),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              isBanned
                  ? Icons.person_off_outlined
                  : Icons.person_outline,
              size: 12,
              color: fgColor,
            ),
            const SizedBox(width: 4),
            Text(
              applicant,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: fgColor,
              ),
            ),
            const SizedBox(width: 2),
            Icon(
              Icons.copy,
              size: 10,
              color: fgColor.withAlpha(128),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagBadge(ColorScheme colorScheme, String tag) {
    final Color color = tagColor(tag, colorScheme);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildActionBar(
    ColorScheme colorScheme,
    _DataType dataType,
    Announcement item,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant.withAlpha(77),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        children: <Widget>[
          TextButton.icon(
            onPressed: () => _navigateToEdit(
              dataType == _DataType.announcement
                  ? Mode.edit
                  : Mode.editApplication,
              announcement: item,
            ),
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: Text(context.ap.update),
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.primary,
              textStyle: const TextStyle(fontSize: 13),
            ),
          ),
          if (dataType == _DataType.announcement)
            TextButton.icon(
              onPressed: () => _showDeleteDialog(item),
              icon: const Icon(
                Icons.delete_outline,
                size: 18,
              ),
              label: Text(context.ap.delete),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.error,
                textStyle: const TextStyle(fontSize: 13),
              ),
            ),
          if (dataType == _DataType.application) ...<Widget>[
            TextButton.icon(
              onPressed: () => _showReviewDialog(
                item,
                isApprove: true,
              ),
              icon: const Icon(
                Icons.check_circle_outline,
                size: 18,
              ),
              label: Text(context.ap.approve),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.primary,
                textStyle: const TextStyle(fontSize: 13),
              ),
            ),
            TextButton.icon(
              onPressed: () => _showReviewDialog(
                item,
                isApprove: false,
              ),
              icon: const Icon(
                Icons.cancel_outlined,
                size: 18,
              ),
              label: Text(context.ap.reject),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.error,
                textStyle: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ─── Login ─────────────────────────────────────────────

  Widget _buildLoginContent(ColorScheme colorScheme) {
    return Center(
      child: SingleChildScrollView(
        padding: ApAppShell.contentPadding(
          context,
          spacing: const EdgeInsets.fromLTRB(32, 0, 32, 16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.loginDescriptionWidget ??
                SelectableText.rich(
                  TextSpan(
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: context.ap.newsRuleDescription1(
                          arg1: widget.organizationDomain ?? '',
                        ),
                      ),
                      TextSpan(
                        text: context.ap.newsRuleDescription3,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
            if (widget.enableNormalLogin) ...<Widget>[
              const SizedBox(height: 16),
              TextField(
                controller: _username,
                textInputAction: TextInputAction.next,
                focusNode: usernameFocusNode,
                onSubmitted: (String text) {
                  usernameFocusNode?.unfocus();
                  FocusScope.of(context)
                      .requestFocus(passwordFocusNode);
                },
                decoration: InputDecoration(
                  labelText: context.ap.account,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                textInputAction: TextInputAction.send,
                controller: _password,
                focusNode: passwordFocusNode,
                onSubmitted: (String text) {
                  passwordFocusNode?.unfocus();
                  _login(AnnouncementLoginType.normal);
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.ap.password,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () =>
                      _login(AnnouncementLoginType.normal),
                  child: Text(context.ap.login),
                ),
              ),
            ],
            SizedBox(
              height: widget.enableNormalLogin ? 12.0 : 24.0,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: colorScheme.outline),
                ),
                onPressed: () =>
                    _login(AnnouncementLoginType.google),
                icon: const Icon(Icons.login),
                label: const Text('Sign In with Google'),
              ),
            ),
            if (!kIsWeb &&
                (Platform.isIOS || Platform.isMacOS)) ...<Widget>[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: colorScheme.outline),
                  ),
                  onPressed: () =>
                      _login(AnnouncementLoginType.apple),
                  icon: const Icon(Icons.apple),
                  label: const Text('Sign In with Apple'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─── Dialogs ───────────────────────────────────────────

  void _showDeleteDialog(Announcement item) {
    showDialog(
      context: context,
      builder: (_) => YesNoDialog(
        title: context.ap.deleteNewsTitle,
        contentWidget: Text(
          context.ap.deleteNewsContent,
          textAlign: TextAlign.center,
        ),
        leftActionText: context.ap.determine,
        rightActionText: context.ap.back,
        leftActionFunction: () async {
          final ApiResult<Response<dynamic>> result =
              await AnnouncementHelper.instance
                  .deleteAnnouncement(data: item);
          _handleResult(result, () {
            _getAnnouncements();
          });
        },
      ),
    );
  }

  void _showReviewDialog(
    Announcement item, {
    required bool isApprove,
  }) {
    _reviewDescription.clear();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.ap.reviewApplication),
        content: TextField(
          controller: _reviewDescription,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: context.ap.reviewDescription,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop(),
            child: Text(context.ap.back),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              final ApiResult<Response<dynamic>> result;
              if (isApprove) {
                result = await AnnouncementHelper.instance
                    .approveApplication(
                  applicationId: item.applicationId,
                  reviewDescription: _reviewDescription.text,
                );
              } else {
                result = await AnnouncementHelper.instance
                    .rejectApplication(
                  applicationId: item.applicationId,
                  reviewDescription: _reviewDescription.text,
                );
              }
              _handleResult(result, () {
                _getAnnouncements();
                _getApplications();
              });
            },
            style: isApprove
                ? null
                : FilledButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.error,
                    foregroundColor:
                        Theme.of(context).colorScheme.onError,
                  ),
            child: Text(
              isApprove ? context.ap.approve : context.ap.reject,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Navigation ────────────────────────────────────────

  Future<void> _navigateToEdit(
    Mode mode, {
    Announcement? announcement,
  }) async {
    final dynamic success = await Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (_) => AnnouncementEditPage(
          mode: mode,
          announcement: announcement,
          blackList: _blackListSet,
          applicationDescriptionWidget:
              widget.reviewDescriptionWidget,
          organizationDomain: widget.organizationDomain,
        ),
      ),
    );
    if (success is bool && success) {
      _getAnnouncements();
      _getApplications();
    }
  }

  // ─── Data & State ──────────────────────────────────────

  void _handleResult(
    ApiResult<dynamic> result,
    VoidCallback onSuccess,
  ) {
    if (result.isSuccess) {
      UiUtil.instance
          .showToast(context, context.ap.updateSuccess);
      onSuccess();
    } else {
      result.showErrorToast(context);
    }
  }

  Future<void> _logout() async {
    if (AnnouncementHelper.instance.loginType ==
        AnnouncementLoginType.google) {
      await _googleSignIn.signOut();
    }
    _tabController?.dispose();
    _tabController = null;
    setState(() {
      PreferenceUtil.instance.setBool(
        ApConstants.announcementIsLogin,
        false,
      );
      loginData = null;
      announcementState =
          const DataLoading<List<Announcement>>();
      applicationState =
          const DataLoading<List<Announcement>>();
    });
  }

  Future<void> _getBlackList() async {
    final ApiResult<List<String>> result =
        await AnnouncementHelper.instance.getBlackList();
    if (!mounted) return;
    if (result
        case ApiSuccess<List<String>>(:final List<String> data)) {
      setState(() {
        _blackListSet = data.toSet();
      });
    }
  }

  Future<void> _getTagsCount() async {
    final ApiResult<Map<String, int>> result =
        await AnnouncementHelper.instance.getTagsCount();
    if (!mounted) return;
    if (result
        case ApiSuccess<Map<String, int>>(
          :final Map<String, int> data,
        )) {
      setState(() => _tagsCount = data);
    }
  }

  Future<void> _getAnnouncements() async {
    final ApiResult<List<Announcement>> result =
        await AnnouncementHelper.instance.getAllAnnouncements();
    if (!mounted) return;
    switch (result) {
      case ApiSuccess<List<Announcement>>(
            :final List<Announcement> data,
          ):
        setState(() {
          announcementState = data.isEmpty
              ? const DataEmpty<List<Announcement>>()
              : DataLoaded<List<Announcement>>(data);
        });
      case ApiError<List<Announcement>>():
      case ApiFailure<List<Announcement>>():
        result.showErrorToast(context);
        setState(() {
          announcementState =
              const DataError<List<Announcement>>();
        });
    }
  }

  Future<void> _getApplications() async {
    final ApiResult<List<Announcement>> result =
        await AnnouncementHelper.instance.getApplications();
    if (!mounted) return;
    switch (result) {
      case ApiSuccess<List<Announcement>>(
            :final List<Announcement> data,
          ):
        setState(() {
          applicationState = data.isEmpty
              ? const DataEmpty<List<Announcement>>()
              : DataLoaded<List<Announcement>>(data);
        });
      case ApiError<List<Announcement>>():
      case ApiFailure<List<Announcement>>():
        result.showErrorToast(context);
        setState(() {
          applicationState =
              const DataError<List<Announcement>>();
        });
    }
  }

  Future<void> _getPreference() async {
    if (widget.fcmToken != null) {
      AnnouncementHelper.instance.fcmToken = widget.fcmToken;
    }
    final bool isLogin = PreferenceUtil.instance
        .getBool(ApConstants.announcementIsLogin, false);
    _username.text = PreferenceUtil.instance
        .getString(ApConstants.announcementUsername, '');
    _password.text =
        PreferenceUtil.instance.getStringSecurity(
      ApConstants.announcementPassword,
      '',
    );
    if (isLogin) {
      loginData = AnnouncementLoginData.load();
      if (kDebugMode) {
        log(
          'token is expire = '
          '${loginData?.isExpired} '
          'level = ${loginData!.level} '
          'token = ${loginData!.key}',
        );
      }
      if (_isAdmin) _initTabController();
      if (loginData?.isExpired ?? true) {
        final int index = PreferenceUtil.instance
            .getInt(ApConstants.announcementLoginType, 0);
        _login(AnnouncementLoginType.values[index]);
      } else {
        AnnouncementHelper.instance
            .setAuthorization(loginData!.key);
        setState(() {
          if (_isAdmin) {
            _getAnnouncements();
            _getBlackList();
            _getTagsCount();
          }
          _getApplications();
        });
      }
    } else {
      usernameFocusNode = FocusNode();
      passwordFocusNode = FocusNode();
      setState(() {});
    }
  }

  Future<void> _login(AnnouncementLoginType loginType) async {
    if (loginType == AnnouncementLoginType.normal &&
        (_username.text.isEmpty || _password.text.isEmpty)) {
      UiUtil.instance
          .showToast(context, context.ap.doNotEmpty);
      return;
    }

    final bool isNotLogin = !PreferenceUtil.instance
        .getBool(ApConstants.announcementIsLogin, false);
    if (isNotLogin) {
      showDialog(
        context: context,
        builder: (BuildContext context) => PopScope(
          canPop: false,
          child: ProgressDialog(context.ap.logining),
        ),
        barrierDismissible: false,
      );
    }
    String? idToken = PreferenceUtil.instance.getBool(
      ApConstants.announcementIsLogin,
      false,
    )
        ? PreferenceUtil.instance.getStringSecurity(
            ApConstants.announcementIdToken,
            '',
          )
        : '';

    log('$loginType');

    ApiResult<AnnouncementLoginData>? result;

    switch (loginType) {
      case AnnouncementLoginType.normal:
        PreferenceUtil.instance.setString(
          ApConstants.announcementUsername,
          _username.text,
        );
        result = await AnnouncementHelper.instance.login(
          username: _username.text,
          password: _password.text,
        );
      case AnnouncementLoginType.google:
        try {
          final bool isSignIn =
              await _googleSignIn.isSignedIn();
          final GoogleSignInAccount? data = isSignIn
              ? await _googleSignIn.signInSilently()
              : await _googleSignIn.signIn();
          if (data != null) {
            final GoogleSignInAuthentication authentication =
                await data.authentication;
            idToken = authentication.idToken;
            result = await AnnouncementHelper.instance
                .googleLogin(idToken: idToken);
          } else if (isNotLogin) {
            if (!mounted) return;
            Navigator.of(context, rootNavigator: true).pop();
            return;
          }
        } catch (e, s) {
          if (!mounted) return;
          UiUtil.instance.showToast(
            context,
            context.ap.thirdPartyLoginFail,
          );
          CrashlyticsUtil.instance.recordError(e, s);
          if (isNotLogin) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          return;
        }
      case AnnouncementLoginType.apple:
        try {
          final AuthorizationCredentialAppleID credential =
              await SignInWithApple.getAppleIDCredential(
            scopes: <AppleIDAuthorizationScopes>[
              AppleIDAuthorizationScopes.email,
            ],
          );
          idToken = credential.identityToken;
          result = await AnnouncementHelper.instance
              .appleLogin(idToken: idToken!);
        } catch (e, s) {
          if (!mounted) return;
          UiUtil.instance.showToast(
            context,
            context.ap.thirdPartyLoginFail,
          );
          if (isNotLogin) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          CrashlyticsUtil.instance.recordError(e, s);
          return;
        }
    }

    if (result == null) return;
    if (!mounted) return;

    switch (result) {
      case ApiSuccess<AnnouncementLoginData>(
            :final AnnouncementLoginData data,
          ):
        loginData = data;
        loginData!.save();
        if (kDebugMode) log(data.key);
        if (isNotLogin) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        if (loginType == AnnouncementLoginType.normal) {
          PreferenceUtil.instance.setStringSecurity(
            ApConstants.announcementPassword,
            _password.text,
          );
        } else {
          PreferenceUtil.instance.setStringSecurity(
            ApConstants.announcementIdToken,
            idToken!,
          );
        }
        UiUtil.instance
            .showToast(context, context.ap.loginSuccess);
        PreferenceUtil.instance
            .setBool(ApConstants.announcementIsLogin, true);
        PreferenceUtil.instance.setInt(
          ApConstants.announcementLoginType,
          loginType.index,
        );
        if (_isAdmin) _initTabController();
        setState(() {
          if (_isAdmin) {
            _getAnnouncements();
            _getBlackList();
            _getTagsCount();
          }
          _getApplications();
        });
      case ApiError<AnnouncementLoginData>(
            :final GeneralResponse response,
          ):
        if (isNotLogin) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        UiUtil.instance
            .showToast(context, response.message);
      case ApiFailure<AnnouncementLoginData>(
            :final DioException exception,
          ):
        if (isNotLogin) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        if (exception.i18nMessage
            case final String message?) {
          UiUtil.instance.showToast(context, message);
        }
        if (exception.type ==
                DioExceptionType.badResponse &&
            exception.response!.statusCode == 403) {
          if (loginType == AnnouncementLoginType.google) {
            await _googleSignIn.signOut();
          }
        }
    }
  }
}
