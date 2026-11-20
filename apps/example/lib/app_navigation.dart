import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/config/constants.dart';
import 'package:ap_common_example/pages/bus_page.dart';
import 'package:ap_common_example/pages/campus_page.dart';
import 'package:ap_common_example/pages/diolog_utils_page.dart';
import 'package:ap_common_example/pages/home_page.dart';
import 'package:ap_common_example/pages/login_page.dart';
import 'package:ap_common_example/pages/notification_utils_page.dart';
import 'package:ap_common_example/pages/school_info_page.dart';
import 'package:ap_common_example/pages/setting_page.dart';
import 'package:ap_common_example/pages/simple_example/simple_home_page.dart';
import 'package:ap_common_example/pages/study/course_page.dart';
import 'package:ap_common_example/pages/study/score_page.dart';
import 'package:ap_common_example/pages/user_info_page.dart';
import 'package:ap_common_example/res/assets.dart';
import 'package:ap_common_example/utils/app_localizations.dart';
import 'package:ap_common_example/widgets/account_sheet.dart';
import 'package:ap_common_plugin/ap_common_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

/// Assembles this example's destinations and account flows.
class AppNavigation extends StatefulWidget {
  const AppNavigation({
    super.key,
    this.enableStartupSideEffects = true,
  });

  final bool enableStartupSideEffects;

  static Widget aboutPage(BuildContext context, {String? assetImage}) {
    return AboutUsPage(
      assetImage: assetImage ?? ImageAssets.kuasap2,
      githubName: 'NKUST-ITC',
      email: 'abc873693@gmail.com',
      appLicense: context.app.aboutOpenSourceContent,
      fbFanPageId: '735951703168873',
      fbFanPageUrl: 'https://www.facebook.com/NKUST.ITC/',
      githubUrl: 'https://github.com/NKUST-ITC',
    );
  }

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  bool _isLogin = false;
  bool _displayPicture = true;
  UserInfo? _userInfo;
  Future<void>? _loginRequest;
  int _accountRevision = 0;
  int _shellRevision = 0;

  @override
  void initState() {
    super.initState();
    if (widget.enableStartupSideEffects) _restoreSession();
  }

