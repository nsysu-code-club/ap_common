import 'package:ap_common_flutter_ui/src/theme/course_palette_theme.dart';
import 'package:flutter/material.dart';

/// Bottom sheet that lets the user pick from a list of course
/// palettes. Shows a 12-dot preview per palette so the user can see
/// the full color range before committing.
///
/// Call [show] to present the sheet; the resolved [Future] yields the
/// chosen palette, or `null` if dismissed.
class CoursePalettePickerSheet extends StatelessWidget {
  const CoursePalettePickerSheet({
    super.key,
    required this.palettes,
    required this.currentId,
    this.title,
  });

  /// Palettes to display. Defaults to [CoursePaletteTheme.builtIn] via
  /// the [show] helper.
  final List<CoursePaletteTheme> palettes;

  /// Id of the currently active palette, used to mark the row as
  /// selected.
  final String currentId;

  /// Sheet title. Defaults to "Course palette" when omitted.
  final String? title;

  static Future<CoursePaletteTheme?> show({
    required BuildContext context,
    required String currentId,
    List<CoursePaletteTheme>? palettes,
    String? title,
  }) {
    return showModalBottomSheet<CoursePaletteTheme>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => CoursePalettePickerSheet(
        palettes: palettes ?? CoursePaletteTheme.builtIn,
        currentId: currentId,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHandle(colorScheme),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Text(
                title ?? 'Course palette',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            for (final CoursePaletteTheme palette in palettes)
              _PaletteRow(
                palette: palette,
                selected: palette.id == currentId,
                onTap: () => Navigator.of(context).pop(palette),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(ColorScheme colorScheme) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: colorScheme.onSurfaceVariant.withAlpha(77),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _ModeBadge extends StatelessWidget {
  const _ModeBadge({required this.label, required this.colorScheme});

  final String label;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class _SwatchRow extends StatelessWidget {
  const _SwatchRow({required this.colors, required this.label});

  final List<Color> colors;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: <Widget>[
        SizedBox(
          width: 36,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: <Widget>[
              for (final Color color in colors)
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaletteRow extends StatelessWidget {
  const _PaletteRow({
    required this.palette,
    required this.selected,
    required this.onTap,
  });

  final CoursePaletteTheme palette;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final CoursePaletteTheme? darkVariant = palette.dark;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    palette.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                if (darkVariant != null)
                  _ModeBadge(label: 'Auto dark', colorScheme: colorScheme),
                if (selected) ...<Widget>[
                  const SizedBox(width: 6),
                  Icon(
                    Icons.check_rounded,
                    size: 20,
                    color: colorScheme.primary,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            _SwatchRow(colors: palette.colors, label: 'Light'),
            if (darkVariant != null) ...<Widget>[
              const SizedBox(height: 6),
              _SwatchRow(colors: darkVariant.colors, label: 'Dark'),
            ],
          ],
        ),
      ),
    );
  }
}
