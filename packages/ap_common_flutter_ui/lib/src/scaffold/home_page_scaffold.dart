import 'dart:async';
import 'dart:io';

import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Represents the current loading state of the [HomePageScaffold].
enum HomeState { loading, finish, error, empty, offline }

/// A scaffold widget designed for the home page of an app.
///
/// Features a carousel of announcements, optional dashboard widgets,
/// and responsive layouts for mobile and tablet devices.

class HomePageScaffold extends StatefulWidget {
  /// Creates a new instance of [HomePageScaffold].
  const HomePageScaffold({
    super.key,
    required this.state,
    required this.announcements,
    required this.isLogin,
    this.actions,
    this.onTabTapped,
    this.bottomNavigationBarItems,
    this.drawer,
    this.content,
    this.floatingActionButton,
    this.title,
    this.onImageTapped,
    this.autoPlay = true,
    this.autoPlayDuration = const Duration(milliseconds: 5000),
    this.dashboardWidgets,
    this.carouselHeight,
  });

  /// Creates a [HomePageScaffold] from a [DataState<List<Announcement>>].
  ///
  /// ```dart
  /// HomePageScaffold.fromDataState(
  ///   dataState: DataLoaded(announcements),
  ///   isLogin: true,
  ///   drawer: myDrawer,
  /// )
  /// ```
  HomePageScaffold.fromDataState({
    super.key,
    required DataState<List<Announcement>> dataState,
    required this.isLogin,
    this.actions,
    this.onTabTapped,
    this.bottomNavigationBarItems,
    this.drawer,
    this.content,
    this.floatingActionButton,
    this.title,
    this.onImageTapped,
    this.autoPlay = true,
    this.autoPlayDuration = const Duration(milliseconds: 5000),
    this.dashboardWidgets,
    this.carouselHeight,
  })  : state = dataState.when(
          loading: () => HomeState.loading,
          loaded: (_, __) => HomeState.finish,
          error: (_) => HomeState.error,
          empty: (_) => HomeState.empty,
        ),
        announcements = dataState.dataOrNull ?? <Announcement>[];

  /// The current state of the home page (e.g., loading, finish, error).
  final HomeState state;

  /// The text displayed in the AppBar.
  final String? title;

  /// The list of announcements to display in the carousel.
  final List<Announcement> announcements;

  /// A list of Widgets to display in a row after the title in the AppBar.
  final List<Widget>? actions;

  /// The interactive items displayed in the BottomNavigationBar.
  final List<Widget>? bottomNavigationBarItems;

  /// Callback invoked when a tab in the bottom navigation bar is tapped.
  final Function(int index)? onTabTapped;

  /// Callback invoked when an announcement image is tapped.
  final Function(Announcement announcement)? onImageTapped;

  /// A panel displayed to the side of the body, often hidden on mobile devices.
  final Widget? drawer;

  final Widget? content;

  /// A button displayed floating above the body.
  final Widget? floatingActionButton;

  /// Indicates whether the user is currently logged in.
  final bool isLogin;

  /// auto cycle for announcement carousel
  final bool autoPlay;

  /// The duration between automatic transitions in the carousel.
  final Duration autoPlayDuration;

  /// Additional widgets displayed below the carousel in a scrollable
  /// dashboard layout. When provided, the carousel is given a fixed
  /// height and the entire content area becomes scrollable.
  ///
  /// When `null`, the original full-screen carousel layout is used.
  final List<Widget>? dashboardWidgets;

  /// Fixed height for the carousel when [dashboardWidgets] is set.
  /// Defaults to 260 in portrait and 180 in landscape.
  final double? carouselHeight;

  @override
  HomePageScaffoldState createState() => HomePageScaffoldState();
}

