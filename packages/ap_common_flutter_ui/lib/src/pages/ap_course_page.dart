import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

/// A ready-to-use course page that handles semester loading and
/// state management internally using [DataState].
///
/// Instead of managing [CourseState], [SemesterData], [CourseData] manually,
/// just provide data-fetching callbacks:
///
/// ```dart
/// ApCoursePage(
///   onLoadSemesters: () => api.getSemesters(),
///   onLoadCourse: (semester) => api.getCourseData(semester),
/// )
/// ```
class ApCoursePage extends StatefulWidget {
  const ApCoursePage({
    super.key,
    required this.onLoadSemesters,
    required this.onLoadCourse,
    this.onCourseLoaded,
    this.title,
    this.enableNotifyControl = true,
    this.enableAddToCalendar = true,
    this.enableCaptureCourseTable = false,
    this.enableCustomCourse = false,
    this.autoHideOverlappingCourses = false,
    this.androidResourceIcon,
    this.actions,
    this.showSectionTime,
    this.showInstructors,
    this.showClassroomLocation,
    this.courseNotifySaveKey,
  });

  /// Load the semester list. Called once on init.
  final Future<SemesterData> Function() onLoadSemesters;

  /// Load course data for the given [Semester].
  final Future<CourseData> Function(Semester semester) onLoadCourse;

  /// Called after course data is successfully loaded and the UI state
  /// is updated. [isDefaultSemester] is `true` when the loaded
  /// semester matches [SemesterData.defaultIndex].
  /// Only update platform widgets (e.g.
  /// `ApCommonPlugin.updateCourseWidget`) when `isDefaultSemester`
  /// is `true` to avoid overwriting with old semester data.
  final void Function(
    CourseData courseData,
    bool isDefaultSemester,
  )? onCourseLoaded;

  final String? title;
  final bool enableNotifyControl;
  final bool enableAddToCalendar;
  final bool enableCaptureCourseTable;
  final bool autoHideOverlappingCourses;

  /// Enable the custom course feature (add/edit/delete).
  final bool enableCustomCourse;

  final String? androidResourceIcon;
  final List<Widget>? actions;
  final bool? showSectionTime;
  final bool? showInstructors;
  final bool? showClassroomLocation;
  final String? courseNotifySaveKey;

  @override
  State<ApCoursePage> createState() => _ApCoursePageState();
}

class _ApCoursePageState extends State<ApCoursePage> {
  DataState<CourseData> _state = const DataLoading<CourseData>();
  SemesterData? _semesterData;
  CourseNotifyData? _notifyData;
  final SemesterPickerController _pickerController = SemesterPickerController();

  /// API-fetched course data (before merging custom courses).
  CourseData? _apiCourseData;

  /// User-created custom courses.
  CustomCourseData _customCourseData = CustomCourseData();

  String get _notifyCacheKey =>
      widget.courseNotifySaveKey ??
      PreferenceUtil.instance.getString(
        ApConstants.currentSemesterCode,
        ApConstants.semesterLatest,
      );

  @override
  void initState() {
    super.initState();
    _loadSemesters();
  }

  @override
  void dispose() {
    _pickerController.dispose();
    super.dispose();
  }

  Future<void> _loadSemesters() async {
    try {
      _semesterData = await widget.onLoadSemesters();
      _loadCourse();
    } catch (_) {
      if (mounted) {
        setState(() => _state = const DataError<CourseData>());
      }
    }
  }

  Future<void> _loadCourse() async {
    if (_semesterData == null) return;
    final Semester semester = _semesterData!.data[_semesterData!.currentIndex];
    setState(() => _state = const DataLoading<CourseData>());
    try {
      final CourseData courseData = await widget.onLoadCourse(semester);
      if (mounted) {
        _apiCourseData = courseData;
        if (widget.enableCustomCourse) {
          _customCourseData = CustomCourseData.load(_notifyCacheKey);
        }
        setState(() {
          if (courseData.courses.isEmpty && _customCourseData.courses.isEmpty) {
            _state = const DataEmpty<CourseData>();
            _pickerController.markSemesterEmpty(semester);
          } else {
            final CourseData merged =
                courseData.mergeCustom(_customCourseData.courses);
            _state = DataLoaded<CourseData>(merged);
            _notifyData = CourseNotifyData.load(_notifyCacheKey);
            final bool isDefault =
                _semesterData!.currentIndex == _semesterData!.defaultIndex;
            widget.onCourseLoaded?.call(merged, isDefault);
            _pickerController.markSemesterHasData(semester);
          }
        });
      }
    } catch (e) {
      if (mounted) {
        _pickerController.markSemesterHasData(semester);
        setState(
          () => _state = DataError<CourseData>(hint: e.toString()),
        );
      }
    }
  }

  void _onCustomCourseChanged(CustomCourseData updated) {
    _customCourseData = CustomCourseData(
      courses: updated.courses,
      tag: _notifyCacheKey,
    );
    _customCourseData.save();
    if (_apiCourseData != null && mounted) {
      setState(() {
        final CourseData merged =
            _apiCourseData!.mergeCustom(_customCourseData.courses);
        if (merged.courses.isEmpty) {
          _state = const DataEmpty<CourseData>();
        } else {
          _state = DataLoaded<CourseData>(merged);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CourseScaffold(
      state: _state.when(
        loading: () => CourseState.loading,
        loaded: (_, __) => CourseState.finish,
        error: (_) => CourseState.error,
        empty: (_) => CourseState.empty,
      ),
      courseData: _state.dataOrNull ?? CourseData.empty(),
      notifyData: _notifyData,
      title: widget.title,
      customHint: _state is DataLoaded<CourseData>
          ? (_state as DataLoaded<CourseData>).hint
          : null,
      customStateHint: _state is DataError<CourseData>
          ? (_state as DataError<CourseData>).hint
          : null,
      courseNotifySaveKey: _notifyCacheKey,
      semesterData: _semesterData,
      enableNotifyControl: widget.enableNotifyControl,
      enableAddToCalendar: widget.enableAddToCalendar,
      enableCaptureCourseTable: widget.enableCaptureCourseTable,
      enableCustomCourse: widget.enableCustomCourse,
      autoHideOverlappingCourses: widget.autoHideOverlappingCourses,
      customCourseData: _customCourseData,
      onCustomCourseChanged: _onCustomCourseChanged,
      androidResourceIcon: widget.androidResourceIcon,
      actions: widget.actions,
      showSectionTime: widget.showSectionTime,
      showInstructors: widget.showInstructors,
      showClassroomLocation: widget.showClassroomLocation,
      semesterPickerController: _pickerController,
      onSelect: (int index) {
        _semesterData = _semesterData!.copyWith(currentIndex: index);
        _loadCourse();
      },
      onRefresh: () async {
        await _loadCourse();
        return null;
      },
    );
  }
}
