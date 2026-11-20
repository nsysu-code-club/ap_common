import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/res/assets.dart';
import 'package:ap_common_example/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Owns the home destination's announcements and schedule summary.
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.isLogin,
    required this.userInfo,
    required this.displayPicture,
    required this.onAvatarTap,
    required this.onLoginTap,
    this.enableStartupSideEffects = true,
    this.additionalEntries = const <Widget>[],
  });

  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final VoidCallback onAvatarTap;
  final VoidCallback onLoginTap;
  final bool enableStartupSideEffects;
  final List<Widget> additionalEntries;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeState _state = HomeState.loading;
  List<Announcement> _announcements = <Announcement>[];
  CourseData? _courseData;

  @override
  void initState() {
    super.initState();
    if (!widget.enableStartupSideEffects) {
      _state = HomeState.empty;
      return;
    }
    _getAnnouncements();
    _loadCourseData();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enableStartupSideEffects &&
        widget.isLogin != oldWidget.isLogin) {
      _loadCourseData();
      if (_state != HomeState.finish) _getAnnouncements();
    }
  }

  Future<void> _loadCourseData() async {
    final String raw = await rootBundle.loadString(FileAssets.courses);
    if (mounted) setState(() => _courseData = CourseData.fromRawJson(raw));
  }

  Future<void> _getAnnouncements() async {
    final ApiResult<List<Announcement>> result =
        await AnnouncementHelper.instance.getAnnouncements(tags: <String>[]);
    if (!mounted) return;
    switch (result) {
      case ApiSuccess<List<Announcement>>(:final List<Announcement> data):
        setState(() {
          _announcements = data;
          _state = data.isEmpty ? HomeState.empty : HomeState.finish;
        });
      case ApiFailure<List<Announcement>>():
      case ApiError<List<Announcement>>():
        setState(() => _state = HomeState.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApHomeContent(
        title: context.app.appName,
        labels: ApHomeContentLabels(
          loginTitle: context.app.loginCardTitle,
          loginSubtitle: context.app.loginCardSubtitle,
          latestAnnouncements: context.app.latestAnnouncements,
          postAnnouncement: context.app.postAnnouncement,
          courseNotLoaded: context.app.courseNotLoaded,
        ),
        isLogin: widget.isLogin,
        userInfo: widget.userInfo,
        displayPicture: widget.displayPicture,
        announcementState: _state,
        announcements: _announcements,
        courseData: _courseData,
        onAvatarTap: widget.onAvatarTap,
        onLoginTap: widget.onLoginTap,
        onOpenCourse: () => ApAppShell.select(context, 'sch'),
        onOpenAnnouncementReview: () => ApUtils.pushCupertinoStyle(
          context,
          const AnnouncementHomePage(),
        ),
        onAnnouncementTap: (Announcement announcement) =>
            ApUtils.pushCupertinoStyle(
          context,
          AnnouncementContentPage(announcement: announcement),
        ),
        onRefreshAnnouncements: _getAnnouncements,
        additionalEntries: widget.additionalEntries,
      ),
    );
  }
}
