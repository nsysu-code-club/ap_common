import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:ap_common_flutter_ui/src/resources/ap_colors.dart';
import 'package:ap_common_flutter_ui/src/resources/resources.dart';
import 'package:ap_common_flutter_ui/src/theme/course_palette_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

export 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

class ThemeColor {
  const ThemeColor({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}

class ApTheme extends InheritedWidget {
  const ApTheme({
    super.key,
    required super.child,
    required this.themeMode,
    this.currentColorIndex = 0,
    this.customColor,
    required this.preferences,
  });

  final ThemeMode themeMode;
  final int currentColorIndex;
  final Color? customColor;
  final PreferenceUtil preferences;

  static ApTheme of(BuildContext context) {
    final ApTheme? result =
        context.dependOnInheritedWidgetOfExactType<ApTheme>();
    assert(result != null, 'No ApTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ApTheme oldWidget) {
    return themeMode != oldWidget.themeMode ||
        currentColorIndex != oldWidget.currentColorIndex ||
        customColor != oldWidget.customColor;
  }

  // ignore: constant_identifier_names
  static const String DARK = 'dark';

  // ignore: constant_identifier_names
  static const String LIGHT = 'light';

  // ignore: constant_identifier_names
  static const String SYSTEM = 'system';

  static String code = ApTheme.LIGHT;

  static const List<ThemeColor> themeColors = <ThemeColor>[
    ThemeColor(name: '高科藍', color: Color(0xFF0066CC)),
    ThemeColor(name: '海洋藍', color: Color(0xFF0077B6)),
    ThemeColor(name: '翠綠', color: Color(0xFF2E7D32)),
    ThemeColor(name: '珊瑚橙', color: Color(0xFFE64A19)),
    ThemeColor(name: '典雅紫', color: Color(0xFF7B1FA2)),
    ThemeColor(name: '玫瑰紅', color: Color(0xFFC2185B)),
    ThemeColor(name: '青色', color: Color(0xFF00838F)),
    ThemeColor(name: '琥珀', color: Color(0xFFFF8F00)),
    ThemeColor(name: '靛藍', color: Color(0xFF303F9F)),
    ThemeColor(name: '棕褐', color: Color(0xFF5D4037)),
  ];

  /// iOS System Colors (light variant) packaged as seed colors so apps
  /// can opt into an iOS-flavoured tonal palette via
  /// `ColorScheme.fromSeed`. Same length as [themeColors], so it is a
  /// drop-in replacement wherever [currentColorIndex] is used — pass
  /// the chosen entry's color into [ApTheme.light] / [ApTheme.dark] or
  /// store it under [PREF_CUSTOM_COLOR].
  ///
  /// The values are stable from iOS 13 through iOS 26.
  static const List<ThemeColor> iOSThemeColors = <ThemeColor>[
    ThemeColor(name: 'iOS 藍', color: Color(0xFF007AFF)),
    ThemeColor(name: 'iOS 靛', color: Color(0xFF5856D6)),
    ThemeColor(name: 'iOS 綠', color: Color(0xFF34C759)),
    ThemeColor(name: 'iOS 橙', color: Color(0xFFFF9500)),
    ThemeColor(name: 'iOS 紫', color: Color(0xFFAF52DE)),
    ThemeColor(name: 'iOS 粉紅', color: Color(0xFFFF2D55)),
    ThemeColor(name: 'iOS 青', color: Color(0xFF30B0C7)),
    ThemeColor(name: 'iOS 黃', color: Color(0xFFFFCC00)),
    ThemeColor(name: 'iOS 紅', color: Color(0xFFFF3B30)),
    ThemeColor(name: 'iOS 棕', color: Color(0xFFA2845E)),
  ];

  static const int customColorIndex = -1;

  // ignore: constant_identifier_names
  static const String PREF_COLOR_INDEX = 'ap_common.theme_color_index';
  // ignore: constant_identifier_names
  static const String PREF_CUSTOM_COLOR = 'ap_common.custom_theme_color';

  void saveSettings({
    required int index,
    Color? customColor,
  }) {
    preferences.setInt(PREF_COLOR_INDEX, index);
    if (customColor != null) {
      preferences.setInt(PREF_CUSTOM_COLOR, customColor.toARGB32());
    }
  }

  String getLocalizedCurrentColorName(BuildContext context) {
    if (currentColorIndex == customColorIndex && customColor != null) {
      return context.ap.customColor;
    }
    if (currentColorIndex >= 0 && currentColorIndex < themeColors.length) {
      return getLocalizedThemeColorName(context, currentColorIndex);
    }
    return getLocalizedThemeColorName(context, 0);
  }

  static String getLocalizedThemeColorName(BuildContext context, int index) {
    switch (index) {
      case 0:
        return context.ap.nkustBlue;
      case 1:
        return context.ap.oceanBlue;
      case 2:
        return context.ap.emeraldGreen;
      case 3:
        return context.ap.coralOrange;
      case 4:
        return context.ap.elegantPurple;
      case 5:
        return context.ap.roseRed;
      case 6:
        return context.ap.cyan;
      case 7:
        return context.ap.amber;
      case 8:
        return context.ap.indigo;
      case 9:
        return context.ap.brown;
      default:
        return context.ap.nkustBlue;
    }
  }

  Color get seedColor {
    return getSeedColor(
      index: currentColorIndex,
      customColor: customColor,
    );
  }

  Color getSeedColor({
    required int index,
    Color? customColor,
  }) {
    if (index == customColorIndex && customColor != null) {
      return customColor;
    }
    if (index >= 0 && index < themeColors.length) {
      return themeColors[index].color;
    }
    return themeColors[0].color;
  }

  Brightness get brightness {
    switch (themeMode) {
      case ThemeMode.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
    }
  }

  Color get blue {
    switch (brightness) {
      case Brightness.light:
        return ApColors.blue500;
      case Brightness.dark:
        return ApColors.blueDark;
    }
  }

  Color get blueText {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.grey100;
      case Brightness.light:
        return ApColors.blue500;
    }
  }

  Color get blueAccent {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.blue300;
      case Brightness.light:
        return ApColors.blue500;
    }
  }

  Color get semesterText {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0xffffffff);
      case Brightness.light:
        return ApColors.blue500;
    }
  }

  Color get grey {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.grey200;
      case Brightness.light:
        return ApColors.grey500;
    }
  }

  Color get greyText {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.grey200;
      case Brightness.light:
        return ApColors.grey500;
    }
  }

  Color get disabled {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0xFF424242);
      case Brightness.light:
        return const Color(0xFFBDBDBD);
    }
  }

  Color get calendarTileSelect {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0xff000000);
      case Brightness.light:
        return const Color(0xffffffff);
    }
  }

  Color get yellow {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.yellow200;
      case Brightness.light:
        return ApColors.yellow500;
    }
  }

  Color get red {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.red200;
      case Brightness.light:
        return ApColors.red500;
    }
  }

  Color get green {
    switch (brightness) {
      case Brightness.light:
        return const Color(0xFF4CAF50);
      case Brightness.dark:
        return const Color(0xFF81C784);
    }
  }

  Color get bottomNavigationSelect {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.grey100;
      case Brightness.light:
        return const Color(0xff737373);
    }
  }

  Color get segmentControlUnSelect {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.onyx;
      case Brightness.light:
        return const Color(0xffffffff);
    }
  }

  Color snackBarActionTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  Color get toastBackground {
    switch (brightness) {
      case Brightness.light:
        return const Color(0xAA000000);
      case Brightness.dark:
        return const Color(0xAAFFFFFF);
    }
  }

  Color get toastText {
    switch (brightness) {
      case Brightness.light:
        return const Color(0xFFFFFFFF);
      case Brightness.dark:
        return const Color(0xFF000000);
    }
  }

  double get drawerIconOpacity {
    switch (brightness) {
      case Brightness.dark:
        return 0.75;
      case Brightness.light:
        return 1.0;
    }
  }

  String get dashLine {
    switch (brightness) {
      case Brightness.light:
        return ApImageAssets.dashLineLight;
      case Brightness.dark:
        return ApImageAssets.dashLineDark;
    }
  }

  String get drawerBackground {
    switch (brightness) {
      case Brightness.light:
        return ApImageAssets.drawerBackgroundLight;
      case Brightness.dark:
        return ApImageAssets.drawerBackgroundDark;
    }
  }

  Color get courseBorder {
    switch (brightness) {
      case Brightness.dark:
        return ApColors.charade;
      case Brightness.light:
        return ApColors.solitude;
    }
  }

  Color get courseText {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0xDD000000);
      case Brightness.light:
        return const Color(0xFFFFFFFF);
    }
  }

  Color get courseListTabletBackground {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0x1F000000);
      case Brightness.light:
        return const Color(0xFFFFFFFF);
    }
  }

  Color get barCode {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0xFFFFFFFF);
      case Brightness.light:
        return const Color(0xFF000000);
    }
  }

  Color get background {
    switch (brightness) {
      case Brightness.dark:
        return const Color(0xFF121212);
      case Brightness.light:
        return const Color(0xFFFFFFFF);
    }
  }

  static ThemeData light(
    Color seedColor, {
    CoursePaletteTheme coursePalette = CoursePaletteTheme.material,
  }) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
    );
    return _buildTheme(colorScheme, coursePalette);
  }

  static ThemeData dark(
    Color seedColor, {
    CoursePaletteTheme coursePalette = CoursePaletteTheme.material,
  }) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );
    return _buildTheme(colorScheme, coursePalette);
  }

  static ThemeData _buildTheme(
    ColorScheme colorScheme,
    CoursePaletteTheme coursePalette,
  ) {
    final bool isLight = colorScheme.brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      pageTransitionsTheme: _pageTransitionsTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      extensions: <ThemeExtension<dynamic>>[coursePalette],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: isLight ? colorScheme.primary : colorScheme.surface,
        foregroundColor:
            isLight ? colorScheme.onPrimary : colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: isLight ? colorScheme.onPrimary : colorScheme.onSurface,
          letterSpacing: 0.5,
        ),
        iconTheme: IconThemeData(
          color: isLight ? colorScheme.onPrimary : colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        color: colorScheme.surfaceContainerLowest,
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.onSurface.withAlpha(31),
          disabledForegroundColor: colorScheme.onSurface.withAlpha(97),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        surfaceTintColor: colorScheme.surfaceTint,
        iconTheme: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colorScheme.onSecondaryContainer);
          }
          return IconThemeData(color: colorScheme.onSurfaceVariant);
        }),
        labelTextStyle:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurfaceVariant,
          );
        }),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 1,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        visualDensity: VisualDensity.compact,
        iconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        iconColor: colorScheme.onSurfaceVariant,
        collapsedIconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
        collapsedTextColor: colorScheme.onSurface,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(
          color: colorScheme.onInverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        actionTextColor: colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        elevation: 3,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        contentTextStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      chipTheme: ChipThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surfaceContainerLow,
        selectedColor: colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
        side: BorderSide(color: colorScheme.outline, width: 0.5),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.surfaceContainerHighest;
        }),
        checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(color: colorScheme.outline, width: 2),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.onPrimary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.surfaceContainerHighest;
        }),
        trackOutlineColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
        circularTrackColor: colorScheme.surfaceContainerHighest,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: isLight ? colorScheme.onPrimary : colorScheme.primary,
        unselectedLabelColor: isLight
            ? colorScheme.onPrimary.withAlpha(179)
            : colorScheme.onSurfaceVariant,
        indicatorColor: isLight ? colorScheme.onPrimary : colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: const Color(0x00000000),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainerLow,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surfaceContainerLow,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          color: colorScheme.onInverseSurface,
          fontSize: 12,
        ),
      ),
    );
  }
}

const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
    TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
  },
);
