import 'dart:ui' show ImageFilter;

import 'package:ap_common_flutter_ui/src/widgets/liquid_glass_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// One top-level page in an [ApAppShell].
class ApDestination {
  const ApDestination({
    required this.id,
    required this.label,
    required this.icon,
    required this.builder,
    this.selectedIcon,
  });

  final String id;
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final WidgetBuilder builder;
}

/// Owns bottom navigation and preserves a separate route stack per destination.
class ApAppShell extends StatefulWidget {
  const ApAppShell({
    super.key,
    required this.destinations,
    this.initialDestinationId,
    this.canSelectDestination,
  }) : assert(destinations.length >= 2);

  final List<ApDestination> destinations;
  final String? initialDestinationId;
  final Future<bool> Function(String id)? canSelectDestination;

  /// Uses the app's target platform, including platform overrides in tests.
  static bool usesLiquidGlass(BuildContext context) =>
      switch (Theme.of(context).platform) {
        TargetPlatform.iOS || TargetPlatform.macOS => true,
        _ => false,
      };

  /// Space occupied by the shell bar behind scrollable page content.
  static double bottomInset(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<_ApDestinationScope>()
          ?.bottomInset ??
      0;

  /// Padding for scrollable content, including space behind the shell bar.
  static EdgeInsets contentPadding(
    BuildContext context, {
    EdgeInsets spacing = const EdgeInsets.all(16),
  }) =>
      spacing.copyWith(
        bottom: spacing.bottom +
            (context
                    .dependOnInheritedWidgetOfExactType<_ApDestinationScope>()
                    ?.bottomInset ??
                MediaQuery.paddingOf(context).bottom),
      );

  /// Selects a destination from a page inside this shell.
  static Future<void> select(BuildContext context, String id) => context
      .getInheritedWidgetOfExactType<_ApDestinationScope>()!
      .shell
      ._select(id);

  @override
  State<ApAppShell> createState() => _ApAppShellState();
}

class _ApAppShellState extends State<ApAppShell> {
  final Map<String, GlobalKey<NavigatorState>> _navigators =
      <String, GlobalKey<NavigatorState>>{};
  final Map<String, HeroController> _heroControllers =
      <String, HeroController>{};
  final Map<String, bool> _handlesBack = <String, bool>{};

  late String _selectedId = _initialId;
  int _selectionRequest = 0;

  String get _initialId {
    final String? id = widget.initialDestinationId;
    return widget.destinations.any((ApDestination item) => item.id == id)
        ? id!
        : widget.destinations.first.id;
  }

  @override
  void didUpdateWidget(ApAppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    final Set<String> ids = widget.destinations
        .map((ApDestination destination) => destination.id)
        .toSet();
    _navigators.removeWhere((String id, _) => !ids.contains(id));
    _heroControllers.removeWhere((String id, _) => !ids.contains(id));
    _handlesBack.removeWhere((String id, _) => !ids.contains(id));
    if (!ids.contains(_selectedId)) {
      _selectionRequest++;
      _selectedId = _initialId;
    }
  }

  Future<void> _select(String id) async {
    if (!widget.destinations.any((ApDestination item) => item.id == id)) return;
    final int request = ++_selectionRequest;
    if (id == _selectedId) return;
    final bool allowed = await (widget.canSelectDestination?.call(id) ??
        Future<bool>.value(true));
    if (!mounted || request != _selectionRequest || !allowed) return;
    if (!widget.destinations.any((ApDestination item) => item.id == id)) return;
    setState(() => _selectedId = id);
  }

