import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Bottom sheet for adding or editing a custom course.
///
/// Returns the created/updated [Course] via [Navigator.pop] when
/// the user taps save, or `null` if cancelled.
class CourseEditSheet extends StatefulWidget {
  const CourseEditSheet({
    super.key,
    required this.timeCodes,
    required this.existingCourses,
    this.course,
    this.initialWeekday,
    this.initialTimeIndex,
  });

  /// Available time slots from [CourseData].
  final List<TimeCode> timeCodes;

  /// All current courses (API + custom) for conflict detection.
  final List<Course> existingCourses;

  /// If editing an existing custom course, pass it here.
  final Course? course;

  /// Pre-selected weekday (1-7) when adding from an empty cell.
  final int? initialWeekday;

  /// Pre-selected time index when adding from an empty cell.
  final int? initialTimeIndex;

  bool get isEditing => course != null;

  /// Show this sheet as a modal bottom sheet.
  ///
  /// The sheet opens via the root navigator, so any
  /// [CoursePaletteTheme] override installed locally on the caller's
  /// subtree (e.g. via [CourseScaffold]'s palette picker) is not
  /// inherited. Pass [coursePalette] explicitly so the color picker
  /// stays in sync with the surrounding scaffold; when omitted, the
  /// sheet falls back to the palette resolved from [context].
  static Future<Course?> show({
    required BuildContext context,
    required List<TimeCode> timeCodes,
    required List<Course> existingCourses,
    Course? course,
    int? initialWeekday,
    int? initialTimeIndex,
    CoursePaletteTheme? coursePalette,
  }) {
    final CoursePaletteTheme? palette =
        coursePalette ?? Theme.of(context).extension<CoursePaletteTheme>();
    return showModalBottomSheet<Course>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext sheetCtx) {
        final CourseEditSheet sheet = CourseEditSheet(
          timeCodes: timeCodes,
          existingCourses: existingCourses,
          course: course,
          initialWeekday: initialWeekday,
          initialTimeIndex: initialTimeIndex,
        );
        if (palette == null) return sheet;
        final ThemeData sheetTheme = Theme.of(sheetCtx);
        final List<ThemeExtension<dynamic>> merged =
            sheetTheme.extensions.values
                .where(
                  (ThemeExtension<dynamic> ext) => ext is! CoursePaletteTheme,
                )
                .toList()
              ..add(palette);
        return Theme(
          data: sheetTheme.copyWith(extensions: merged),
          child: sheet,
        );
      },
    );
  }

  @override
  State<CourseEditSheet> createState() => _CourseEditSheetState();
}

