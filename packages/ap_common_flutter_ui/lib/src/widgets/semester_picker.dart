import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef SemesterCallback = void Function(Semester semester, int index);

/// Controls the loading/empty state of semesters in a [SemesterPicker].
///
/// Attach this controller to both [SemesterPicker] and
/// [SemesterPicker.show] so the BottomSheet can reflect
/// asynchronous data-loading progress.
///
/// Typical usage in [ApCoursePage] or [ApScorePage]:
/// ```dart
/// final controller = SemesterPickerController();
/// // after data loads:
/// controller.markSemesterHasData(semester); // auto-closes sheet
/// ```
class SemesterPickerController extends ChangeNotifier {
  final Set<String> _loadingSemesters = <String>{};
  final Set<String> _emptySemesters = <String>{};
  NavigatorState? _sheetNavigator;

  /// Semester codes currently loading.
  Set<String> get loadingSemesters =>
      Set<String>.unmodifiable(_loadingSemesters);

  /// Semester codes marked as empty (no data).
  Set<String> get emptySemesters => Set<String>.unmodifiable(_emptySemesters);

  /// Mark a semester as loading. The BottomSheet will show a
  /// spinner on this item.
  void markSemesterLoading(Semester semester) {
    _loadingSemesters.add(semester.code);
    notifyListeners();
  }

  /// Mark a semester as having data. Clears loading/empty state
  /// and **auto-closes** the BottomSheet if it is still open.
  void markSemesterHasData(Semester semester) {
    _loadingSemesters.remove(semester.code);
    _emptySemesters.remove(semester.code);
    _tryPopSheet();
    notifyListeners();
  }

  /// Mark a semester as empty (no data). Clears loading state.
  /// The BottomSheet stays open so the user can pick another.
  void markSemesterEmpty(Semester semester) {
    _loadingSemesters.remove(semester.code);
    _emptySemesters.add(semester.code);
    notifyListeners();
  }

  /// Whether the given semester is currently loading.
  bool isSemesterLoading(Semester semester) =>
      _loadingSemesters.contains(semester.code);

  /// Whether the given semester is marked empty.
  bool isSemesterEmpty(Semester semester) =>
      _emptySemesters.contains(semester.code);

  /// Called internally by the picker to register the sheet's
  /// navigator for auto-close.
  // ignore: use_setters_to_change_properties
  void attachSheetNavigator(NavigatorState navigator) {
    _sheetNavigator = navigator;
  }

  /// Called internally when the sheet is dismissed.
  void detachSheetNavigator() {
    _sheetNavigator = null;
  }

  void _tryPopSheet() {
    if (_sheetNavigator != null && _sheetNavigator!.canPop()) {
      _sheetNavigator!.pop();
      _sheetNavigator = null;
    }
  }
}

class SemesterUIConfig {
  const SemesterUIConfig({
    this.getName,
    this.getShortName,
    this.getIcon,
    this.getColor,
    this.getSortValue,
  });
  final String Function(String value)? getName;
  final String Function(String value)? getShortName;
  final IconData Function(String value)? getIcon;
  final Color Function(String value, ColorScheme colorScheme)? getColor;
  final int Function(String value)? getSortValue;
}

class SemesterPicker extends StatefulWidget {
  const SemesterPicker({
    super.key,
    required this.semesterData,
    this.onSelect,
    this.featureTag,
    this.currentIndex = 0,
    this.uiConfig,
    this.controller,
  });

  final SemesterData semesterData;
  final SemesterCallback? onSelect;
  final String? featureTag;
  final int currentIndex;
  final SemesterUIConfig? uiConfig;
  final SemesterPickerController? controller;

  @override
  SemesterPickerState createState() => SemesterPickerState();

  static void show({
    required BuildContext context,
    required SemesterData semesterData,
    int currentIndex = 0,
    SemesterCallback? onSelect,
    String? featureTag,
    Set<String>? loadingSemesters,
    Set<String>? emptySemesters,
    SemesterUIConfig? uiConfig,
    SemesterPickerController? controller,
  }) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final List<MapEntry<int, Semester>> sortedSemesters =
        SemesterPickerState._getSortedSemesters(semesterData, uiConfig);

    final Map<String, List<MapEntry<int, Semester>>> groupedByYear =
        <String, List<MapEntry<int, Semester>>>{};
    for (final MapEntry<int, Semester> entry in sortedSemesters) {
      final String year = entry.value.year;
      groupedByYear.putIfAbsent(year, () => <MapEntry<int, Semester>>[]);
      groupedByYear[year]!.add(entry);
    }

    // Prefer controller's sets; fall back to explicit parameters.
    final Set<String>? effectiveLoading =
        controller?._loadingSemesters ?? loadingSemesters;
    final Set<String>? effectiveEmpty =
        controller?._emptySemesters ?? emptySemesters;