  @override
  Widget build(BuildContext context) {
    final bool usesLiquidGlass = ApAppShell.usesLiquidGlass(context);
    final int index = widget.destinations.indexWhere(
      (ApDestination destination) => destination.id == _selectedId,
    );
    final bool nestedBack = _handlesBack[_selectedId] ?? false;
    final bool showControls = MediaQuery.viewInsetsOf(context).bottom == 0;
    final Widget body = Builder(
      builder: (BuildContext bodyContext) {
        final MediaQueryData mediaQuery = MediaQuery.of(bodyContext);
        final double bottomInset =
            showControls ? mediaQuery.padding.bottom : 0;
        return MediaQuery(
          data: mediaQuery.copyWith(
            padding: mediaQuery.padding.copyWith(bottom: 0),
            viewPadding: mediaQuery.viewPadding.copyWith(bottom: bottomInset),
          ),
          child: IndexedStack(
            index: index,
            children: <Widget>[
              for (final ApDestination destination in widget.destinations)
                _buildDestination(destination, usesLiquidGlass, bottomInset),
            ],
          ),
        );
      },
    );
    return PopScope<Object?>(
      canPop: !nestedBack && _selectedId == _initialId,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) return;
        if (_handlesBack[_selectedId] ?? false) {
          _navigators[_selectedId]?.currentState?.maybePop(result);
        } else if (_selectedId != _initialId) {
          _selectionRequest++;
          setState(() => _selectedId = _initialId);
        }
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: body,
        bottomNavigationBar: !showControls
            ? null
            : usesLiquidGlass
                ? LiquidGlassTabBar(
                    currentIndex: index,
                    onTap: _selectIndex,
                    items: <LiquidGlassTabItem>[
                      for (final ApDestination item in widget.destinations)
                        LiquidGlassTabItem(
                          icon: item.icon,
                          activeIcon: item.selectedIcon,
                          label: item.label,
                        ),
                    ],
                  )
                : ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: NavigationBar(
                        elevation: 0,
                        backgroundColor: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withValues(alpha: 0.55),
                        surfaceTintColor: Colors.transparent,
                        selectedIndex: index,
                        onDestinationSelected: _selectIndex,
                        animationDuration:
                            MediaQuery.disableAnimationsOf(context)
                                ? Duration.zero
                                : null,
                        destinations: <NavigationDestination>[
                          for (final ApDestination item in widget.destinations)
                            NavigationDestination(
                              icon: Icon(item.icon),
                              selectedIcon:
                                  Icon(item.selectedIcon ?? item.icon),
                              label: item.label,
                            ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  void _selectIndex(int index) {
    _select(widget.destinations[index].id);
  }

  Widget _buildDestination(
    ApDestination destination,
    bool usesLiquidGlass,
    double bottomInset,
  ) {
    final String id = destination.id;
    final bool active = _selectedId == id;
    if (!active && !_navigators.containsKey(id)) {
      return SizedBox.shrink(key: ValueKey<String>(id));
    }
    final GlobalKey<NavigatorState> key = _navigators.putIfAbsent(
      id,
      GlobalKey<NavigatorState>.new,
    );

    return TickerMode(
      key: ValueKey<String>(id),
      enabled: active,
      child: ExcludeFocus(
        excluding: !active,
        child: _ApDestinationScope(
          shell: this,
          destination: destination,
          bottomInset: bottomInset,
          child: NotificationListener<NavigationNotification>(
            onNotification: (NavigationNotification notification) {
              if (_handlesBack[id] != notification.canHandlePop) {
                setState(() => _handlesBack[id] = notification.canHandlePop);
              }
              return true;
            },
            child: Navigator(
              key: key,
              observers: <NavigatorObserver>[
                _heroControllers.putIfAbsent(
                  id,
                  usesLiquidGlass
                      ? CupertinoApp.createCupertinoHeroController
                      : MaterialApp.createMaterialHeroController,
                ),
              ],
              onGenerateRoute: (RouteSettings settings) {
                if (settings.name != Navigator.defaultRouteName) return null;
                Widget buildPage(BuildContext context) {
                  final _ApDestinationScope scope = context
                      .dependOnInheritedWidgetOfExactType<
                          _ApDestinationScope>()!;
                  return SizedBox.expand(
                    child: ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: scope.destination.builder(context),
                    ),
                  );
                }

                return usesLiquidGlass
                    ? CupertinoPageRoute<void>(
                        settings: settings,
                        builder: buildPage,
                      )
                    : MaterialPageRoute<void>(
                        settings: settings,
                        builder: buildPage,
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ApDestinationScope extends InheritedWidget {
  const _ApDestinationScope({
    required this.shell,
    required this.destination,
    required this.bottomInset,
    required super.child,
  });

  final _ApAppShellState shell;
  final ApDestination destination;
  final double bottomInset;

  @override
  bool updateShouldNotify(_ApDestinationScope oldWidget) =>
      destination != oldWidget.destination ||
      bottomInset != oldWidget.bottomInset;
}
