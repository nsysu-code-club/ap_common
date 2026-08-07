import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

typedef CourseNotifyCallback = Function(
  CourseNotify? courseNotify,
  CourseNotifyState state,
);

enum CourseState { loading, finish, error, empty, offlineEmpty, custom }

enum CourseNotifyState { schedule, cancel }

enum _ContentStyle { list, table }

const double _courseHeight = 64.0;

const String _kCourseInvisibleKey =
    '${ApConstants.packageName}.course_invisible_';
const String _kCoursePreferredVisibleKey =
    '${ApConstants.packageName}.course_preferred_visible_';

const List<Color> courseColors = <Color>[
  Color(0xFF5C6BC0), // Indigo
  Color(0xFF26A69A), // Teal
  Color(0xFFEF5350), // Red
  Color(0xFFAB47BC), // Purple
  Color(0xFF42A5F5), // Blue
  Color(0xFFFF7043), // Deep Orange
  Color(0xFF66BB6A), // Green
  Color(0xFFFFCA28), // Amber
  Color(0xFF8D6E63), // Brown
  Color(0xFF78909C), // Blue Grey
  Color(0xFFEC407A), // Pink
  Color(0xFF7E57C2), // Deep Purple
];

class CourseConfig extends InheritedWidget {
  const CourseConfig({
    this.showSectionTime,
    this.showInstructors,
    this.showClassroomLocation,
    this.showSearchButton,
    required super.child,
  });

  final bool? showSectionTime;
  final bool? showInstructors;
  final bool? showClassroomLocation;
  final bool? showSearchButton;

  static CourseConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(CourseConfig oldWidget) {
    return true;
  }
}

class CourseScaffold extends StatefulWidget {
  const CourseScaffold({
    super.key,
    required this.state,
    required this.courseData,
    this.title,
    this.customHint,
    this.semesterData,
    this.onSelect,
    this.onRefresh,
    this.actions,
    this.enableNotifyControl = true,
    this.notifyData,
    this.autoNotifySave = true,
    this.onNotifyClick,
    this.courseNotifySaveKey = ApConstants.semesterLatest,
    this.customStateHint,
    this.itemPicker,
    this.onSearchButtonClick,
    this.enableAddToCalendar = true,
    this.androidResourceIcon,
    this.enableCaptureCourseTable = false,
    this.showSectionTime,
    this.showInstructors,
    this.showClassroomLocation,
    this.showSearchButton,
    this.enableCustomCourse = false,
    this.customCourseData,
    this.onCustomCourseChanged,
    this.semesterPickerController,
    this.semesterPickerUiConfig,
    this.enablePaletteSelector = true,
    this.onCoursePaletteChanged,
    this.autoHideOverlappingCourses = false,
  });

  /// Creates a [CourseScaffold] from a [DataState<CourseData>].
  ///
  /// This constructor simplifies usage by automatically mapping the
  /// [DataState] to the appropriate [CourseState] and extracting hints.
  ///
  /// ```dart
  /// CourseScaffold.fromDataState(
  ///   dataState: DataLoaded(courseData),
  ///   semesterData: semesterData,
  ///   onSelect: (index) => loadCourse(index),
  /// )
  /// ```
  CourseScaffold.fromDataState({
    super.key,
    required DataState<CourseData> dataState,
    this.title,
    this.semesterData,
    this.onSelect,
    this.onRefresh,
    this.actions,
    this.enableNotifyControl = true,
    this.notifyData,
    this.autoNotifySave = true,
    this.onNotifyClick,
    this.courseNotifySaveKey = ApConstants.semesterLatest,
    this.itemPicker,
    this.onSearchButtonClick,
    this.enableAddToCalendar = true,
    this.androidResourceIcon,
    this.enableCaptureCourseTable = false,
    this.showSectionTime,
    this.showInstructors,
    this.showClassroomLocation,
    this.showSearchButton,
    this.enableCustomCourse = false,
    this.customCourseData,
    this.onCustomCourseChanged,
    this.semesterPickerController,
    this.semesterPickerUiConfig,
    this.enablePaletteSelector = true,
    this.onCoursePaletteChanged,
    this.autoHideOverlappingCourses = false,
  })  : state = dataState.when(
          loading: () => CourseState.loading,
          loaded: (_, __) => CourseState.finish,
          error: (_) => CourseState.error,
          empty: (_) => CourseState.empty,
        ),
        courseData = dataState.dataOrNull ?? CourseData.empty(),
        customHint =
            dataState is DataLoaded<CourseData> ? dataState.hint : null,
        customStateHint = dataState is DataError<CourseData>
            ? dataState.hint
            : dataState is DataEmpty<CourseData>
                ? dataState.hint
                : null;

  /// 必要欄位，總共有
  /// `loading` `finish` `error` `empty` `offlineEmpty` `custom` 的狀態，
  /// 只有`finish`才會顯示課表介面，其餘都是顯示錯誤狀況
  final CourseState state;
  final String? customStateHint;
  final CourseData courseData;
  final String? title;
  final Widget? itemPicker;
  final SemesterData? semesterData;
  final Function(int index)? onSelect;
  final Function()? onSearchButtonClick;
  final Function()? onRefresh;
  final List<Widget>? actions;
  final String? customHint;
  final bool enableNotifyControl;
  final CourseNotifyData? notifyData;
  final bool autoNotifySave;
  final CourseNotifyCallback? onNotifyClick;
  final String courseNotifySaveKey;
  final bool enableAddToCalendar;
  final String? androidResourceIcon;
  final bool enableCaptureCourseTable;
  final bool? showSectionTime;
  final bool? showInstructors;
  final bool? showClassroomLocation;
  final bool? showSearchButton;

  /// Enable the custom course feature (add/edit/delete).
  final bool enableCustomCourse;

  /// User-created custom courses, managed externally.
  final CustomCourseData? customCourseData;

  /// Called when custom courses are added, edited, or deleted.
  final ValueChanged<CustomCourseData>? onCustomCourseChanged;

  /// Optional controller for the semester picker.
  final SemesterPickerController? semesterPickerController;