    VoidCallback? onControllerChanged;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0x00000000),
      isScrollControlled: true,
      builder: (BuildContext sheetContext) {
        if (controller != null) {
          controller.attachSheetNavigator(Navigator.of(sheetContext));
        }
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setSheetState) {
            if (onControllerChanged == null && controller != null) {
              onControllerChanged = () => setSheetState(() {});
              controller.addListener(onControllerChanged!);
            }
            return DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_month_rounded,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                context.ap.pickSemester,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: colorScheme.outlineVariant.withAlpha(128),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: groupedByYear.length,
                          itemBuilder: (BuildContext context, int groupIndex) {
                            final String year =
                                groupedByYear.keys.elementAt(groupIndex);
                            final List<MapEntry<int, Semester>> semesters =
                                groupedByYear[year]!;

                            return _buildYearGroup(
                              context: context,
                              year: year,
                              semesters: semesters,
                              colorScheme: colorScheme,
                              currentIndex: currentIndex,
                              semesterData: semesterData,
                              onSelect: onSelect,
                              loadingSemesters: effectiveLoading,
                              emptySemesters: effectiveEmpty,
                              setSheetState: setSheetState,
                              uiConfig: uiConfig,
                              controller: controller,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    ).whenComplete(() {
      if (onControllerChanged != null) {
        controller?.removeListener(onControllerChanged!);
      }
      controller?.detachSheetNavigator();
    });
  }

  static Widget _buildYearGroup({
    required BuildContext context,
    required String year,
    required List<MapEntry<int, Semester>> semesters,
    required ColorScheme colorScheme,
    required int currentIndex,
    required SemesterData semesterData,
    SemesterCallback? onSelect,
    Set<String>? loadingSemesters,
    Set<String>? emptySemesters,
    required StateSetter setSheetState,
    SemesterUIConfig? uiConfig,
    SemesterPickerController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  context.ap.schoolYearFormat(arg1: year),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        ...semesters.map(
          (MapEntry<int, Semester> entry) => _buildSemesterItem(
            context: context,
            originalIndex: entry.key,
            semester: entry.value,
            colorScheme: colorScheme,
            currentIndex: currentIndex,
            semesterData: semesterData,
            onSelect: onSelect,
            loadingSemesters: loadingSemesters,
            emptySemesters: emptySemesters,
            setSheetState: setSheetState,
            uiConfig: uiConfig,
            controller: controller,
          ),
        ),
      ],
    );
  }

  static Widget _buildSemesterItem({
    required BuildContext context,
    required int originalIndex,
    required Semester semester,
    required ColorScheme colorScheme,
    required int currentIndex,
    required SemesterData semesterData,
    SemesterCallback? onSelect,
    Set<String>? loadingSemesters,
    Set<String>? emptySemesters,
    required StateSetter setSheetState,
    SemesterUIConfig? uiConfig,
    SemesterPickerController? controller,
  }) {
    final bool isSelected = originalIndex == currentIndex;
    final bool isDefault = originalIndex == semesterData.defaultIndex;
    final bool isEmpty = emptySemesters?.contains(semester.code) ?? false;
    final bool isLoading = loadingSemesters?.contains(semester.code) ?? false;
    final bool isDisabled = isEmpty || isLoading;
    final String semesterName = SemesterPickerState._getSemesterName(
      semester.value,
      context.ap,
      uiConfig,
    );
    final String displayName =
        semesterName.isNotEmpty ? semesterName : semester.text;

    return Opacity(
      opacity: isEmpty ? 0.5 : 1.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isEmpty
              ? colorScheme.surfaceContainerHighest
              : isLoading
                  ? colorScheme.primaryContainer.withAlpha(128)
                  : isSelected
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isEmpty
                ? colorScheme.outlineVariant.withAlpha(51)
                : isLoading
                    ? colorScheme.primary.withAlpha(128)
                    : isSelected
                        ? colorScheme.primary
                        : colorScheme.outlineVariant.withAlpha(77),
            width: isSelected || isLoading ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: isDisabled
              ? null
              : () {
                  if (onSelect != null) {
                    if (controller != null) {
                      controller.markSemesterLoading(semester);
                      onSelect(semester, originalIndex);
                    } else if (loadingSemesters != null) {
                      loadingSemesters.add(semester.code);
                      setSheetState(() {});
                      onSelect(semester, originalIndex);
                    } else {
                      Navigator.of(context).pop();
                      onSelect(semester, originalIndex);
                    }
                  } else {
                    Navigator.of(context).pop();
                  }
                },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: <Widget>[
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isEmpty
                        ? colorScheme.outlineVariant.withAlpha(77)
                        : isLoading
                            ? colorScheme.primary.withAlpha(77)
                            : isSelected
                                ? colorScheme.primary
                                : (uiConfig?.getColor
                                        ?.call(semester.value, colorScheme) ??
                                    SemesterPickerState._getSemesterColor(
                                      semester.value,
                                      colorScheme,
                                    )),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.primary,
                            ),
                          )
                        : Icon(
                            isEmpty
                                ? Icons.block_rounded
                                : (uiConfig?.getIcon?.call(semester.value) ??
                                    SemesterPickerState._getSemesterIcon(
                                      semester.value,
                                    )),
                            size: 22,
                            color: isEmpty
                                ? colorScheme.onSurfaceVariant
                                : isSelected
                                    ? colorScheme.onPrimary
                                    : colorScheme.onPrimaryContainer,
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              displayName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isEmpty
                                    ? colorScheme.onSurfaceVariant
                                    : isLoading
                                        ? colorScheme.primary
                                        : isSelected
                                            ? colorScheme.primary
                                            : colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isLoading) ...<Widget>[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withAlpha(26),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                context.ap.semesterLoading,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ] else if (isEmpty) ...<Widget>[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.outlineVariant.withAlpha(77),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                context.ap.semesterNoData,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ] else if (isDefault) ...<Widget>[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                context.ap.currentSemester,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onTertiary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        semester.text,
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLoading)
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.primary,
                    ),
                  )
                else if (isEmpty)
                  Icon(
                    Icons.lock_outline_rounded,
                    color: colorScheme.outlineVariant,
                    size: 20,
                  )
                else if (isSelected)
                  Icon(
                    Icons.check_circle_rounded,
                    color: colorScheme.primary,
                  )
                else
                  Icon(
                    Icons.circle_outlined,
                    color: colorScheme.outlineVariant,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SemesterPickerState extends State<SemesterPicker> {
  late SemesterData semesterData;
  Semester? selectSemester;
  late int currentIndex;

  final Set<String> _emptySemesters = <String>{};
  final Set<String> _loadingSemesters = <String>{};
  BuildContext? _sheetContext;
  StateSetter? _sheetSetState;

  @override
  void initState() {
    semesterData = widget.semesterData;
    currentIndex = widget.currentIndex;
    if (semesterData.data.isNotEmpty &&
        currentIndex < semesterData.data.length) {
      selectSemester = semesterData.data[currentIndex];
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SemesterPicker oldWidget) {
    if (oldWidget.semesterData != widget.semesterData ||
        oldWidget.currentIndex != widget.currentIndex) {
      semesterData = widget.semesterData;
      currentIndex = widget.currentIndex;
      if (semesterData.data.isNotEmpty &&
          currentIndex < semesterData.data.length) {
        selectSemester = semesterData.data[currentIndex];
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final String displayText = selectSemester != null
        ? _getShortSemesterText(selectSemester!, widget.uiConfig, context.ap)
        : '';

    return Material(
      color: colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          if (selectSemester != null) pickSemester();
          if (widget.featureTag != null) {
            AnalyticsUtil.instance
                .logEvent('${widget.featureTag}_item_picker_click');
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.calendar_month_rounded,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 6),
              Text(
                displayText,
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 20,
                color: colorScheme.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _getShortSemesterText(
    Semester semester,
    SemesterUIConfig? uiConfig, [
    ApLocalizations? ap,
  ]) {
    final String name = _getShortSemesterName(
      semester.value,
      ap,
      uiConfig,
    );
    if (name.isNotEmpty) {
      return '${semester.year} $name';
    }
    return semester.text;
  }

  void markSemesterEmpty(Semester semester) {
    _loadingSemesters.remove(semester.code);
    _emptySemesters.add(semester.code);
    _sheetSetState?.call(() {});
    if (mounted) setState(() {});
  }

  void markSemesterHasData(Semester semester) {
    _loadingSemesters.remove(semester.code);
    _emptySemesters.remove(semester.code);
    if (_sheetContext != null && Navigator.of(_sheetContext!).canPop()) {
      Navigator.of(_sheetContext!).pop();
      _sheetContext = null;
      _sheetSetState = null;
    }
    if (mounted) setState(() {});
  }

  void markSemesterLoading(Semester semester) {
    _loadingSemesters.add(semester.code);
    _sheetSetState?.call(() {});
    if (mounted) setState(() {});
  }

  bool isSemesterEmpty(Semester semester) {
    return _emptySemesters.contains(semester.code);
  }

  bool isSemesterLoading(Semester semester) {
    return _loadingSemesters.contains(semester.code);
  }

  static int _getSemesterSortValue(String value) {
    switch (value) {
      case '4':
        return 1;
      case '6':
        return 2;
      case '7':
        return 3;
      case '2':
        return 4;
      case '3':
        return 5;
      case '1':
        return 6;
      case '5':
        return 7;
      default:
        return 99;
    }
  }

  static String _getSemesterName(
    String value, [
    ApLocalizations? ap,
    SemesterUIConfig? uiConfig,
  ]) {
    final String? customName = uiConfig?.getName?.call(value);
    if (customName != null) {
      return customName;
    }
    switch (value) {
      case '1':
        return ap?.firstSemester ?? '上學期';
      case '2':
        return ap?.secondSemester ?? '下學期';
      case '3':
        return ap?.winterSession ?? '寒修';
      case '4':
        return ap?.summerSession ?? '暑修';
      case '5':
        return ap?.preCourse ?? '先修';
      case '6':
        return ap?.summerSessionFirst ?? '暑修(一)';
      case '7':
        return ap?.summerSessionSpecial ?? '暑修(特)';
      default:
        return '';
    }
  }

  static String _getShortSemesterName(
    String value, [
    ApLocalizations? ap,
    SemesterUIConfig? uiConfig,
  ]) {
    final String? customName =
        uiConfig?.getShortName?.call(value) ?? uiConfig?.getName?.call(value);
    if (customName != null) {
      return customName;
    }
    switch (value) {
      case '1':
        return ap?.firstSemesterShort ?? '上';
      case '2':
        return ap?.secondSemesterShort ?? '下';
      case '3':
        return ap?.winterSessionShort ?? '寒';
      case '4':
        return ap?.summerSessionShort ?? '暑';
      case '5':
        return ap?.preCourse ?? '先修';
      case '6':
        return ap?.summerSessionFirst ?? '暑修(一)';
      case '7':
        return ap?.summerSessionSpecial ?? '暑修(特)';
      default:
        return '';
    }
  }

  static IconData _getSemesterIcon(String value) {
    switch (value) {
      case '1':
        return Icons.looks_one_rounded;
      case '2':
        return Icons.looks_two_rounded;
      case '3':
        return Icons.ac_unit_rounded;
      case '4':
      case '6':
      case '7':
        return Icons.wb_sunny_rounded;
      case '5':
        return Icons.auto_awesome_rounded;
      default:
        return Icons.calendar_today_rounded;
    }
  }

  static Color _getSemesterColor(String value, ColorScheme colorScheme) {
    switch (value) {
      case '1':
        return colorScheme.primaryContainer.withAlpha(179);
      case '2':
        return colorScheme.secondaryContainer.withAlpha(179);
      case '3':
        return colorScheme.errorContainer.withAlpha(128);
      case '5':
        return colorScheme.primaryContainer.withAlpha(102);
      case '4':
      case '6':
      case '7':
        return colorScheme.tertiaryContainer.withAlpha(179);
      default:
        return colorScheme.surfaceContainerHighest;
    }
  }

  static List<MapEntry<int, Semester>> _getSortedSemesters(
    SemesterData semesterData,
    SemesterUIConfig? uiConfig,
  ) {
    final List<MapEntry<int, Semester>> indexed = <MapEntry<int, Semester>>[];
    for (int i = 0; i < semesterData.data.length; i++) {
      indexed.add(MapEntry<int, Semester>(i, semesterData.data[i]));
    }

    indexed.sort((MapEntry<int, Semester> a, MapEntry<int, Semester> b) {
      final int yearA = int.tryParse(a.value.year) ?? 0;
      final int yearB = int.tryParse(b.value.year) ?? 0;

      if (yearA != yearB) {
        return yearB.compareTo(yearA);
      }

      final int semA = uiConfig?.getSortValue?.call(a.value.value) ??
          _getSemesterSortValue(a.value.value);
      final int semB = uiConfig?.getSortValue?.call(b.value.value) ??
          _getSemesterSortValue(b.value.value);
      return semA.compareTo(semB);
    });

    return indexed;
  }

  void pickSemester() {
    final SemesterPickerController? ctrl = widget.controller;
    SemesterPicker.show(
      context: context,
      semesterData: semesterData,
      currentIndex: currentIndex,
      onSelect: (Semester semester, int index) {
        HapticFeedback.selectionClick();
        if (ctrl != null) {
          ctrl.markSemesterLoading(semester);
        } else {
          markSemesterLoading(semester);
        }
        currentIndex = index;
        selectSemester = semesterData.data[currentIndex];
        widget.onSelect?.call(
          semesterData.data[currentIndex],
          currentIndex,
        );
        if (mounted) setState(() {});
      },
      featureTag: widget.featureTag,
      loadingSemesters: ctrl != null ? null : _loadingSemesters,
      emptySemesters: ctrl != null ? null : _emptySemesters,
      uiConfig: widget.uiConfig,
      controller: ctrl,
    );
  }
}
