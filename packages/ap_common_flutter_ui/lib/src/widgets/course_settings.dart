import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

/// Bottom sheet that lets the user pick from a list of course
/// palettes. Shows a 12-dot preview per palette so the user can see
/// the full color range before committing.
///
/// Call [show] to present the sheet; the resolved [Future] yields the
/// chosen palette, or `null` if dismissed.

class CourseSettings extends StatefulWidget {
  const CourseSettings({
    super.key,
    required this.palettes,
    required this.currentId,
    this.title,
    this.settingsTitle,
    this.showPaletteSelector,
    this.showSettings = false,
    this.showSectionTime = true,
    this.showInstructors = true,
    this.showClassroomLocation = true,
    this.showSearchButton = true,
    this.mergeCourse = false,
    this.adaptiveTextColor = true,
    this.showSectionTimeOnChanged,
    this.showInstructorsOnChanged,
    this.showClassroomLocationOnChanged,
    this.showSearchButtonOnChanged,
    this.mergeCourseOnChanged,
    this.adaptiveTextColorOnChanged,
  });

  final List<CoursePaletteTheme> palettes;
  final String currentId;
  final String? title;
  final String? settingsTitle;
  final bool? showPaletteSelector;
  final bool showSettings;
  final bool showSectionTime;
  final bool showInstructors;
  final bool showClassroomLocation;
  final bool showSearchButton;
  final bool mergeCourse;
  final bool adaptiveTextColor;

  final ValueChanged<bool?>? showSectionTimeOnChanged;
  final ValueChanged<bool?>? showInstructorsOnChanged;
  final ValueChanged<bool?>? showClassroomLocationOnChanged;
  final ValueChanged<bool?>? showSearchButtonOnChanged;
  final ValueChanged<bool?>? mergeCourseOnChanged;
  final ValueChanged<bool?>? adaptiveTextColorOnChanged;

  static Future<CoursePaletteTheme?> show({
    required BuildContext context,
    required String currentId,
    List<CoursePaletteTheme>? palettes,
    String? settingsTitle,
    String? title,
    bool showSettings = false,
    bool? showSectionTime,
    bool? showInstructors,
    bool? showClassroomLocation,
    bool? showSearchButton,
    bool? mergeCourse,
    bool? adaptiveTextColor,
    bool? showPaletteSelector,
    ValueChanged<bool?>? showSectionTimeOnChanged,
    ValueChanged<bool?>? showInstructorsOnChanged,
    ValueChanged<bool?>? showClassroomLocationOnChanged,
    ValueChanged<bool?>? showSearchButtonOnChanged,
    ValueChanged<bool?>? adaptiveTextColorOnChanged,
    ValueChanged<bool?>? mergeCourseOnChanged,
  }) {
    return showModalBottomSheet<CoursePaletteTheme>(
      context: context,
      useRootNavigator: true,
      backgroundColor: const Color(0x00000000),
      isScrollControlled: true,
      builder: (_) => CourseSettings(
        palettes: palettes ?? CoursePaletteTheme.builtIn,
        currentId: currentId,
        title: title,
        settingsTitle: settingsTitle,
        showSettings: showSettings,
        showSectionTime: showSectionTime ?? true,
        showInstructors: showInstructors ?? true,
        showClassroomLocation: showClassroomLocation ?? true,
        showSearchButton: showSearchButton ?? true,
        mergeCourse: mergeCourse ?? false,
        adaptiveTextColor: adaptiveTextColor ?? true,
        showPaletteSelector: showPaletteSelector ?? true,
        showSectionTimeOnChanged: showSectionTimeOnChanged,
        showInstructorsOnChanged: showInstructorsOnChanged,
        showClassroomLocationOnChanged: showClassroomLocationOnChanged,
        showSearchButtonOnChanged: showSearchButtonOnChanged,
        mergeCourseOnChanged: mergeCourseOnChanged,
        adaptiveTextColorOnChanged: adaptiveTextColorOnChanged,
      ),
    );
  }

  @override
  State<CourseSettings> createState() => _CourseSettingsState();
}

class _CourseSettingsState extends State<CourseSettings> {
  late bool showSectionTime;
  late bool showInstructors;
  late bool showClassroomLocation;
  late bool showSearchButton;
  late bool mergeCourse;
  late bool adaptiveTextColor;

  @override
  void initState() {
    super.initState();
    showSectionTime = widget.showSectionTime;
    showInstructors = widget.showInstructors;
    showClassroomLocation = widget.showClassroomLocation;
    showSearchButton = widget.showSearchButton;
    mergeCourse = widget.mergeCourse;
    adaptiveTextColor = widget.adaptiveTextColor;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: (widget.showPaletteSelector ?? true) ? 0.67 : 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Material(
          color: colorScheme.surface,
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildHandle(colorScheme),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.only(
                    bottom: 12 + MediaQuery.viewPaddingOf(context).bottom,
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        if (widget.showSettings) ...<Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                            child: Text(
                              widget.settingsTitle ?? 'Settings',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          CheckboxListTile(
                            title: Text(context.ap.showSectionTime),
                            secondary: Icon(ApIcon.accessTime),
                            value: showSectionTime,
                            onChanged: (bool? value) {
                              final bool next = value ?? false;
                              setState(() => showSectionTime = next);
                              widget.showSectionTimeOnChanged?.call(next);
                            },
                          ),
                          CheckboxListTile(
                            title: Text(context.ap.showInstructors),
                            secondary: Icon(ApIcon.person),
                            value: showInstructors,
                            onChanged: (bool? value) {
                              final bool next = value ?? false;
                              setState(() => showInstructors = next);
                              widget.showInstructorsOnChanged?.call(next);
                            },
                          ),
                          CheckboxListTile(
                            title: Text(context.ap.showClassroomLocation),
                            secondary: Icon(ApIcon.locationOn),
                            value: showClassroomLocation,
                            onChanged: (bool? value) {
                              final bool next = value ?? false;
                              setState(() => showClassroomLocation = next);
                              widget.showClassroomLocationOnChanged?.call(next);
                            },
                          ),
                          CheckboxListTile(
                            title: Text(context.ap.showSearchButton),
                            secondary: const Icon(Icons.search),
                            value: showSearchButton,
                            onChanged: (bool? value) {
                              final bool next = value ?? false;
                              setState(() => showSearchButton = next);
                              widget.showSearchButtonOnChanged?.call(next);
                            },
                          ),
                          CheckboxListTile(
                            title: Text(context.ap.mergeCourse),
                            secondary: const Icon(Icons.merge_type_rounded),
                            value: mergeCourse,
                            onChanged: (bool? value) {
                              final bool next = value ?? false;
                              setState(() => mergeCourse = next);
                              widget.mergeCourseOnChanged?.call(next);
                            },
                          ),
                        ],
                        if (widget.showPaletteSelector ?? true) ...<Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                            child: Text(
                              widget.title ?? 'Course palette',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          for (final CoursePaletteTheme palette
                              in widget.palettes)
                            _PaletteRow(
                              palette: palette,
                              selected: palette.id == widget.currentId,
                              onTap: () => Navigator.of(context).pop(palette),
                            ),
                        ],
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle(ColorScheme colorScheme) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(top: 12, bottom: 4),
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
