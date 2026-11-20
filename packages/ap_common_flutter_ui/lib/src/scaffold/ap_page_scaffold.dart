import 'dart:ui' show ImageFilter;

import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:ap_common_flutter_ui/src/scaffold/ap_app_shell.dart';
import 'package:ap_common_flutter_ui/src/widgets/page_content_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Shared page structure for compact and collapsing navigation headers.
class ApPageScaffold extends StatelessWidget {
  ApPageScaffold({
    super.key,
    required Widget? title,
    required Widget body,
    List<Widget> actions = const <Widget>[],
    PreferredSizeWidget? bottom,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    Widget? drawer,
    Color? backgroundColor,
    GlobalKey<ScaffoldState>? scaffoldKey,
    bool resizeToAvoidBottomInset = true,
  }) : _page = Builder(
          builder: (BuildContext context) {
            final ThemeData theme = Theme.of(context);
            final Color foreground = theme.colorScheme.onSurface;
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: backgroundColor,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              drawer: drawer,
              appBar: title == null
                  ? null
                  : AppBar(
                      toolbarHeight: 44,
                      centerTitle: false,
                      leadingWidth: 44,
                      titleSpacing: leading != null ||
                              (automaticallyImplyLeading &&
                                  (Navigator.of(context).canPop() ||
                                      drawer != null))
                          ? 0
                          : 16,
                      title: title,
                      titleTextStyle: theme.textTheme.titleMedium?.copyWith(
                        color: foreground,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      foregroundColor: foreground,
                      backgroundColor:
                          (backgroundColor ?? theme.scaffoldBackgroundColor)
                              .withValues(
                        alpha: MediaQuery.highContrastOf(context) ? 1 : 0.8,
                      ),
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      surfaceTintColor: Colors.transparent,
                      automaticallyImplyLeading: automaticallyImplyLeading,
                      leading: leading ??
                          (automaticallyImplyLeading &&
                                  Navigator.of(context).canPop()
                              ? IconButton(
                                  icon: Icon(ApIcon.chevronLeft),
                                  tooltip: MaterialLocalizations.of(context)
                                      .backButtonTooltip,
                                  onPressed: () =>
                                      Navigator.of(context).maybePop(),
                                )
                              : null),
                      actions: actions,
                      bottom: bottom,
                      flexibleSpace: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: MediaQuery.highContrastOf(context) ? 0 : 12,
                            sigmaY: MediaQuery.highContrastOf(context) ? 0 : 12,
                          ),
                          child: const SizedBox.expand(),
                        ),
                      ),
                    ),
              body: body,
              floatingActionButton: floatingActionButton,
              bottomNavigationBar: bottomNavigationBar == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(
                        bottom: ApAppShell.bottomInset(context),
                      ),
                      child: bottomNavigationBar,
                    ),
            );
          },
        );

  ApPageScaffold.scrollable({
    super.key,
    required String title,
    String? subtitle,
    required bool isLogin,
    required UserInfo? userInfo,
    bool displayPicture = true,
    required VoidCallback onAvatarTap,
    required List<Widget> children,
    Future<void> Function()? onRefresh,
  }) : _page = _ApScrollablePage(
          title: title,
          subtitle: subtitle,
          isLogin: isLogin,
          userInfo: userInfo,
          displayPicture: displayPicture,
          onAvatarTap: onAvatarTap,
          onRefresh: onRefresh,
          children: children,
        );

  ApPageScaffold.collapsing({
    super.key,
    required String title,
    required WidgetBuilder builder,
    List<Widget> actions = const <Widget>[],
    PreferredSizeWidget? bottom,
    ScrollController? controller,
  }) : _page = _ApNestedPage(
          title: title,
          builder: builder,
          actions: actions,
          bottom: bottom,
          controller: controller,
        );

  final Widget _page;

  @override
  Widget build(BuildContext context) => _page;
}

/// A pinned large-title navigation bar and its scrollable page content.
class _ApScrollablePage extends StatelessWidget {
  const _ApScrollablePage({
    required this.title,
    this.subtitle,
    required this.isLogin,
    required this.userInfo,
    this.displayPicture = true,
    required this.onAvatarTap,
    required this.children,
    this.onRefresh,
  });

  final String title;
  final String? subtitle;
  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final VoidCallback onAvatarTap;
  final List<Widget> children;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Widget scrollView = CupertinoTheme(
      data: CupertinoThemeData(
        brightness: theme.brightness,
        primaryColor: theme.colorScheme.primary,
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          navLargeTitleTextStyle: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            automaticallyImplyTitle: false,
            transitionBetweenRoutes: false,
            stretch: !MediaQuery.disableAnimationsOf(context),
            backgroundColor: theme.scaffoldBackgroundColor.withValues(
              alpha: MediaQuery.highContrastOf(context) ? 1 : 0.8,
            ),
            border: null,
            largeTitle: Text(title),
            alwaysShowMiddle: false,
            middle: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Navigator.of(context).canPop() ? 0 : 10,
                ),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            trailing: SizedBox.square(
              dimension: 44,
              child: ProfileAvatarButton(
                isLogin: isLogin,
                userInfo: userInfo,
                displayPicture: displayPicture,
                onTap: onAvatarTap,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AppleContentContainer(
              child: Padding(
                padding: ApAppShell.contentPadding(
                  context,
                  spacing: EdgeInsets.only(
                    top: subtitle != null && subtitle!.isNotEmpty ? 4 : 16,
                    bottom: 16,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (subtitle != null && subtitle!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          subtitle!,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ...children,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    if (onRefresh != null) {
      scrollView = RefreshIndicator(
        onRefresh: onRefresh!,
        child: scrollView,
      );
    }
    return SafeArea(top: false, bottom: false, child: scrollView);
  }
}

/// Coordinates a collapsing title with an existing scrollable Scaffold body.
class _ApNestedPage extends StatelessWidget {
  const _ApNestedPage({
    required this.title,
    required this.builder,
    this.actions = const <Widget>[],
    this.bottom,
    this.controller,
  });

  final String title;
  final WidgetBuilder builder;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: theme.brightness,
        primaryColor: theme.colorScheme.primary,
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          navLargeTitleTextStyle: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            automaticallyImplyTitle: false,
            transitionBetweenRoutes: false,
            stretch: !MediaQuery.disableAnimationsOf(context),
            backgroundColor: theme.scaffoldBackgroundColor.withValues(
              alpha: MediaQuery.highContrastOf(context) ? 1 : 0.8,
            ),
            border: null,
            largeTitle: Text(title),
            alwaysShowMiddle: false,
            middle: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Navigator.of(context).canPop() ? 0 : 10,
                ),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            leading: Navigator.of(context).canPop()
                ? IconButton(
                    icon: Icon(ApIcon.chevronLeft),
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () => Navigator.of(context).maybePop(),
                  )
                : null,
            trailing: actions.isEmpty
                ? null
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.72,
                    ),
                    child: SizedBox(
                      height: 44,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: actions,
                        ),
                      ),
                    ),
                  ),
            bottom: bottom,
          ),
        ],
        body: Builder(builder: builder),
      ),
    );
  }
}