/// State for [HomePageScaffold].
class HomePageScaffoldState extends State<HomePageScaffold> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  PageController? pageController;

  int _currentNewsIndex = 0;

  Timer? _timer;

  /// Returns true if the device is considered a tablet based on screen width.
  bool get isTablet => MediaQuery.of(context).size.shortestSide >= 680;

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (Platform.isAndroid) {
          _showLogoutDialog();
        } else {
          SystemNavigator.pop();
        }
      },
      child: ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: ApPageScaffold(
          title: isTablet ? null : Text(widget.title ?? ''),
          actions: widget.actions ?? const <Widget>[],
          drawer: isTablet ? null : widget.drawer,
          floatingActionButton: widget.floatingActionButton,
          body: Row(
            children: <Widget>[
              if (isTablet && widget.drawer != null) widget.drawer!,
              Expanded(
                child: (isTablet && widget.content != null)
                    ? widget.content!
                    : OrientationBuilder(
                        builder: (_, Orientation orientation) {
                          final bool hasDash =
                              widget.dashboardWidgets != null &&
                                  widget.dashboardWidgets!.isNotEmpty;
                          final double vPad =
                              orientation == Orientation.portrait
                                  ? (hasDash ? 12.0 : 32.0)
                                  : 4.0;
                          final double shellInset = _shellBottomInset;
                          final bool scrollsVertically = widget.state ==
                                  HomeState.finish &&
                              hasDash &&
                              (orientation == Orientation.portrait || isTablet);
                          return Container(
                            padding: EdgeInsets.only(
                              top: vPad,
                              bottom: shellInset > 0 && scrollsVertically
                                  ? 0
                                  : vPad + shellInset,
                            ),
                            alignment: Alignment.center,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: KeyedSubtree(
                                key: ValueKey<HomeState>(widget.state),
                                child: _homebody(orientation),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
          bottomNavigationBar:
              (widget.bottomNavigationBarItems == null || isTablet)
                  ? null
                  : NavigationBar(
                      elevation: 12.0,
                      height: 56,
                      indicatorColor: const Color(0x00000000),
                      onDestinationSelected: widget.onTabTapped,
                      destinations: widget.bottomNavigationBarItems!,
                    ),
        ),
      ),
    );
  }

  /// Sets up the timer for automatically switching carousel pages.
  void setTimer() {
    if (widget.autoPlay) {
      _timer = Timer.periodic(
        widget.autoPlayDuration,
        (Timer timer) {
          if (widget.state == HomeState.finish &&
              widget.announcements.length > 1 &&
              pageController!.hasClients) {
            setState(() {
              _currentNewsIndex++;
              if (_currentNewsIndex >= widget.announcements.length) {
                _currentNewsIndex = 0;
              }
              pageController?.animateToPage(
                _currentNewsIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuint,
              );
            });
          }
        },
      );
    }
  }

  /// Builds the original full-screen carousel layout.
  ///
  /// This layout is used when [dashboardWidgets] is not provided.
  ///
  /// Layout Separation:
  /// - Mobile Landscape: Uses a side-by-side layout with image
  ///   on the left and title on the right.
  /// - Mobile Portrait & Tablet: Uses a vertical layout with title
  ///   above or below the image.
  Widget _buildCarouselLayout(Orientation orientation) {
    if (orientation == Orientation.landscape && !isTablet) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _buildLandscapePhonePageView(orientation),
          ),
          const SizedBox(height: 8.0),
          _buildPageIndicator(),
          const SizedBox(height: 16.0),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildAnnouncementTitle(),
        const Hero(
          tag: ApConstants.tagAnnouncementIcon,
          child: Icon(Icons.arrow_drop_down),
        ),
        Expanded(
          child: _buildPageView(orientation),
        ),
        SizedBox(
          height: orientation == Orientation.portrait ? 16.0 : 4.0,
        ),
        _buildPageIndicator(),
        SizedBox(
          height: orientation == Orientation.portrait ? 24.0 : 0.0,
        ),
      ],
    );
  }

  /// Builds the dashboard layout with carousel and widgets.
  ///
  /// The top section is a fixed-height carousel and the bottom
  /// section contains scrollable [dashboardWidgets].
  ///
  /// Layout Separation:
  /// - Mobile Landscape: Falls back to side-by-side layout due to
  ///   limited vertical space.
  /// - Mobile Portrait & Tablet: Uses [CustomScrollView] with
  ///   fixed-height carousel at top and scrollable widgets below.
  Widget _buildDashboardLayout(Orientation orientation) {
    final bool isPortrait = orientation == Orientation.portrait;

    if (!isPortrait && !isTablet) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _buildLandscapePhonePageView(orientation),
          ),
          const SizedBox(height: 8.0),
          _buildPageIndicator(),
          const SizedBox(height: 16.0),
        ],
      );
    }

    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate available height by subtracting fixed UI heights:
    // - AppBar: 56, BottomNavigationBar: 56
    // - Status bar/SafeArea: 44, Extra margin/padding: 60
    final double available = screenHeight - 56 - 56 - 44 - 60;

    // Allocate 60% of available height to carousel, bounded
    // between 240 and 600 for reasonable visual proportion.
    final double carouselH =
        widget.carouselHeight ?? (available * 0.6).clamp(240.0, 600.0);

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return widget.dashboardWidgets![index];
            },
            childCount: widget.dashboardWidgets!.length,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: _shellBottomInset > 0
                  ? _shellBottomInset + (isPortrait ? 12 : 4)
                  : 0,
            ),
            child: Column(
              mainAxisAlignment:
                  isTablet ? MainAxisAlignment.center : MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 8.0),
                SizedBox(
                  height: carouselH,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: _buildPageView(orientation),
                      ),
                      _buildAnnouncementTitle(),
                      const SizedBox(height: 4),
                      _buildPageIndicator(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // A local bottom bar already constrains this Scaffold's body. Reserve the
  // shell overlay only when this page does not provide its own bottom bar.
  double get _shellBottomInset =>
      widget.bottomNavigationBarItems != null && !isTablet
          ? 0
          : ApAppShell.bottomInset(context);

  /// Builds the title widget for the current announcement.
  ///
  /// Wraps the text in a [Hero] widget using
  /// [ApConstants.tagAnnouncementTitle] to support smooth
  /// transition animations when navigating to a detail page.
  Widget _buildAnnouncementTitle() {
    return Hero(
      tag: ApConstants.tagAnnouncementTitle,
      child: Material(
        color: const Color(0x00000000),
        child: Text(
          widget.announcements[_currentNewsIndex].title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// Builds the specialized PageView for mobile landscape.
  ///
  /// Designed for mobile landscape where vertical height is
  /// limited. Uses a [Row] to split the screen into two halves:
  /// - `Flex 1` (Left): Announcement image.
  /// - `Flex 1` (Right): Centered announcement title.
  Widget _buildLandscapePhonePageView(Orientation orientation) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.announcements.length,
      itemBuilder: (BuildContext context, int currentIndex) {
        final bool active = currentIndex == _currentNewsIndex;
        final Announcement announcement = widget.announcements[currentIndex];

        Widget titleWidget = Text(
          announcement.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        );

        if (active) {
          titleWidget = Hero(
            tag: ApConstants.tagAnnouncementTitle,
            child: Material(
              color: const Color(0x00000000),
              child: titleWidget,
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: _newsImage(
                announcement,
                orientation,
                active,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: titleWidget,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Builds the standard PageView for mobile portrait and tablet layouts.
  ///
  /// Designed for mobile portrait and tablet (both orientations).
  /// The image takes up the full width of its container, while the title
  /// is usually arranged vertically by an external Column.
  Widget _buildPageView(Orientation orientation) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.announcements.length,
      itemBuilder: (BuildContext context, int currentIndex) {
        final bool active = currentIndex == _currentNewsIndex;
        return _newsImage(
          widget.announcements[currentIndex],
          orientation,
          active,
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Semantics(
      liveRegion: true,
      label:
          // ignore: lines_longer_than_80_chars
          '${_currentNewsIndex + 1} / ${widget.announcements.length}',
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 24.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text:
                  // ignore: lines_longer_than_80_chars
                  '${widget.announcements.length >= 10 && _currentNewsIndex < 9 ? '0' : ''}'
                  '${_currentNewsIndex + 1}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextSpan(
              text: ' / ${widget.announcements.length}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _newsImage(
    Announcement announcement,
    Orientation orientation,
    bool active,
  ) {
    return GestureDetector(
      onTap: () {
        widget.onImageTapped?.call(announcement);
        AnalyticsUtil.instance.logEvent('announcement_image_click');
      },
      onTapDown: (TapDownDetails detail) {
        _timer?.cancel();
      },
      onTapUp: (TapUpDetails detail) {
        setTimer();
      },
      onTapCancel: () {
        setTimer();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *
              (isTablet ? (active ? 0.02 : 0.08) : (active ? 0.05 : 0.15)),
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Hero(
          tag: announcement.hashCode,
          child: ApNetworkImage(
            url: announcement.imgUrl,
          ),
        ),
      ),
    );
  }

  /// Determines which layout to render based on state and orientation.
  ///
  /// Viewport Fraction Logic:
  /// - Mobile Portrait: `0.65` (Shows edges of adjacent cards).
  /// - Mobile Landscape: `0.95` (Nearly full screen due to
  ///   side-by-side layout).
  /// - Tablet Portrait: `0.8` (Larger screen balance).
  /// - Tablet Landscape: `0.7` (Optimized for wide aspect ratios).
  Widget _homebody(Orientation orientation) {
    double viewportFraction = 0.65;
    if (orientation == Orientation.portrait) {
      viewportFraction = isTablet ? 0.8 : 0.65;
    } else if (orientation == Orientation.landscape) {
      viewportFraction = isTablet ? 0.7 : 0.95;
    }
    pageController = PageController(viewportFraction: viewportFraction);
    pageController!.addListener(() {
      final int next = pageController!.page!.round();
      if (_currentNewsIndex != next) {
        setState(() {
          _currentNewsIndex = next;
        });
      }
    });
    switch (widget.state) {
      case HomeState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case HomeState.finish:
        final bool hasDashboard = widget.dashboardWidgets != null &&
            widget.dashboardWidgets!.isNotEmpty;

        if (hasDashboard) {
          return _buildDashboardLayout(orientation);
        }
        return _buildCarouselLayout(orientation);
      case HomeState.offline:
        return HintContent(
          icon: ApIcon.offlineBolt,
          content: context.ap.offlineMode,
        );
      case HomeState.empty:
        return HintContent(
          icon: ApIcon.offlineBolt,
          content: context.ap.announcementEmpty,
        );
      case HomeState.error:
        return HintContent(
          icon: ApIcon.offlineBolt,
          content: context.ap.somethingError,
        );
    }
  }

  /// Displays a dialog asking the user to confirm exiting/closing the app.
  void _showLogoutDialog() {
    final ApLocalizations l10n = context.ap;
    showDialog(
      context: context,
      builder: (BuildContext context) => YesNoDialog(
        title: l10n.closeAppTitle,
        contentWidget: Text(
          l10n.closeAppHint,
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        leftActionText: l10n.cancel,
        rightActionText: l10n.confirm,
        rightActionFunction: () {
          AnalyticsUtil.instance.logEvent('logout_dialog_confirm');
          SystemNavigator.pop();
        },
      ),
    );
    AnalyticsUtil.instance.logEvent('logout_dialog_open');
  }

  /// Hides the currently visible SnackBar, if any.
  void hideSnackBar() {
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  /// Shows a brief hint via SnackBar with a standard 2-second duration.
  void showBasicHint({required String text}) {
    showSnackBar(
      text: text,
      duration: const Duration(seconds: 2),
    );
  }

  /// Displays a customizable SnackBar.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar({
    required String text,
    String? actionText,
    Function()? onSnackBarTapped,
    Duration? duration,
  }) {
    return _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: duration ?? const Duration(days: 1),
        action: actionText == null
            ? null
            : SnackBarAction(
                onPressed: onSnackBarTapped!,
                label: actionText,
              ),
      ),
    );
  }
}