class _CourseEditSheetState extends State<CourseEditSheet> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _instructorCtrl;
  late final TextEditingController _locationCtrl;
  late final TextEditingController _unitsCtrl;

  String? _nameError;
  String? _timeError;

  /// Selected time slots: set of (weekday, timeIndex) pairs.
  final Set<(int, int)> _selectedSlots = <(int, int)>{};

  /// Selected color index into the active [CoursePaletteTheme].
  int _colorIndex = 0;

  /// Lookup: (weekday, timeIndex) → course title, for conflict
  /// display. Excludes the course being edited.
  late final Map<(int, int), String> _occupiedSlots;

  @override
  void initState() {
    super.initState();
    final Course? c = widget.course;
    _nameCtrl = TextEditingController(text: c?.title ?? '');
    _instructorCtrl = TextEditingController(
      text: c?.getInstructors() ?? '',
    );
    _locationCtrl = TextEditingController(
      text: c?.location?.toString() ?? '',
    );
    _unitsCtrl = TextEditingController(text: c?.units ?? '');

    // Pre-fill selected slots from existing course.
    if (c != null) {
      for (final SectionTime t in c.times) {
        _selectedSlots.add((t.weekday, t.index));
      }
      _colorIndex = c.colorIndex ??
          c.code.hashCode.abs() % CoursePaletteTheme.paletteLength;
    } else if (widget.initialWeekday != null &&
        widget.initialTimeIndex != null) {
      _selectedSlots.add(
        (widget.initialWeekday!, widget.initialTimeIndex!),
      );
    }

    // Build occupied slots map (exclude course being edited).
    _occupiedSlots = <(int, int), String>{};
    for (final Course course in widget.existingCourses) {
      if (c != null && course.code == c.code) continue;
      for (final SectionTime t in course.times) {
        _occupiedSlots[(t.weekday, t.index)] = course.title;
      }
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _instructorCtrl.dispose();
    _locationCtrl.dispose();
    _unitsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ApLocalizations ap = context.ap;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (BuildContext context, ScrollController controller) {
        return Material(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              _buildHandle(colorScheme),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.isEditing ? ap.editCourse : ap.addCourse,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: _save,
                      child: Text(ap.done),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  controller: controller,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  children: <Widget>[
                    // Course name
                    _buildTextField(
                      controller: _nameCtrl,
                      label: ap.courseName,
                      hint: ap.courseNameHint,
                      errorText: _nameError,
                    ),
                    const SizedBox(height: 12),
                    // Instructor
                    _buildTextField(
                      controller: _instructorCtrl,
                      label: ap.instructor,
                    ),
                    const SizedBox(height: 12),
                    // Classroom
                    _buildTextField(
                      controller: _locationCtrl,
                      label: ap.classroom,
                    ),
                    const SizedBox(height: 12),
                    // Credits
                    _buildTextField(
                      controller: _unitsCtrl,
                      label: context.ap.credits,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    // Color picker
                    Text(
                      ap.courseColor,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildColorPicker(colorScheme),
                    const SizedBox(height: 20),
                    // Time slot selection
                    Text(
                      ap.timeslotSelection,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ap.timeslotSelectionHint,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (_timeError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          _timeError!,
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    _buildTimeslotGrid(colorScheme),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ────────────────────────────────────────────────────────────
  // Sub-widgets
  // ────────────────────────────────────────────────────────────

  Widget _buildHandle(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: colorScheme.onSurfaceVariant.withAlpha(77),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    String? errorText,
    TextInputType? keyboardType,
  }) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.outline.withAlpha(77),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildColorPicker(ColorScheme colorScheme) {
    final CoursePaletteTheme palette = CoursePaletteTheme.of(context);
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List<Widget>.generate(
        palette.colors.length,
        (int i) {
          final bool selected = i == _colorIndex;
          return GestureDetector(
            onTap: () => setState(() => _colorIndex = i),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color:
                    palette.colors[i].withAlpha(CoursePaletteTheme.cardAlpha),
                shape: BoxShape.circle,
                border: selected
                    ? Border.all(
                        color: colorScheme.onSurface,
                        width: 3,
                      )
                    : null,
              ),
              child: selected
                  ? Icon(
                      Icons.check,
                      color: palette.foregroundColor,
                      size: 20,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeslotGrid(ColorScheme colorScheme) {
    final List<String> weekdayLabels = <String>[
      context.ap.mon,
      context.ap.tue,
      context.ap.wed,
      context.ap.thu,
      context.ap.fri,
      context.ap.sat,
      context.ap.sun,
    ];

    // Determine visible time range.
    final int startIndex = widget.timeCodes.length > 10 ? 0 : 0;
    final int endIndex = widget.timeCodes.length;
    const int weekdayCount = 7;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Table(
        border: TableBorder.all(
          color: colorScheme.outlineVariant.withAlpha(77),
          width: 0.5,
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: <int, TableColumnWidth>{
          0: const FixedColumnWidth(36),
          for (int i = 1; i <= weekdayCount; i++) i: const FlexColumnWidth(),
        },
        children: <TableRow>[
          // Header row
          TableRow(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
            ),
            children: <Widget>[
              const SizedBox(height: 32),
              for (int d = 0; d < weekdayCount; d++)
                Center(
                  child: Text(
                    weekdayLabels[d],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
          // Time rows
          for (int t = startIndex; t < endIndex; t++)
            TableRow(
              children: <Widget>[
                // Time label
                Container(
                  height: 36,
                  alignment: Alignment.center,
                  color: colorScheme.surfaceContainerHighest,
                  child: Text(
                    widget.timeCodes[t].title,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                // Weekday cells
                for (int d = 1; d <= weekdayCount; d++)
                  _buildSlotCell(
                    colorScheme,
                    weekday: d,
                    timeIndex: t,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSlotCell(
    ColorScheme colorScheme, {
    required int weekday,
    required int timeIndex,
  }) {
    final (int, int) key = (weekday, timeIndex);
    final bool isSelected = _selectedSlots.contains(key);
    final String? occupiedBy = _occupiedSlots[key];
    final bool isOccupied = occupiedBy != null;

    final CoursePaletteTheme palette = CoursePaletteTheme.of(context);
    Color bg;
    if (isSelected) {
      bg = palette.colorAt(_colorIndex).withAlpha(179);
    } else if (isOccupied) {
      bg = colorScheme.surfaceContainerHighest;
    } else {
      bg = Colors.transparent;
    }

    return GestureDetector(
      onTap: () {
        if (isOccupied && !isSelected) {
          // Show conflict warning but still allow adding.
          UiUtil.instance.showToast(
            context,
            context.ap.timeslotConflict(arg1: occupiedBy),
          );
        }
        HapticFeedback.selectionClick();
        setState(() {
          if (isSelected) {
            _selectedSlots.remove(key);
          } else {
            _selectedSlots.add(key);
          }
          _timeError = null;
        });
      },
      child: Container(
        height: 36,
        color: bg,
        child: isSelected
            ? Icon(
                Icons.check_rounded,
                size: 16,
                color: palette.foregroundColor,
              )
            : isOccupied
                ? Center(
                    child: Text(
                      occupiedBy.length > 2
                          ? occupiedBy.substring(0, 2)
                          : occupiedBy,
                      style: TextStyle(
                        fontSize: 9,
                        color: colorScheme.onSurfaceVariant.withAlpha(128),
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                : null,
      ),
    );
  }

  // ────────────────────────────────────────────────────────────
  // Save
  // ────────────────────────────────────────────────────────────

  void _save() {
    final ApLocalizations ap = context.ap;
    bool hasError = false;

    setState(() {
      _nameError = _nameCtrl.text.trim().isEmpty ? ap.courseNameRequired : null;
      _timeError = _selectedSlots.isEmpty ? ap.timeslotRequired : null;
      hasError = _nameError != null || _timeError != null;
    });

    if (hasError) {
      HapticFeedback.mediumImpact();
      return;
    }

    final String code = widget.course?.code ?? CustomCourseData.generateCode();

    // Parse instructors from comma-separated string.
    final List<String> instructors = _instructorCtrl.text
        .split(RegExp('[,，]'))
        .map((String s) => s.trim())
        .where((String s) => s.isNotEmpty)
        .toList();

    // Parse location.
    final String locText = _locationCtrl.text.trim();
    final Location? location =
        locText.isEmpty ? null : Location(building: '', room: locText);

    final Course course = Course(
      code: code,
      title: _nameCtrl.text.trim(),
      units: _unitsCtrl.text.trim().isEmpty ? null : _unitsCtrl.text.trim(),
      times: _selectedSlots
          .map(
            ((int, int) s) => SectionTime(
              weekday: s.$1,
              index: s.$2,
            ),
          )
          .toList(),
      location: location,
      instructors: instructors,
      colorIndex: _colorIndex,
    );

    Navigator.of(context).pop(course);
  }
}
