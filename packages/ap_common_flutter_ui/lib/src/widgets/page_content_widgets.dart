import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:ap_common_flutter_ui/src/theme/liquid_glass_theme.dart';
import 'package:ap_common_flutter_ui/src/widgets/liquid_glass_surface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppleContentContainer extends StatelessWidget {
  const AppleContentContainer({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
  });
  static const double maxContentWidth = 760.0;

  final Widget child;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxContentWidth),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class ProfileAvatarButton extends StatefulWidget {
  const ProfileAvatarButton({
    super.key = buttonKey,
    required this.isLogin,
    required this.userInfo,
    this.displayPicture = true,
    required this.onTap,
  });
  static const Key buttonKey = ValueKey<String>('profile_avatar_button');

  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final VoidCallback onTap;
  @override
  State<ProfileAvatarButton> createState() => _ProfileAvatarButtonState();
}

class _ProfileAvatarButtonState extends State<ProfileAvatarButton> {
  bool _isPressed = false;

  String? _extractInitial(String? name) {
    if (name == null) return null;
    final String trimmed = name.trim();
    if (trimmed.isEmpty) return null;
    return trimmed.characters.first;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primary = theme.colorScheme.primary;
    final String? initial = _extractInitial(widget.userInfo?.name);
    final Uint8List? pictureBytes =
        widget.displayPicture ? widget.userInfo?.pictureBytes : null;
    final bool disableAnimations =
        MediaQuery.maybeDisableAnimationsOf(context) ?? false;

    final String? rawName = widget.userInfo?.name;
    final String semanticsLabel = widget.isLogin
        ? ((rawName != null && rawName.isNotEmpty)
            ? rawName
            : context.ap.userInfo)
        : context.ap.login;

    return Semantics(
      button: true,
      label: semanticsLabel,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          focusColor: primary.withValues(alpha: 0.16),
          onHighlightChanged: (bool pressed) =>
              setState(() => _isPressed = pressed),
          onTap: () {
            HapticFeedback.lightImpact();
            widget.onTap();
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            child: Center(
              child: AnimatedScale(
                scale: _isPressed ? 0.92 : 1.0,
                duration: disableAnimations
                    ? Duration.zero
                    : const Duration(milliseconds: 110),
                child: SizedBox(
                  width: 42,
                  height: 42,
                  child: LiquidGlassSurface(
                    borderRadius: BorderRadius.circular(21),
                    padding: const EdgeInsets.all(4),
                    showShadow: false,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            primary.withValues(alpha: 0.85),
                            primary.withValues(alpha: 0.62),
                          ],
                        ),
                      ),
                      child: ClipOval(
                        child: _buildAvatarInner(pictureBytes, initial),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarInner(Uint8List? pictureBytes, String? initial) {
    if (widget.isLogin && pictureBytes != null && pictureBytes.isNotEmpty) {
      return Image.memory(
        pictureBytes,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) =>
                _buildFallbackInitial(initial),
      );
    }
    return _buildFallbackInitial(initial);
  }

  Widget _buildFallbackInitial(String? initial) {
    if (widget.isLogin && initial != null) {
      return Center(
        child: Text(
          initial,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );
    }
    return Center(
      child: Icon(
        ApIcon.person,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

class AppleSectionHeader extends StatelessWidget {
  const AppleSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.padding = const EdgeInsets.fromLTRB(16, 20, 16, 12),
    this.titleColor,
  });
  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color resolvedColor = titleColor ?? theme.colorScheme.onSurface;

    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Semantics(
              header: true,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                  color: resolvedColor,
                ),
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class AppleGroupedSection extends StatelessWidget {
  const AppleGroupedSection({
    super.key,
    this.title,
    this.headerTrailing,
    required this.children,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
  });
  final String? title;
  final Widget? headerTrailing;
  final List<Widget> children;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    final LiquidGlassTheme glass = LiquidGlassTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null)
          AppleSectionHeader(title: title!, trailing: headerTrailing),
        Padding(
          padding: margin,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: glass.cardBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: glass.subtleBorderColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < children.length; i++) ...<Widget>[
                    children[i],
                    if (i < children.length - 1)
                      Divider(
                        height: 1,
                        thickness: 0.6,
                        indent: 64,
                        color: glass.subtleBorderColor,
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppleGroupedTile extends StatelessWidget {
  const AppleGroupedTile({
    super.key,
    required this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    required this.title,
    this.titleAccessory,
    this.subtitle,
    this.trailing,
    required this.onTap,
    this.isExternal = false,
    this.titleColor,
  });
  final IconData icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final String title;
  final Widget? titleAccessory;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;
  final bool isExternal;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primary = iconColor ?? theme.colorScheme.primary;
    final Color badgeBg =
        iconBackgroundColor ?? primary.withValues(alpha: 0.14);
    final Color onSurface = theme.colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: primary),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: titleColor ?? onSurface,
                            ),
                          ),
                          if (titleAccessory != null) titleAccessory!,
                        ],
                      ),
                      if (subtitle != null && subtitle!.isNotEmpty) ...<Widget>[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 13,
                            color: onSurface.withValues(alpha: 0.62),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                trailing ??
                    Icon(
                      isExternal ? ApIcon.exitToApp : ApIcon.chevronRight,
                      size: isExternal ? 18 : 22,
                      color: onSurface.withValues(alpha: 0.38),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
