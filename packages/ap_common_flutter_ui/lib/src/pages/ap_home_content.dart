import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:ap_common_flutter_ui/src/scaffold/ap_page_scaffold.dart';
import 'package:ap_common_flutter_ui/src/scaffold/home_page_scaffold.dart';
import 'package:ap_common_flutter_ui/src/theme/liquid_glass_theme.dart';
import 'package:ap_common_flutter_ui/src/widgets/home_dashboard_widgets.dart';
import 'package:ap_common_flutter_ui/src/widgets/page_content_widgets.dart';
import 'package:flutter/material.dart';

/// App-provided text for the shared home layout.
@immutable
class ApHomeContentLabels {
  const ApHomeContentLabels({
    required this.loginTitle,
    required this.loginSubtitle,
    required this.latestAnnouncements,
    required this.postAnnouncement,
    required this.courseNotLoaded,
  });

  final String loginTitle;
  final String loginSubtitle;
  final String latestAnnouncements;
  final String postAnnouncement;
  final String courseNotLoaded;
}

/// Home content with account access, schedule state, and announcements.
///
/// Apps supply data, localized text, and navigation callbacks.
/// Additional entries can link to other app features.
class ApHomeContent extends StatelessWidget {
  const ApHomeContent({
    super.key,
    required this.title,
    required this.labels,
    this.subtitle,
    this.additionalEntries = const <Widget>[],
    this.dashboardWidgets = const <Widget>[],
    required this.isLogin,
    required this.userInfo,
    required this.displayPicture,
    required this.announcementState,
    required this.announcements,
    this.announcementExcerpt,
    required this.courseData,
    required this.onAvatarTap,
    required this.onLoginTap,
    required this.onOpenCourse,
    required this.onOpenAnnouncementReview,
    required this.onAnnouncementTap,
    required this.onRefreshAnnouncements,
  });
  static const Key loginCardKey = ValueKey<String>('home_login_prompt_card');

  final String title;
  final String? subtitle;
  final ApHomeContentLabels labels;
  final List<Widget> additionalEntries;
  final List<Widget> dashboardWidgets;
  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final HomeState announcementState;
  final List<Announcement> announcements;

  /// Formats the card summary. Defaults to the announcement description.
  final String Function(Announcement)? announcementExcerpt;
  final CourseData? courseData;
  final VoidCallback onAvatarTap;
  final VoidCallback onLoginTap;
  final VoidCallback onOpenCourse;
  final VoidCallback onOpenAnnouncementReview;
  final ValueChanged<Announcement> onAnnouncementTap;
  final Future<void> Function() onRefreshAnnouncements;
  @override
  Widget build(BuildContext context) {
    final String? userName = userInfo?.name;
    final String? accountName =
        (isLogin && userName != null && userName.isNotEmpty) ? userName : null;
    final String? resolvedSubtitle = subtitle ?? accountName;

    return ApPageScaffold.scrollable(
      title: title,
      subtitle: resolvedSubtitle,
      isLogin: isLogin,
      userInfo: userInfo,
      displayPicture: displayPicture,
      onAvatarTap: onAvatarTap,
      onRefresh: onRefreshAnnouncements,
      children: <Widget>[
        ...dashboardWidgets,
        _buildScheduleOrLoginSection(context),
        _buildAnnouncementsSection(context),
        ...additionalEntries,
      ],
    );
  }

  Widget _buildScheduleOrLoginSection(BuildContext context) {
    if (!isLogin) {
      return _buildInlineLoginCard(context);
    }
    if (courseData?.courses.isNotEmpty ?? false) {
      return TodayScheduleCard(
        courseData: courseData!,
        onTap: onOpenCourse,
      );
    }
    return _buildEmptyScheduleCard(context);
  }