  Future<void> _restoreSession() async {
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted) return;
    _refreshPreferences();
    if (PreferenceUtil.instance.getBool(Constants.PREF_AUTO_LOGIN, false)) {
      setState(() => _isLogin = true);
      await PreferenceUtil.instance
          .setBool(Constants.PREF_IS_OFFLINE_LOGIN, false);
      await _loadUserInfo();
    }
  }

  void _refreshPreferences() {
    if (!mounted) return;
    setState(() {
      _displayPicture = PreferenceUtil.instance.getBool(
        Constants.PREF_DISPLAY_PICTURE,
        true,
      );
    });
  }

  Future<void> _loadUserInfo() async {
    final int revision = _accountRevision;
    final String raw = await rootBundle.loadString(FileAssets.userInfo);
    if (!mounted || !_isLogin || revision != _accountRevision) return;
    final UserInfo info = UserInfo.fromRawJson(raw);
    setState(() => _userInfo = info);
    await ApCommonPlugin.updateUserInfoWidget(info);
    if (!_displayPicture || info.pictureUrl == null) return;
    try {
      final http.Response response =
          await http.get(Uri.parse(info.pictureUrl!));
      if (!mounted || !_isLogin || revision != _accountRevision) return;
      if (response.statusCode == 200 && !response.body.contains('html')) {
        setState(() {
          _userInfo = info.copyWith(pictureBytes: response.bodyBytes);
        });
      }
    } catch (_) {
      // The account remains usable when the optional picture is unavailable.
    }
  }

  Future<void> _openLogin() => _loginRequest ??= _showLogin().whenComplete(() {
        _loginRequest = null;
      });

  Future<void> _showLogin() async {
    final bool? result = await Navigator.of(context, rootNavigator: true)
        .push<bool>(MaterialPageRoute<bool>(builder: (_) => LoginPage()));
    if (!mounted) return;
    if (result == true) {
      _accountRevision++;
      setState(() => _isLogin = true);
      await _loadUserInfo();
    }
    _refreshPreferences();
  }

  Future<bool> _canSelectDestination(String id) async {
    if (id != 'sch' && id != 'score') return true;
    if (_isLogin) return true;
    await _openLogin();
    return mounted && _isLogin;
  }

  Future<void> _openPage(BuildContext pageContext, Widget page) async {
    await Navigator.of(pageContext).push<void>(
      MaterialPageRoute<void>(builder: (_) => page),
    );
    _refreshPreferences();
  }

  void _handleAvatarTap(BuildContext pageContext) {
    if (!_isLogin) {
      _openLogin();
      return;
    }
    AccountSheet.show(
      context: pageContext,
      userInfo: _userInfo,
      displayPicture: _displayPicture,
      onOpenProfile: () {
        final UserInfo? info = _userInfo;
        if (info != null) _openPage(pageContext, UserInfoPage(userInfo: info));
      },
      onOpenSettings: () => _openPage(pageContext, SettingPage()),
      onOpenAbout: () =>
          _openPage(pageContext, AppNavigation.aboutPage(context)),
      onLogout: _logout,
    );
  }

  Future<void> _logout() async {
    await PreferenceUtil.instance.setBool(Constants.PREF_AUTO_LOGIN, false);
    await ApCommonPlugin.clearUserInfoWidget();
    if (!mounted) return;
    _accountRevision++;
    setState(() {
      _isLogin = false;
      _userInfo = null;
      _shellRevision++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ApAppShell(
      key: ValueKey<int>(_shellRevision),
      canSelectDestination: _canSelectDestination,
      destinations: <ApDestination>[
        ApDestination(
          id: 'home',
          label: context.ap.home,
          icon: ApIcon.home,
          selectedIcon: ApIcon.home,
          builder: (BuildContext context) => HomePage(
            isLogin: _isLogin,
            userInfo: _userInfo,
            displayPicture: _displayPicture,
            enableStartupSideEffects: widget.enableStartupSideEffects,
            onAvatarTap: () => _handleAvatarTap(context),
            onLoginTap: _openLogin,
          ),
        ),
        ApDestination(
          id: 'bus',
          label: context.app.tabBus,
          icon: ApIcon.directionsBus,
          selectedIcon: ApIcon.directionsBus,
          builder: (BuildContext context) => BusPage(
            isLogin: _isLogin,
            userInfo: _userInfo,
            displayPicture: _displayPicture,
            onAvatarTap: () => _handleAvatarTap(context),
          ),
        ),
        ApDestination(
          id: 'sch',
          label: context.ap.course,
          icon: ApIcon.classIcon,
          selectedIcon: ApIcon.classIcon,
          builder: (_) => CoursePage(),
        ),
        ApDestination(
          id: 'score',
          label: context.ap.score,
          icon: ApIcon.assignment,
          selectedIcon: ApIcon.assignment,
          builder: (_) => ScorePage(),
        ),
        ApDestination(
          id: 'more',
          label: context.app.tabMore,
          icon: ApIcon.school,
          selectedIcon: ApIcon.school,
          builder: (BuildContext context) => CampusPage(
            isLogin: _isLogin,
            userInfo: _userInfo,
            displayPicture: _displayPicture,
            onAvatarTap: () => _handleAvatarTap(context),
            onOpenSchoolInfo: () => _openPage(context, SchoolInfoPage()),
            onOpenAnnouncementReview: () =>
                _openPage(context, const AnnouncementHomePage()),
            onOpenSettings: () => _openPage(context, SettingPage()),
            onOpenAbout: () => _openPage(
              context,
              AppNavigation.aboutPage(
                context,
                assetImage: ImageAssets.sectionJiangong,
              ),
            ),
            additionalEntries: <Widget>[
              if (NotificationUtil.instance.isSupport)
                AppleGroupedTile(
                  icon: ApIcon.dateRange,
                  title: context.app.localNotificationTest,
                  onTap: () => _openPage(context, NotificationUtilsTestPage()),
                ),
              AppleGroupedTile(
                icon: ApIcon.check,
                title: context.app.dialogUtilTest,
                onTap: () => _openPage(context, DialogUtilsTestPage()),
              ),
              AppleGroupedTile(
                icon: ApIcon.codeIcon,
                title: 'Simple Example',
                onTap: () => _openPage(context, const SimpleHomePage()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