  /// Optional UI configuration for the semester picker.
  final SemesterUIConfig? semesterPickerUiConfig;

  /// When true (default), the setting dialog shows a palette selector
  /// that lets the user switch between built-in [CoursePaletteTheme]s.
  /// The choice is persisted under [CoursePaletteTheme.preferenceKey]
  /// so it survives app restarts.
  final bool enablePaletteSelector;

  /// Called whenever the user picks a new palette from the selector.
  /// Apps can use this to update their app-level theme extensions so
  /// the new palette applies to other surfaces (home dashboard, etc.).
  ///
  /// Native AppWidget sync via `ap_common_plugin` is handled
  /// automatically — the scaffold invokes the plugin's
  /// `setCoursePalette` channel after persisting the choice, and
  /// silently no-ops when the plugin isn't registered.
  final ValueChanged<CoursePaletteTheme>? onCoursePaletteChanged;

  /// Whether overlapping courses should be hidden automatically.
  ///
  /// Defaults to `false` so [CourseScaffoldState.invisibleCourseCodes]
  /// continues to represent courses explicitly hidden by the user.
  final bool autoHideOverlappingCourses;

  @override
  CourseScaffoldState createState() => CourseScaffoldState();
}

class CourseScaffoldState extends State<CourseScaffold> {
  final GlobalKey _repaintBoundaryGlobalKey = GlobalKey();

  _ContentStyle _contentStyle = _ContentStyle.table;

  bool? showSectionTime;
  bool? showInstructors;
  bool? showClassroomLocation;
  bool? showSearchButton;
  bool? mergeCourse;

  bool get isLandscape =>
      // MediaQuery.of(context).size.shortestSide >= 680 ||
      MediaQuery.of(context).orientation == Orientation.landscape;

  List<String> invisibleCourseCodes = <String>[];

  late Map<int, Map<int, List<Course>>> _courseLookup;
  late Map<String, Set<String>> _courseOverlapLookup;
  late List<String> _courseCodesInOrder;

  Set<String> _manuallyHiddenCourseCodes = <String>{};
  Set<String> _preferredVisibleCourseCodes = <String>{};
  Set<String> _overlapHiddenCourseCodes = <String>{};

  final Map<String, int> _courseColorIndexMap = <String, int>{};
  int _colorIndex = 0;

  /// User-selected palette that overrides the app-level one for this
  /// scaffold's subtree. `null` means "inherit from Theme".
  CoursePaletteTheme? _overridePalette;

  CoursePaletteTheme _activePalette(BuildContext context) {
    final CoursePaletteTheme? override = _overridePalette;
    if (override != null) return override.resolvedFor(context);
    return CoursePaletteTheme.of(context);
  }

  Color _getCourseColor(Course course) {
    final int index = _courseColorIndexMap.putIfAbsent(course.code, () {
      if (course.colorIndex != null) return course.colorIndex!;
      return _colorIndex++;
    });
    return _activePalette(context).colorAt(index);
  }

  late ScrollController _scrollController;
  bool _showFab = true;