  Widget _buildInlineLoginCard(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LiquidGlassTheme glass = LiquidGlassTheme.of(context);
    final Color primary = theme.colorScheme.primary;
    final Color onSurface = theme.colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        key: loginCardKey,
        decoration: BoxDecoration(
          color: glass.cardBackgroundColor,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: glass.subtleBorderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(ApIcon.school, color: primary, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      labels.loginTitle,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                labels.loginSubtitle,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: onSurface.withValues(alpha: 0.68),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 44,
                child: FilledButton.icon(
                  onPressed: onLoginTap,
                  icon: Icon(ApIcon.exitToApp, size: 18),
                  label: Text(
                    context.ap.login,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: FilledButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyScheduleCard(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LiquidGlassTheme glass = LiquidGlassTheme.of(context);
    final Color onSurface = theme.colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: glass.cardBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: glass.subtleBorderColor),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onOpenCourse,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      ApIcon.calendarToday,
                      size: 22,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      courseData == null
                          ? labels.courseNotLoaded
                          : context.ap.courseEmpty,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: onSurface.withValues(alpha: 0.78),
                      ),
                    ),
                  ),
                  Icon(
                    ApIcon.chevronRight,
                    color: onSurface.withValues(alpha: 0.42),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnnouncementsSection(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppleSectionHeader(
          title: labels.latestAnnouncements,
          titleColor: theme.colorScheme.primary,
          trailing: TextButton.icon(
            onPressed: onOpenAnnouncementReview,
            icon: Icon(ApIcon.edit, size: 18),
            label: Text(
              labels.postAnnouncement,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(
              minimumSize: const Size(44, 44),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
        _buildAnnouncementsBody(context),
      ],
    );
  }

  Widget _buildAnnouncementsBody(BuildContext context) {
    final LiquidGlassTheme glass = LiquidGlassTheme.of(context);
    final ThemeData theme = Theme.of(context);

    switch (announcementState) {
      case HomeState.loading:
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Center(child: CircularProgressIndicator()),
        );
      case HomeState.error:
      case HomeState.empty:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: glass.cardBackgroundColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: glass.subtleBorderColor),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onRefreshAnnouncements,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        announcementState == HomeState.empty
                            ? ApIcon.fiberNew
                            : ApIcon.error,
                        size: 40,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.45,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        announcementState == HomeState.empty
                            ? context.ap.noData
                            : context.ap.clickToRetry,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.68,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      case HomeState.finish:
      case HomeState.offline:
        if (announcements.isEmpty) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: announcements.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
            itemBuilder: (BuildContext context, int index) {
              final Announcement item = announcements[index];
              return _AnnouncementHeroCard(
                announcement: item,
                excerpt: announcementExcerpt?.call(item) ?? item.description,
                onTap: () => onAnnouncementTap(item),
              );
            },
          ),
        );
    }
  }
}

class _AnnouncementHeroCard extends StatelessWidget {
  const _AnnouncementHeroCard({
    required this.announcement,
    required this.excerpt,
    required this.onTap,
  });
  final Announcement announcement;
  final String excerpt;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LiquidGlassTheme glass = LiquidGlassTheme.of(context);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double cardWidth = (screenWidth - 56).clamp(240.0, 340.0);

    return SizedBox(
      width: cardWidth,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: glass.cardBackgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: glass.subtleBorderColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  if (announcement.imgUrl.isNotEmpty)
                    Image.network(
                      announcement.imgUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) =>
                          _buildFallbackBackdrop(theme),
                    )
                  else
                    _buildFallbackBackdrop(theme),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withValues(alpha: 0.08),
                          Colors.black.withValues(alpha: 0.35),
                          Colors.black.withValues(alpha: 0.85),
                        ],
                        stops: const <double>[0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          announcement.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                        if (excerpt.isNotEmpty) ...<Widget>[
                          const SizedBox(height: 6),
                          Text(
                            excerpt,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.82),
                              height: 1.35,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackBackdrop(ThemeData theme) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            theme.colorScheme.primary.withValues(alpha: 0.75),
            theme.colorScheme.primaryContainer.withValues(alpha: 0.55),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          ApIcon.fiberNew,
          size: 56,
          color: Colors.white.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}
