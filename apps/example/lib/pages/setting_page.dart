import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/config/constants.dart';
import 'package:ap_common_example/widgets/share_data_widget.dart';
import 'package:ap_common_plugin/ap_common_plugin.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  static const String routerName = '/setting';

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? appVersion;
  bool busNotify = false;
  bool courseNotify = false;
  bool displayPicture = true;
  bool isOffline = false;

  bool autoSendEvent = false;

  @override
  void initState() {
    _getPreference();
    if (DateTime.now().millisecondsSinceEpoch % 5 == 0) {
      ApUtils.showAppReviewDialog(context, Constants.PLAY_STORE_URL);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold(
      scaffoldKey: _scaffoldKey,
      title: Text(context.ap.settings),
      body: SingleChildScrollView(
        padding: ApAppShell.contentPadding(
          context,
          spacing: const EdgeInsets.only(bottom: 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SettingTitle(
              text: context.ap.notificationItem,
              icon: Icons.notifications_outlined,
            ),
            const SettingCard(
              children: <Widget>[
                CheckCourseNotifyItem(),
                ClearAllNotifyItem(),
              ],
            ),
            SettingTitle(
              text: context.ap.otherSettings,
              icon: Icons.tune_outlined,
            ),
            SettingCard(
              children: <Widget>[
                SettingSwitch(
                  text: context.ap.headPhotoSetting,
                  subText: context.ap.headPhotoSettingSubTitle,
                  icon: Icons.person_outline,
                  value: displayPicture,
                  onChanged: (bool b) {
                    setState(() {
                      displayPicture = !displayPicture;
                    });
                    PreferenceUtil.instance.setBool(
                      Constants.PREF_DISPLAY_PICTURE,
                      displayPicture,
                    );
                  },
                ),
                ChangeLanguageItem(
                  onChange: (Locale locale) {
                    ShareDataWidget.of(context)!.data!.loadLocale(locale);
                  },
                ),
                ChangeThemeModeItem(
                  onChange: (ThemeMode themeMode) {
                    ShareDataWidget.of(context)!.data!.loadTheme(themeMode);
                  },
                ),
                ChangeIconStyleItem(
                  onChange: (String code) {
                    ShareDataWidget.of(context)!.data!.update();
                  },
                ),
                ChangeThemeColorItem(
                  onChanged: (Color color) {
                    final int index = ApTheme.themeColors.indexWhere(
                      (ThemeColor tc) =>
                          tc.color.toARGB32() == color.toARGB32(),
                    );
                    final int newIndex =
                        (index != -1) ? index : ApTheme.customColorIndex;
                    final Color? newCustomColor = (index != -1) ? null : color;
                    ShareDataWidget.of(context)!.data!.loadThemeColor(
                          newIndex,
                          newCustomColor,
                        );
                    ApTheme.of(context).saveSettings(
                      index: newIndex,
                      customColor: newCustomColor,
                    );
                  },
                ),
              ],
            ),
            SettingTitle(
              text: context.ap.otherInfo,
              icon: Icons.info_outline,
            ),
            SettingCard(
              children: <Widget>[
                SettingItem(
                  text: context.ap.feedback,
                  subText: context.ap.feedbackViaFacebook,
                  icon: Icons.feedback_outlined,
                  isExternalLink: true,
                  onTap: () {
                    ApUtils.launchFbFansPage(context, Constants.FANS_PAGE_ID);
                  },
                ),
                SettingInfoItem(
                  text: context.ap.appVersion,
                  icon: Icons.info_outline,
                  value: 'v$appVersion',
                ),
              ],
            ),
            const SettingTitle(text: 'Debug'),
            SettingCard(
              children: <Widget>[
                SettingItem(
                  text: '設定測試課表 Widget',
                  subText: '注入 30 分鐘後的假課程資料',
                  onTap: () async {
                    await ApCommonPlugin.setFakeCourseWidget();
                    if (!context.mounted) return;
                    UiUtil.instance.showToast(
                      context,
                      '已設定測試課表 Widget',
                    );
                  },
                ),
                SettingItem(
                  text: '清除課表 Widget',
                  subText: '移除 Widget 中的課程資料',
                  onTap: () async {
                    await ApCommonPlugin.clearCourseWidget();
                    if (!context.mounted) return;
                    UiUtil.instance.showToast(
                      context,
                      '已清除課表 Widget',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getPreference() async {
    // PackageInfo? packageInfo;
    // if (!kIsWeb &&
    //     (Platform.isAndroid || Platform.isIOS || Platform.isMacOS)) {
    //   packageInfo = await PackageInfo.fromPlatform();
    // }
    setState(() {
      isOffline = PreferenceUtil.instance
          .getBool(Constants.PREF_IS_OFFLINE_LOGIN, false);
      appVersion = '3.4.2';
      courseNotify =
          PreferenceUtil.instance.getBool(Constants.PREF_COURSE_NOTIFY, false);
      displayPicture =
          PreferenceUtil.instance.getBool(Constants.PREF_DISPLAY_PICTURE, true);
      busNotify =
          PreferenceUtil.instance.getBool(Constants.PREF_BUS_NOTIFY, false);
    });
  }
}
