import 'dart:developer';

import 'package:ap_common/ap_common.dart'
    hide AppLocale, AppLocaleUtils, LocaleSettings, TranslationProvider;
import 'package:ap_common_example/app_navigation.dart';
import 'package:ap_common_example/config/constants.dart';
import 'package:ap_common_example/pages/announcement_page.dart';
import 'package:ap_common_example/utils/app_localizations.dart';
import 'package:ap_common_example/widgets/share_data_widget.dart';
import 'package:ap_common_flutter_core/ap_common_flutter_core.dart' as ap_l10n;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ThemeData? themeData;
  Uint8List? pictureBytes;
  bool offlineLogin = false;
  bool hasBusViolationRecords = false;

  ThemeMode themeMode = ThemeMode.system;
  int currentColorIndex = 0;
  Color? customColor;

  void logout() {
    setState(() {
      offlineLogin = false;
      pictureBytes = null;
    });
  }

  @override
  void initState() {
    themeMode = ThemeMode.values[
        PreferenceUtil.instance.getInt(Constants.PREF_THEME_MODE_INDEX, 0)];
    currentColorIndex =
        PreferenceUtil.instance.getInt(ApTheme.PREF_COLOR_INDEX, 0);
    final int customColorValue =
        PreferenceUtil.instance.getInt(ApTheme.PREF_CUSTOM_COLOR, 0);
    if (currentColorIndex == ApTheme.customColorIndex &&
        customColorValue != 0) {
      customColor = Color(customColorValue);
    }
    WidgetsBinding.instance.addObserver(this);
    _initLocale();
    Future<void>.microtask(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarContrastEnforced: true,
          systemNavigationBarColor: Colors.transparent,
        ),
      );
    });
    super.initState();
  }

  Future<void> _initLocale() async {
    final String languageCode = PreferenceUtil.instance.getString(
      Constants.PREF_LANGUAGE_CODE,
      ApSupportLanguageConstants.system,
    );
    if (languageCode == ApSupportLanguageConstants.system) {
      await useApDeviceLocale();
      await LocaleSettings.useDeviceLocale();
    } else {
      final Locale locale = Locale(
        languageCode,
        languageCode == ApSupportLanguageConstants.zh ? 'TW' : null,
      );
      await setApLocaleFromFlutter(locale);
      final AppLocale appLocale = AppLocaleUtils.instance.parseLocaleParts(
        languageCode: locale.languageCode,
        scriptCode: locale.scriptCode,
        countryCode: locale.countryCode,
      );
      await LocaleSettings.setLocale(appLocale);
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {});
    super.didChangePlatformBrightness();
  }

  ThemeData _platformTheme(ThemeData base) =>
      base.platform == TargetPlatform.iOS ||
              base.platform == TargetPlatform.macOS
          ? AppleLiquidTheme.harmonize(base)
          : base;

  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      data: this,
      child: ApTheme(
        themeMode: themeMode,
        currentColorIndex: currentColorIndex,
        customColor: customColor,
        preferences: PreferenceUtil.instance,
        child: Builder(
          builder: (BuildContext context) {
            final Color seedColor = ApTheme.of(context).seedColor;
            return ap_l10n.TranslationProvider(
              child: TranslationProvider(
                child: Builder(
                  builder: (BuildContext context) {
                    return MaterialApp(
                      onGenerateTitle: (BuildContext context) =>
                          context.app.appName,
                      debugShowCheckedModeBanner: false,
                      routes: <String, WidgetBuilder>{
                        Navigator.defaultRouteName: (BuildContext context) =>
                            const AppNavigation(),
                        AboutUsPage.routerName: (BuildContext context) =>
                            AppNavigation.aboutPage(context),
                        AnnouncementHomePage.routerName:
                            (BuildContext context) =>
                                const AnnouncementPage(),
                      },
                      theme: _platformTheme(ApTheme.light(seedColor)),
                      darkTheme: _platformTheme(ApTheme.dark(seedColor)),
                      themeMode: themeMode,
                      locale: TranslationProvider.of(context).flutterLocale,
                      supportedLocales: AppLocaleUtils.supportedLocales,
                      localizationsDelegates: const <LocalizationsDelegate<
                          dynamic>>[
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void update() {
    setState(() {});
  }

  void loadTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  void loadThemeColor(int index, Color? custom) {
    setState(() {
      currentColorIndex = index;
      customColor = custom;
    });
  }

  void loadLocale(Locale locale) {
    log('loadLocale $locale');
    // Sync ap_common library locale
    setApLocaleFromFlutter(locale);
    // Sync example app locale
    final AppLocale appLocale = AppLocaleUtils.instance.parseLocaleParts(
      languageCode: locale.languageCode,
      scriptCode: locale.scriptCode,
      countryCode: locale.countryCode,
    );
    LocaleSettings.setLocale(appLocale);
  }
}