  @override
  void initState() {
    _buildCourseLookup();
    showSectionTime = widget.showSectionTime ??
        PreferenceUtil.instance.getBool(ApConstants.showSectionTime, true);
    showInstructors = widget.showInstructors ??
        PreferenceUtil.instance.getBool(ApConstants.showInstructors, true);
    showClassroomLocation = widget.showClassroomLocation ??
        PreferenceUtil.instance
            .getBool(ApConstants.showClassroomLocation, true);
    showSearchButton = widget.showSearchButton ??
        PreferenceUtil.instance
            .getBool(ApConstants.showCourseSearchButton, true);
    mergeCourse = PreferenceUtil.instance.getBool(
      '${ApConstants.packageName}.merge_course',
      true,
    );
    final String savedPaletteId =
        PreferenceUtil.instance.getString(CoursePaletteTheme.preferenceKey, '');
    if (savedPaletteId.isNotEmpty) {
      final CoursePaletteTheme persisted =
          CoursePaletteTheme.fromId(savedPaletteId);
      _overridePalette = persisted;
      unawaited(_syncCoursePaletteToNative(persisted));
    }
    fetchInvisibleCourseCodes();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_showFab) {
          setState(() => _showFab = false);
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_showFab) {
          setState(() => _showFab = true);
        }
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CourseScaffold oldWidget) {
    if (widget.courseData != oldWidget.courseData) {
      _buildCourseLookup();
      _courseColorIndexMap.clear();
      _colorIndex = 0;
    } else if (widget.autoHideOverlappingCourses !=
        oldWidget.autoHideOverlappingCourses) {
      _recomputeOverlapHiddenCourses();
    }
    fetchInvisibleCourseCodes();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Wrap [child] in a [Theme] that injects [_overridePalette] as a
  /// [CoursePaletteTheme] extension, so descendants (including modal
  /// sheets launched via [showModalBottomSheet] with this context) see
  /// the user-selected palette instead of the app-level one.
  Widget _withPaletteOverride(BuildContext context, Widget child) {
    final CoursePaletteTheme? override = _overridePalette;
    if (override == null) return child;
    final ThemeData theme = Theme.of(context);
    final List<ThemeExtension<dynamic>> merged = theme.extensions.values
        .where((ThemeExtension<dynamic> ext) => ext is! CoursePaletteTheme)
        .toList()
      ..add(override);
    return Theme(
      data: theme.copyWith(extensions: merged),
      child: child,
    );
  }

  /// Push the active palette to `ap_common_plugin`'s native handler
  /// so Android / iOS home-screen widgets render with the same colors
  /// the user just picked. Opens the channel directly to avoid making
  /// `ap_common_flutter_ui` depend on the plugin package; when the
  /// plugin isn't registered (web, or app not using the plugin) the
  /// resulting [MissingPluginException] is swallowed.
  static const MethodChannel _nativePaletteChannel =
      MethodChannel('ap_common_plugin');

  Future<void> _syncCoursePaletteToNative(
    CoursePaletteTheme palette,
  ) async {
    final CoursePaletteTheme? darkVariant = palette.dark;
    final Map<String, Object?> args = <String, Object?>{
      'id': palette.id,
      'colors': <int>[
        for (final Color c in palette.colors) c.toARGB32(),
      ],
      'foregroundColor': palette.foregroundColor.toARGB32(),
      if (darkVariant != null) ...<String, Object?>{
        'darkColors': <int>[
          for (final Color c in darkVariant.colors) c.toARGB32(),
        ],
        'darkForegroundColor': darkVariant.foregroundColor.toARGB32(),
      },
    };
    try {
      await _nativePaletteChannel.invokeMethod<void>(
        'setCoursePalette',
        args,
      );
    } on MissingPluginException catch (e) {
      log(
        'CourseScaffold: native palette sync unavailable '
        '(${e.message}); home widget will keep its previous colors.',
        name: 'CourseScaffold',
      );
    }
  }

  Future<void> _applyPickedPalette(CoursePaletteTheme picked) async {
    await PreferenceUtil.instance
        .setString(CoursePaletteTheme.preferenceKey, picked.id);
    unawaited(_syncCoursePaletteToNative(picked));
    if (!mounted) return;
    setState(() => _overridePalette = picked);
    widget.onCoursePaletteChanged?.call(picked);
    AnalyticsUtil.instance.logEvent('course_palette_change');
  }

  @override
  Widget build(BuildContext context) {
    return _withPaletteOverride(
      context,
      CourseConfig(
        showSectionTime: showSectionTime,
        showInstructors: showInstructors,
        showClassroomLocation: showClassroomLocation,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              widget.title ?? context.ap.course,
              overflow: TextOverflow.ellipsis,
            ),
            actions: <Widget>[
              ...widget.actions ?? <Widget>[],
              if (widget.itemPicker != null) ...<Widget>[
                widget.itemPicker!,
                const SizedBox(width: 8),
              ],
              if (widget.semesterData != null &&
                  widget.itemPicker == null) ...<Widget>[
                SemesterPicker(
                  semesterData: widget.semesterData!,
                  currentIndex: widget.semesterData!.currentIndex,
                  onSelect: (Semester semester, int index) {
                    widget.onSelect?.call(index);
                  },
                  featureTag: 'course',
                  controller: widget.semesterPickerController,
                  uiConfig: widget.semesterPickerUiConfig,
                ),
                const SizedBox(width: 8),
              ],
              if (widget.enableCaptureCourseTable)
                IconButton(
                  icon: Icon(ApIcon.download),
                  onPressed: _captureCourseTable,
                  tooltip: context.ap.exportCourseTable,
                ),
              IconButton(
                icon: Icon(ApIcon.menu),
                onPressed: () async {
                  final String currentId = _overridePalette?.id ??
                      Theme.of(context).extension<CoursePaletteTheme>()?.id ??
                      CoursePaletteTheme.material.id;
                  final CoursePaletteTheme? picked = await CourseSettings.show(
                    context: context,
                    currentId: currentId,
                    title: context.ap.courseColor,
                    settingsTitle: context.ap.courseScaffoldSetting,
                    showPaletteSelector: widget.enablePaletteSelector,
                    showSettings: true,
                    showSectionTime: showSectionTime,
                    showInstructors: showInstructors,
                    showClassroomLocation: showClassroomLocation,
                    showSearchButton: showSearchButton,
                    mergeCourse: mergeCourse,
                    showSectionTimeOnChanged: (bool? value) {
                      final bool next = value ?? false;
                      setState(() => showSectionTime = next);
                      PreferenceUtil.instance.setBool(
                        ApConstants.showSectionTime,
                        next,
                      );
                    },
                    showInstructorsOnChanged: (bool? value) {
                      final bool next = value ?? false;
                      setState(() => showInstructors = next);
                      PreferenceUtil.instance.setBool(
                        ApConstants.showInstructors,
                        next,
                      );
                    },
                    showClassroomLocationOnChanged: (bool? value) {
                      final bool next = value ?? false;
                      setState(() => showClassroomLocation = next);
                      PreferenceUtil.instance.setBool(
                        ApConstants.showClassroomLocation,
                        next,
                      );
                    },
                    showSearchButtonOnChanged: (bool? value) {
                      final bool next = value ?? false;
                      setState(() => showSearchButton = next);
                      PreferenceUtil.instance.setBool(
                        ApConstants.showCourseSearchButton,
                        next,
                      );
                    },
                    mergeCourseOnChanged: (bool? value) {
                      final bool next = value ?? false;
                      setState(() => mergeCourse = next);
                      PreferenceUtil.instance.setBool(
                        '${ApConstants.packageName}.merge_course',
                        next,
                      );
                    },
                  );
                  if (picked != null && picked.id != currentId) {
                    await _applyPickedPalette(picked);
                  }
                  AnalyticsUtil.instance.logEvent('course_setting_click');
                },
                tooltip: context.ap.courseScaffoldSetting,
              ),
            ],
          ),
          body: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (widget.customHint != null &&
                        widget.customHint!.isNotEmpty)
                      _buildHintBanner(),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await widget.onRefresh!();
                          AnalyticsUtil.instance.logEvent('course_refresh');
                          return;
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: KeyedSubtree(
                            key: ValueKey<CourseState>(widget.state),
                            child: _body(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.state == CourseState.finish &&
                  isLandscape) ...<Widget>[
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 2,
                  child: Material(
                    elevation: 12.0,
                    child: ColoredBox(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: CourseList(
                        courses: widget.courseData.courses,
                        timeCodes: widget.courseData.timeCodes,
                        invisibleCourseCodes: invisibleCourseCodes,
                        getCourseColor: _getCourseColor,
                        onVisibilityChanged: (
                          Course course,
                          bool visibility,
                        ) =>
                            saveInvisibleCourseCodes(
                          course: course,
                          visibility: visibility,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          floatingActionButton: AnimatedScale(
            scale: _showFab ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 250),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                if (!isLandscape)
                  FloatingActionButton(
                    key: const ValueKey<String>('switch_content_style_button'),
                    heroTag: 'switch_content_style_button',
                    onPressed: () {
                      setState(
                        () => _contentStyle =
                            (_contentStyle == _ContentStyle.table)
                                ? _ContentStyle.list
                                : _ContentStyle.table,
                      );
                    },
                    child: Icon(
                      _contentStyle == _ContentStyle.table
                          ? Icons.list_rounded
                          : Icons.grid_view_rounded,
                    ),
                  ),
                if (showSearchButton ?? true) ...<Widget>[
                  if (!isLandscape) const SizedBox(height: 8),
                  FloatingActionButton(
                    key: const ValueKey<String>('search_button'),
                    heroTag: 'search_button',
                    onPressed: () {
                      _pickSemester();
                      AnalyticsUtil.instance
                          .logEvent('course_search_button_click');
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get hintContent {
    switch (widget.state) {
      case CourseState.error:
        return context.ap.clickToRetry;
      case CourseState.empty:
        return context.ap.courseEmpty;
      case CourseState.offlineEmpty:
        return context.ap.noOfflineData;
      case CourseState.custom:
        return widget.customStateHint ?? context.ap.unknownError;
      default:
        return '';
    }
  }

  Widget _buildErrorState(
    ColorScheme colorScheme,
    String message,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        if (widget.state == CourseState.empty) {
          _pickSemester();
        } else {
          widget.onRefresh?.call();
        }
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withAlpha(77),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, size: 40, color: colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              context.ap.clickToRetry,
              style: TextStyle(fontSize: 14, color: colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHintBanner() {
    return HintBanner(text: widget.customHint!);
  }

  Widget _body() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    switch (widget.state) {
      case CourseState.loading:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      case CourseState.error:
        return _buildErrorState(
          colorScheme,
          context.ap.clickToRetry,
          Icons.error_outline_rounded,
        );
      case CourseState.empty:
        return _buildErrorState(
          colorScheme,
          context.ap.courseEmpty,
          Icons.event_busy_rounded,
        );
      case CourseState.offlineEmpty:
        return _buildErrorState(
          colorScheme,
          context.ap.noOfflineData,
          Icons.cloud_off_rounded,
        );
      case CourseState.custom:
        return _buildErrorState(
          colorScheme,
          widget.customStateHint ?? context.ap.unknownError,
          Icons.warning_amber_rounded,
        );
      default:
        if (isLandscape || _contentStyle == _ContentStyle.table) {
          final int weekdayCount = widget.courseData.hasHoliday ? 7 : 5;
          return SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 80.0,
            ),
            child: RepaintBoundary(
              key: _repaintBoundaryGlobalKey,
              child: ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: <Widget>[
                    _buildWeekdayHeader(colorScheme, weekdayCount),
                    _buildCourseGrid(
                      colorScheme,
                      weekdayCount,
                      widget.courseData.timeCodes,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return CourseList(
            controller: _scrollController,
            courses: widget.courseData.courses,
            timeCodes: widget.courseData.timeCodes,
            invisibleCourseCodes: invisibleCourseCodes,
            getCourseColor: _getCourseColor,
            onVisibilityChanged: (
              Course course,
              bool visibility,
            ) =>
                saveInvisibleCourseCodes(
              course: course,
              visibility: visibility,
            ),
          );
        }
    }
  }

  Future<void> _captureCourseTable() async {
    final RenderRepaintBoundary? boundary =
        _repaintBoundaryGlobalKey.currentContext!.findRenderObject()
            as RenderRepaintBoundary?;
    if (boundary == null) {
      UiUtil.instance.showToast(context, context.ap.unknownError);
      return;
    }
    final double pixelRatio =
        MediaQuery.devicePixelRatioOf(context).clamp(2.0, 4.0);
    final ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyyMMdd_hhmmss').format(now);
    if (byteData != null) {
      final SaveImageResult result = await MediaUtil.instance.saveImage(
        byteData: byteData,
        fileName: 'course_table_$formattedDate',
      );
      if (!mounted) return;
      switch (result) {
        case SaveImageSuccess(:final String filePath):
          final String message =
              '${context.ap.exportCourseTableSuccess}\n$filePath';
          Toast.show(message, context);
          AnalyticsUtil.instance.logEvent('export_course_table_image_success');
        case SaveImageError(:final String message):
          UiUtil.instance.showToast(context, message);
      }
    } else {
      if (!mounted) return;
      UiUtil.instance.showToast(context, context.ap.unknownError);
    }
  }

  Widget _buildWeekdayHeader(ColorScheme colorScheme, int weekdayCount) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withAlpha(77),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outlineVariant.withAlpha(128),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          _buildTimeSlotHeader(colorScheme),
          for (int i = 0; i < weekdayCount; i++)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  context.ap.weekdaysCourse[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotHeader(ColorScheme colorScheme) {
    return Container(
      width: 48,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildCourseGrid(
    ColorScheme colorScheme,
    int weekdayCount,
    List<TimeCode> timeCodes,
  ) {
    final int minIndex = widget.courseData.minTimeCodeIndex;
    final int maxIndex = widget.courseData.maxTimeCodeIndex;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTimeColumn(colorScheme, timeCodes, minIndex, maxIndex),
        for (int weekday = 1; weekday <= weekdayCount; weekday++)
          Expanded(
            child: _buildWeekdayColumn(
              colorScheme,
              weekday,
              weekdayCount,
              minIndex,
              maxIndex,
            ),
          ),
      ],
    );
  }

  Widget _buildTimeColumn(
    ColorScheme colorScheme,
    List<TimeCode> timeCodes,
    int minIndex,
    int maxIndex,
  ) {
    return Column(
      children: <Widget>[
        for (int i = minIndex; i <= maxIndex; i++)
          _buildTimeSlot(
            colorScheme,
            i < timeCodes.length ? timeCodes[i] : null,
            i,
            i == maxIndex,
          ),
      ],
    );
  }

  Widget _buildWeekdayColumn(
    ColorScheme colorScheme,
    int weekday,
    int weekdayCount,
    int minIndex,
    int maxIndex,
  ) {
    final List<Widget> children = <Widget>[];
    for (int i = minIndex; i <= maxIndex; i++) {
      final Course? course = _getCourseAt(weekday, i);

      if (course == null) {
        children.add(
          _buildEmptyCell(
            colorScheme,
            weekday < weekdayCount,
            i == maxIndex,
            weekday: weekday,
            timeIndex: i,
          ),
        );
      } else {
        int span = 1;
        if (mergeCourse ?? true) {
          while (i + span <= maxIndex &&
              _getCourseAt(weekday, i + span)?.code == course.code) {
            span++;
          }
        }
        children.add(
          _buildCourseCell(
            colorScheme,
            weekday,
            i,
            course,
            span,
            weekday < weekdayCount,
            i + span - 1 == maxIndex,
          ),
        );
        i += span - 1;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget _buildTimeSlot(
    ColorScheme colorScheme,
    TimeCode? timeCode,
    int timeIndex,
    bool isLast,
  ) {
    return Container(
      width: 48,
      height: _courseHeight,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(77),
        border: Border(
          right: BorderSide(
            color: colorScheme.outlineVariant.withAlpha(128),
          ),
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
                  color: colorScheme.outlineVariant.withAlpha(77),
                  width: 0.5,
                ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            timeCode?.title ?? '${timeIndex + 1}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          if (timeCode != null && (showSectionTime ?? true)) ...<Widget>[
            const SizedBox(height: 2),
            Text(
              timeCode.startTime,
              style: TextStyle(
                fontSize: 9,
                color: colorScheme.onSurfaceVariant.withAlpha(179),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyCell(
    ColorScheme colorScheme,
    bool showRightBorder,
    bool isLast, {
    required int weekday,
    required int timeIndex,
  }) {
    final bool canAdd = widget.enableCustomCourse;

    return GestureDetector(
      onTap: canAdd ? () => _addCustomCourse(weekday, timeIndex) : null,
      child: Container(
        height: _courseHeight,
        decoration: BoxDecoration(
          border: Border(
            right: showRightBorder
                ? BorderSide(
                    color: colorScheme.outlineVariant.withAlpha(51),
                    width: 0.5,
                  )
                : BorderSide.none,
            bottom: isLast
                ? BorderSide.none
                : BorderSide(
                    color: colorScheme.outlineVariant.withAlpha(77),
                    width: 0.5,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCell(
    ColorScheme colorScheme,
    int weekday,
    int timeIndex,
    Course course,
    int span,
    bool showRightBorder,
    bool isLast,
  ) {
    return Container(
      height: _courseHeight * span,
      decoration: BoxDecoration(
        border: Border(
          right: showRightBorder
              ? BorderSide(
                  color: colorScheme.outlineVariant.withAlpha(51),
                  width: 0.5,
                )
              : BorderSide.none,
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
                  color: colorScheme.outlineVariant.withAlpha(77),
                  width: 0.5,
                ),
        ),
      ),
      child: _buildCourseCard(colorScheme, weekday, timeIndex, course, span),
    );
  }

  void _buildCourseLookup() {
    _courseLookup = <int, Map<int, List<Course>>>{};
    _courseOverlapLookup = <String, Set<String>>{};
    _courseCodesInOrder = <String>[];

    for (final Course course in widget.courseData.courses) {
      if (!_courseOverlapLookup.containsKey(course.code)) {
        _courseOverlapLookup[course.code] = <String>{};
        _courseCodesInOrder.add(course.code);
      }
      for (final SectionTime time in course.times) {
        _courseLookup
            .putIfAbsent(
              time.weekday,
              () => <int, List<Course>>{},
            )
            .putIfAbsent(time.index, () => <Course>[])
            .add(course);
      }
    }

    for (final Map<int, List<Course>> weekday in _courseLookup.values) {
      for (final List<Course> courses in weekday.values) {
        for (int i = 0; i < courses.length; i++) {
          for (int j = i + 1; j < courses.length; j++) {
            final String firstCode = courses[i].code;
            final String secondCode = courses[j].code;
            if (firstCode == secondCode) continue;
            _courseOverlapLookup[firstCode]!.add(secondCode);
            _courseOverlapLookup[secondCode]!.add(firstCode);
          }
        }
      }
    }

    _recomputeOverlapHiddenCourses();
  }

  Course? _getCourseAt(int weekday, int timeIndex) {
    final List<Course>? courses = _courseLookup[weekday]?[timeIndex];
    if (courses == null) return null;

    for (final Course course in courses.reversed) {
      if (!invisibleCourseCodes.contains(course.code)) return course;
    }
    return null;
  }

  void _recomputeOverlapHiddenCourses() {
    if (!widget.autoHideOverlappingCourses) {
      _overlapHiddenCourseCodes = <String>{};
      invisibleCourseCodes = _manuallyHiddenCourseCodes.toList();
      return;
    }

    final Set<String> visibleCodes = _courseCodesInOrder
        .where(
          (String code) => !_manuallyHiddenCourseCodes.contains(code),
        )
        .toSet();
    final Set<String> overlapHidden = <String>{};

    for (final String preferredCode in _preferredVisibleCourseCodes) {
      if (!visibleCodes.contains(preferredCode)) continue;
      for (final String overlappingCode
          in _courseOverlapLookup[preferredCode] ?? <String>{}) {
        if (visibleCodes.remove(overlappingCode)) {
          overlapHidden.add(overlappingCode);
        }
      }
    }

    while (true) {
      String? codeToHide;
      int highestOverlapCount = 0;

      for (final String code in _courseCodesInOrder) {
        if (!visibleCodes.contains(code)) continue;
        final int overlapCount =
            _courseOverlapLookup[code]!.where(visibleCodes.contains).length;
        if (overlapCount > highestOverlapCount) {
          highestOverlapCount = overlapCount;
          codeToHide = code;
        }
      }

      if (codeToHide == null) break;
      visibleCodes.remove(codeToHide);
      overlapHidden.add(codeToHide);
    }

    _overlapHiddenCourseCodes = overlapHidden;
    invisibleCourseCodes = <String>[
      ..._manuallyHiddenCourseCodes,
      ..._overlapHiddenCourseCodes,
    ];
  }

  Widget _buildCourseCard(
    ColorScheme colorScheme,
    int weekday,
    int timeIndex,
    Course course,
    int span,
  ) {
    final Color courseColor = _getCourseColor(course);
    final String locationInfo =
        (showClassroomLocation ?? true) && course.location != null
            ? course.location.toString()
            : '';
    final String instructorInfo =
        (showInstructors ?? true) ? course.getInstructors() : '';

    final Color onCourseColor = _activePalette(context).foregroundColor;

    final String displayInfo = <String>[
      if (instructorInfo.isNotEmpty) instructorInfo,
      if (locationInfo.isNotEmpty) locationInfo,
    ].join('\n');

    return GestureDetector(
      onTap: () {
        final List<TimeCode> timeCodes = widget.courseData.timeCodes;
        final TimeCode startTimeCode = timeIndex < timeCodes.length
            ? timeCodes[timeIndex]
            : const TimeCode(title: '?', startTime: '?', endTime: '?');
        final int lastIndex = timeIndex + span - 1;
        final TimeCode endTimeCode =
            lastIndex < timeCodes.length ? timeCodes[lastIndex] : startTimeCode;
        final TimeCode timeCode = startTimeCode.copyWith(
          endTime: endTimeCode.endTime,
        );
        _onPressed(weekday, timeCode, course);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        decoration: BoxDecoration(
          color: courseColor.withAlpha(CoursePaletteTheme.cardAlpha),
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: courseColor.withAlpha(77),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              course.title,
              textAlign: TextAlign.center,
              maxLines: span > 1 ? 4 : 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: span > 1 ? 14 : 9.5,
                fontWeight: FontWeight.w600,
                color: onCourseColor,
                height: 1.1,
              ),
            ),
            if (displayInfo.isNotEmpty) ...<Widget>[
              SizedBox(height: span > 1 ? 4 : 2),
              Text(
                displayInfo,
                textAlign: TextAlign.center,
                maxLines: span > 1 ? 4 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: span > 1 ? 12 : 8.5,
                  color: onCourseColor.withAlpha(217),
                  height: 1.0,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _onPressed(int weekday, TimeCode timeCode, Course course) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0x00000000),
      isScrollControlled: true,
      builder: (BuildContext builder) {
        return _withPaletteOverride(
          builder,
          CourseContent(
            enableNotifyControl: widget.enableNotifyControl,
            course: course,
            notifyData: widget.notifyData,
            weekday: weekday,
            courseNotifySaveKey: widget.courseNotifySaveKey,
            timeCode: timeCode,
            courseColor: _getCourseColor(course),
            invisibleCourseCodes: invisibleCourseCodes,
            onVisibilityChanged: (bool visibility) => saveInvisibleCourseCodes(
              course: course,
              visibility: visibility,
            ),
            enableCustomCourseEdit:
                widget.enableCustomCourse && course.isCustomCourse,
            onEditCourse: () {
              Navigator.of(builder).pop();
              _editCustomCourse(course);
            },
            onDeleteCourse: () {
              Navigator.of(builder).pop();
              _deleteCustomCourse(course);
            },
          ),
        );
      },
    );
  }

  Future<void> _addCustomCourse(int weekday, int timeIndex) async {
    final Course? result = await CourseEditSheet.show(
      context: context,
      timeCodes: widget.courseData.timeCodes,
      existingCourses: widget.courseData.courses,
      initialWeekday: weekday,
      initialTimeIndex: timeIndex,
      coursePalette: _activePalette(context),
    );
    if (result == null || !mounted) return;
    final CustomCourseData updated =
        (widget.customCourseData ?? CustomCourseData()).add(result);
    widget.onCustomCourseChanged?.call(updated);
    UiUtil.instance.showToast(context, context.ap.addCourseSuccess);
  }

  Future<void> _editCustomCourse(Course course) async {
    final Course? result = await CourseEditSheet.show(
      context: context,
      timeCodes: widget.courseData.timeCodes,
      existingCourses: widget.courseData.courses,
      course: course,
      coursePalette: _activePalette(context),
    );
    if (result == null || !mounted) return;
    final CustomCourseData updated =
        (widget.customCourseData ?? CustomCourseData())
            .update(course.code, result);
    widget.onCustomCourseChanged?.call(updated);
    UiUtil.instance.showToast(context, context.ap.updateCourseSuccess);
  }

  void _deleteCustomCourse(Course course) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: Text(context.ap.deleteCourse),
        content: Text(context.ap.deleteCourseConfirm),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(context.ap.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(context.ap.confirm),
          ),
        ],
      ),
    ).then((bool? confirmed) {
      if (confirmed != true || !mounted) return;
      final CustomCourseData updated =
          (widget.customCourseData ?? CustomCourseData()).remove(course.code);
      widget.onCustomCourseChanged?.call(updated);
      UiUtil.instance.showToast(context, context.ap.deleteCourseSuccess);
    });
  }

  void _pickSemester() {
    if (widget.semesterData != null) {
      SemesterPicker.show(
        context: context,
        semesterData: widget.semesterData!,
        currentIndex: widget.semesterData!.currentIndex,
        onSelect: (Semester semester, int index) {
          widget.onSelect?.call(index);
        },
        controller: widget.semesterPickerController,
      );
    }
    widget.onSearchButtonClick?.call();
  }

  void saveInvisibleCourseCodes({
    required Course course,
    required bool visibility,
  }) {
    if (visibility) {
      _manuallyHiddenCourseCodes.remove(course.code);
      _preferredVisibleCourseCodes.removeAll(
        _courseOverlapLookup[course.code] ?? <String>{},
      );
      _preferredVisibleCourseCodes.add(course.code);
    } else {
      _manuallyHiddenCourseCodes.add(course.code);
      _preferredVisibleCourseCodes.remove(course.code);
    }
    _recomputeOverlapHiddenCourses();
    PreferenceUtil.instance.setStringList(
      '$_kCourseInvisibleKey${widget.courseNotifySaveKey}',
      _manuallyHiddenCourseCodes.toList(),
    );
    PreferenceUtil.instance.setStringList(
      '$_kCoursePreferredVisibleKey${widget.courseNotifySaveKey}',
      _preferredVisibleCourseCodes.toList(),
    );
    setState(() {});
  }

  void fetchInvisibleCourseCodes() {
    _manuallyHiddenCourseCodes = PreferenceUtil.instance.getStringList(
      '$_kCourseInvisibleKey${widget.courseNotifySaveKey}',
      <String>[],
    ).toSet();
    _preferredVisibleCourseCodes = PreferenceUtil.instance.getStringList(
      '$_kCoursePreferredVisibleKey${widget.courseNotifySaveKey}',
      <String>[],
    ).toSet();
    _recomputeOverlapHiddenCourses();
    setState(() {});
  }
}

class CourseContent extends StatefulWidget {
  const CourseContent({
    super.key,
    required this.enableNotifyControl,
    required this.course,
    required this.timeCode,
    required this.weekday,
    this.notifyData,
    this.autoNotifySave = true,
    this.onNotifyClick,
    this.courseNotifySaveKey = ApConstants.semesterLatest,
    this.enableAddToCalendar = true,
    this.androidResourceIcon,
    this.invisibleCourseCodes = const <String>[],
    this.onVisibilityChanged,
    this.courseColor,
    this.enableCustomCourseEdit = false,
    this.onEditCourse,
    this.onDeleteCourse,
  });

  final bool enableNotifyControl;
  final Course course;
  final TimeCode timeCode;
  final int weekday;
  final CourseNotifyData? notifyData;
  final bool autoNotifySave;
  final CourseNotifyCallback? onNotifyClick;
  final String courseNotifySaveKey;
  final bool enableAddToCalendar;
  final String? androidResourceIcon;
  final List<String> invisibleCourseCodes;
  final ValueChanged<bool>? onVisibilityChanged;
  final Color? courseColor;
  final bool enableCustomCourseEdit;
  final VoidCallback? onEditCourse;
  final VoidCallback? onDeleteCourse;

  @override
  _CourseContentState createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  CourseNotifyData? _notifyData;

  @override
  void initState() {
    _notifyData = widget.notifyData;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CourseContent oldWidget) {
    if (widget.notifyData != oldWidget.notifyData) {
      _notifyData = widget.notifyData;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    CourseNotifyState? state;
    if (widget.enableNotifyControl && _notifyData != null) {
      state = _notifyData!.getByCode(
                widget.course.code,
                widget.timeCode.startTime,
                widget.weekday,
              ) ==
              null
          ? CourseNotifyState.cancel
          : CourseNotifyState.schedule;
    }
    final bool visibility =
        !widget.invisibleCourseCodes.contains(widget.course.code);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final CoursePaletteTheme palette = CoursePaletteTheme.of(context);
    final Color courseColor =
        widget.courseColor ?? palette.colorAt(widget.course.code.hashCode);
    final Color onCourseColor = palette.foregroundColor;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 20, right: 8, top: 12, bottom: 20),
            decoration: BoxDecoration(
              color: courseColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    if ((!kIsWeb && (Platform.isAndroid || Platform.isIOS)) &&
                        widget.enableAddToCalendar)
                      IconButton(
                        tooltip: context.ap.addToCalendar,
                        icon: Image.asset(
                          ApImageIcons.calendarImport,
                          color: onCourseColor,
                          height: 24.0,
                          width: 24.0,
                        ),
                        onPressed: () {
                          final DateFormat format = DateFormat('HH:mm');
                          final DateTime startTime =
                              format.parse(widget.timeCode.startTime);
                          final DateTime endTime =
                              format.parse(widget.timeCode.endTime);
                          PlatformCalendarUtil.instance.addToApp(
                            title: widget.course.title,
                            location: widget.course.location?.toString() ?? '',
                            startDate: startTime.weekTime(widget.weekday),
                            endDate: endTime.weekTime(widget.weekday),
                            timeZone: 'GMT+8',
                          );
                          AnalyticsUtil.instance
                              .logEvent('course_export_to_calendar');
                        },
                      ),
                    IconButton(
                      icon: Icon(
                        visibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: onCourseColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.onVisibilityChanged?.call(!visibility);
                        });
                      },
                    ),
                    if (widget.enableCustomCourseEdit) ...<Widget>[
                      IconButton(
                        tooltip: context.ap.editCourse,
                        icon: Icon(
                          Icons.edit_outlined,
                          color: onCourseColor,
                        ),
                        onPressed: widget.onEditCourse,
                      ),
                      IconButton(
                        tooltip: context.ap.deleteCourse,
                        icon: Icon(
                          Icons.delete_outline,
                          color: onCourseColor,
                        ),
                        onPressed: widget.onDeleteCourse,
                      ),
                    ],
                    if (widget.enableNotifyControl &&
                        _notifyData != null &&
                        NotificationUtil.instance.isSupport)
                      IconButton(
                        icon: Icon(
                          state == CourseNotifyState.schedule
                              ? Icons.alarm_on
                              : Icons.alarm_off,
                          color: onCourseColor,
                        ),
                        onPressed: () async {
                          CourseNotify? courseNotify = _notifyData!.getByCode(
                            widget.course.code,
                            widget.timeCode.startTime,
                            widget.weekday,
                          );
                          if (widget.autoNotifySave) {
                            if (courseNotify == null) {
                              courseNotify = CourseNotify.fromCourse(
                                id: _notifyData!.lastId + 1,
                                course: widget.course,
                                weekday: widget.weekday,
                                timeCode: widget.timeCode,
                              );
                              await NotificationUtil.instance
                                  .scheduleCourseNotify(
                                context: context,
                                courseNotify: courseNotify,
                                weekday: widget.weekday,
                                androidResourceIcon: widget.androidResourceIcon,
                              );
                              _notifyData = _notifyData!.copyWith(
                                lastId: _notifyData!.lastId + 1,
                                data: <CourseNotify>[
                                  ..._notifyData!.data,
                                  courseNotify,
                                ],
                              );
                              _notifyData!.save(widget.courseNotifySaveKey);
                              if (!context.mounted) return;
                              UiUtil.instance.showToast(
                                context,
                                context.ap.courseNotifyHint,
                              );
                              AnalyticsUtil.instance
                                  .logEvent('course_notify_schedule');
                            } else {
                              await NotificationUtil.instance.cancelNotify(
                                id: courseNotify.id,
                              );
                              final List<CourseNotify> newData = <CourseNotify>[
                                ..._notifyData!.data,
                              ];
                              newData.removeWhere((CourseNotify data) {
                                return data.id == courseNotify!.id;
                              });
                              _notifyData = _notifyData!.copyWith(
                                data: newData,
                              );
                              _notifyData!.save(widget.courseNotifySaveKey);
                              if (!context.mounted) return;
                              UiUtil.instance.showToast(
                                context,
                                context.ap.cancelNotifySuccess,
                              );
                            }
                            setState(() {});
                            AnalyticsUtil.instance
                                .logEvent('course_notify_cancel');
                          }
                          if (widget.onNotifyClick != null) {
                            if (!mounted) return;
                            widget.onNotifyClick?.call(
                              courseNotify,
                              CourseNotifyState.values[(state!.index + 1) %
                                  (CourseNotifyState.values.length)],
                            );
                          }
                        },
                      ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.course.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: onCourseColor,
                        ),
                      ),
                    ),
                    if (widget.course.required != null &&
                        widget.course.required!.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: onCourseColor.withAlpha(51),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          widget.course.required!,
                          style: TextStyle(
                            fontSize: 12,
                            color: onCourseColor,
                          ),
                        ),
                      ),
                  ],
                ),
                if (!widget.course.isCustomCourse) ...<Widget>[
                  const SizedBox(height: 8),
                  Text(
                    widget.course.code,
                    style: TextStyle(
                      fontSize: 14,
                      color: onCourseColor.withAlpha(204),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                _buildDetailRow(
                  Icons.person_outline_rounded,
                  context.ap.courseDialogProfessor,
                  widget.course.getInstructors(),
                  colorScheme,
                ),
                _buildDetailRow(
                  Icons.location_on_outlined,
                  context.ap.courseDialogLocation,
                  widget.course.location?.toString() ?? '-',
                  colorScheme,
                ),
                _buildDetailRow(
                  Icons.school_outlined,
                  context.ap.creditCount,
                  '${widget.course.units ?? "-"} ${context.ap.units}',
                  colorScheme,
                ),
                _buildDetailRow(
                  Icons.schedule_outlined,
                  context.ap.courseDialogTime,
                  '${widget.timeCode.startTime}-${widget.timeCode.endTime}',
                  colorScheme,
                ),
                if (widget.course.className != null &&
                    widget.course.className!.isNotEmpty)
                  _buildDetailRow(
                    Icons.class_outlined,
                    context.ap.studentClass,
                    widget.course.className!,
                    colorScheme,
                  ),
                if (widget.course.hours != null &&
                    widget.course.hours!.isNotEmpty)
                  _buildDetailRow(
                    Icons.timer_outlined,
                    context.ap.courseHours,
                    widget.course.hours!,
                    colorScheme,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String label,
    String value,
    ColorScheme colorScheme,
  ) {
    if (value.isEmpty || value == '-') return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withAlpha(128),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 18,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                SelectableText(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  const CourseList({
    super.key,
    required this.courses,
    this.invisibleCourseCodes = const <String>[],
    this.onVisibilityChanged,
    this.timeCodes,
    this.controller,
    this.getCourseColor,
  });

  final List<Course> courses;
  final List<String> invisibleCourseCodes;
  final void Function(Course, bool)? onVisibilityChanged;
  final List<TimeCode>? timeCodes;
  final ScrollController? controller;
  final Color Function(Course)? getCourseColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final CoursePaletteTheme palette = CoursePaletteTheme.of(context);

    return ListView.builder(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        bottom: 80.0,
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      itemCount: courses.length,
      itemBuilder: (_, int index) {
        final Course course = courses[index];
        final bool visibility = !invisibleCourseCodes.contains(course.code);
        final Color courseColor = getCourseColor?.call(course) ??
            palette.colorAt(course.code.hashCode);
        final String instructors = course.getInstructors();

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outlineVariant.withAlpha(77),
            ),
          ),
          child: InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: const Color(0x00000000),
                isScrollControlled: true,
                builder: (BuildContext sheetCtx) {
                  final ThemeData sheetTheme = Theme.of(sheetCtx);
                  final List<ThemeExtension<dynamic>> merged =
                      sheetTheme.extensions.values
                          .where(
                            (ThemeExtension<dynamic> ext) =>
                                ext is! CoursePaletteTheme,
                          )
                          .toList()
                        ..add(palette);
                  return Theme(
                    data: sheetTheme.copyWith(extensions: merged),
                    child: CourseContent(
                      course: course,
                      invisibleCourseCodes: invisibleCourseCodes,
                      onVisibilityChanged: (bool visible) =>
                          onVisibilityChanged?.call(course, visible),
                      timeCode: timeCodes != null && timeCodes!.isNotEmpty
                          ? timeCodes![0]
                          : const TimeCode(
                              title: '',
                              startTime: '',
                              endTime: '',
                            ),
                      weekday: course.times.isNotEmpty
                          ? course.times.first.weekday
                          : 1,
                      courseColor: courseColor,
                      enableNotifyControl: false,
                    ),
                  );
                },
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: courseColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          course.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          instructors.isNotEmpty
                              ? instructors
                              : context.ap.unknown,
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          course.location?.toString() ?? '-',
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        key: ValueKey<String>(
                          'course_visibility_${course.code}',
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          visibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () =>
                            onVisibilityChanged?.call(course, !visibility),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: courseColor.withAlpha(26),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${course.units ?? "-"} ${context.ap.units}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: courseColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

extension DateTimeExtension on DateTime {
  DateTime weekTime(int weekday) {
    final DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    ).add(
      Duration(
        days: weekday - now.weekday,
      ),
    );
  }
}
