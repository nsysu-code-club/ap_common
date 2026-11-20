import 'dart:math' as math;

import 'package:ap_common_flutter_ui/src/theme/liquid_glass_theme.dart';
import 'package:ap_common_flutter_ui/src/widgets/liquid_glass_surface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class LiquidGlassTabItem {
  const LiquidGlassTabItem({
    required this.icon,
    this.activeIcon,
    required this.label,
    this.semanticsLabel,
  });

  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final String? semanticsLabel;
}

class LiquidGlassTabBar extends StatelessWidget {
  const LiquidGlassTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : assert(items.length >= 2);

  static const double barHeight = 64.0;

  final List<LiquidGlassTabItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final LiquidGlassTheme glass = LiquidGlassTheme.of(context);
    final double bottomInset = MediaQuery.paddingOf(context).bottom;
    final double bottomMargin = math.max(bottomInset, 12.0);

    return SizedBox(
      height: barHeight + bottomMargin,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomMargin),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(child: _buildCapsuleBar(context, glass)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCapsuleBar(BuildContext context, LiquidGlassTheme glass) {
    final bool disableAnimations =
        MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    final int count = items.length;
    final int safeIndex = currentIndex.clamp(0, count - 1);
    final double alignX =
        count <= 1 ? 0.0 : -1.0 + (2.0 * safeIndex / (count - 1));

    return SizedBox(
      height: barHeight,
      child: LiquidGlassSurface(
        showShadow: false,
        borderRadius: BorderRadius.circular(barHeight / 2),
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            // Sliding inner Liquid Glass selection lens
            AnimatedAlign(
              alignment: Alignment(alignX, 0),
              duration: disableAnimations
                  ? Duration.zero
                  : const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              child: FractionallySizedBox(
                widthFactor: 1 / count,
                heightFactor: 1.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: glass.activePillColor,
                    borderRadius: BorderRadius.circular((barHeight - 10) / 2),
                    border: Border.all(
                      color: glass.activePillBorderColor,
                      width: 0.9,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                for (int i = 0; i < count; i++)
                  Expanded(
                    child: _TabBarDestinationButton(
                      item: items[i],
                      isSelected: i == safeIndex,
                      onTap: () {
                        if (i != safeIndex) {
                          HapticFeedback.selectionClick();
                        }
                        onTap(i);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarDestinationButton extends StatefulWidget {
  const _TabBarDestinationButton({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final LiquidGlassTabItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_TabBarDestinationButton> createState() =>
      _TabBarDestinationButtonState();
}

class _TabBarDestinationButtonState extends State<_TabBarDestinationButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color activeColor = theme.colorScheme.primary;
    final Color inactiveColor = isDark
        ? Colors.white.withValues(alpha: 0.78)
        : Colors.black.withValues(alpha: 0.68);
    final Color foreground = widget.isSelected ? activeColor : inactiveColor;
    final bool disableAnimations =
        MediaQuery.maybeDisableAnimationsOf(context) ?? false;

    final double currentScale = MediaQuery.textScalerOf(context).scale(1.0);
    final TextScaler clampedScaler = TextScaler.linear(
      math.min(currentScale, 1.15),
    );
    final String label = widget.item.semanticsLabel ?? widget.item.label;

    return Semantics(
      button: true,
      selected: widget.isSelected,
      label: label,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          overlayColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) => states.contains(WidgetState.focused)
                ? activeColor.withValues(alpha: 0.12)
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(27),
          onHighlightChanged: (bool pressed) =>
              setState(() => _isPressed = pressed),
          onTap: widget.onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            child: AnimatedScale(
              scale: _isPressed ? 0.93 : 1.0,
              duration: disableAnimations
                  ? Duration.zero
                  : const Duration(milliseconds: 110),
              child: MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: clampedScaler),
                child: ExcludeSemantics(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        widget.isSelected
                            ? (widget.item.activeIcon ?? widget.item.icon)
                            : widget.item.icon,
                        size: 23,
                        color: foreground,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: widget.isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: foreground,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
