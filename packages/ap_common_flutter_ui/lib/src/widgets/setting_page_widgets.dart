import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

/// 設定頁面的 section 標題，可加入 icon。
/// 對齊 nkust_ap 的 SettingSectionTitle 風格。
class SettingTitle extends StatelessWidget {
  const SettingTitle({
    super.key,
    required this.text,
    this.icon,
  });

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(
              icon,
              size: 18,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

/// 卡片式設定容器，子項之間自動加入分隔線。
/// 對齊 nkust_ap 的 SettingCard 風格。
class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color cardColor =
        Theme.of(context).cardTheme.color ?? colorScheme.surfaceContainerLowest;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: _buildChildrenWithDividers(context, children),
        ),
      ),
    );
  }

  List<Widget> _buildChildrenWithDividers(
    BuildContext context,
    List<Widget> children,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final List<Widget> result = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(
          Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: colorScheme.outlineVariant.withAlpha(77),
          ),
        );
      }
    }
    return result;
  }
}

/// 設定頁面的 Switch 項目，支援 icon。
/// 對齊 nkust_ap 的 SettingSwitchTile 風格。
class SettingSwitch extends StatelessWidget {
  const SettingSwitch({
    super.key,
    required this.text,
    required this.subText,
    required this.value,
    required this.onChanged,
    this.icon,
  });

  final String text;
  final String subText;
  final bool value;
  final void Function(bool) onChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withAlpha(128),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subText,
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

/// 設定頁面的一般點擊項目，支援 icon、trailing 和外部連結標示。
/// 對齊 nkust_ap 的 SettingTile 風格。
class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.text,
    required this.subText,
    this.onTap,
    this.icon,
    this.trailing,
    this.isExternalLink = false,
  });

  final String text;
  final String subText;
  final Function()? onTap;
  final IconData? icon;
  final Widget? trailing;
  final bool isExternalLink;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withAlpha(128),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  if (subText.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 2),
                    Text(
                      subText,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null)
              trailing!
            else if (onTap != null)
              Icon(
                isExternalLink
                    ? Icons.open_in_new_rounded
                    : Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant.withAlpha(128),
                size: isExternalLink ? 20 : 24,
              ),
          ],
        ),
      ),
    );
  }
}

/// 設定頁面的靜態資訊項目（title + value，不可點擊或捲動）。
/// 對齊 nkust_ap 的 SettingInfoTile 風格。
class SettingInfoItem extends StatelessWidget {
  const SettingInfoItem({
    super.key,
    required this.text,
    required this.value,
    this.icon,
    this.onTap,
  });

  final String text;
  final String value;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SettingItem(
      text: text,
      subText: '',
      icon: icon,
      onTap: onTap,
      trailing: Text(
        value,
        style: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class CheckCourseNotifyItem extends StatelessWidget {
  const CheckCourseNotifyItem({super.key, this.tag});

  final String? tag;

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      text: context.ap.courseNotify,
      subText: context.ap.courseNotifySubTitle,
      icon: Icons.notifications_outlined,
      onTap: () {
        final CourseNotifyData notifyData = tag == null
            ? CourseNotifyData.loadCurrent()
            : CourseNotifyData.load(tag);
        if (NotificationUtil.instance.isSupport) {
          if (notifyData.data.isNotEmpty) {
            showDialog(
              context: context,
              builder: (_) => SimpleOptionDialog(
                title: context.ap.courseNotify,
                items: <String>[
                  for (final CourseNotify notify in notifyData.data)
                    '${context.ap.weekdaysCourse[notify.weekdayIndex]} ' +
                        '${notify.startTime} ${notify.title}',
                ],
                index: -1,
                onSelected: (int index) {
                  NotificationUtil.instance.cancelNotify(
                    id: notifyData.data[index].id,
                  );
                  notifyData.data.removeAt(index);
                  notifyData.save();
                  UiUtil.instance.showToast(
                    context,
                    context.ap.cancelNotifySuccess,
                  );
                },
              ),
            );
          } else {
            UiUtil.instance.showToast(context, context.ap.courseNotifyEmpty);
          }
        } else {
          UiUtil.instance.showToast(context, context.ap.platformError);
        }
      },
    );
  }
}

class ClearAllNotifyItem extends StatelessWidget {
  const ClearAllNotifyItem({super.key, this.tag});

  final String? tag;

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      text: context.ap.cancelAllNotify,
      subText: context.ap.cancelAllNotifySubTitle,
      icon: Icons.notifications_off_outlined,
      onTap: () {
        if (NotificationUtil.instance.isSupport) {
          NotificationUtil.instance.cancelAll();
          final CourseNotifyData notifyData = tag == null
              ? CourseNotifyData.loadCurrent()
              : CourseNotifyData.load(tag);
          notifyData.data.clear();
          notifyData.save();
          UiUtil.instance.showToast(context, context.ap.cancelNotifySuccess);
        } else {
          UiUtil.instance.showToast(context, context.ap.platformError);
        }
      },
    );
  }
}

class ChangeLanguageItem extends StatelessWidget {
  const ChangeLanguageItem({
    super.key,
    required this.onChange,
    this.textList,
  });

  final Function(Locale locale) onChange;
  final List<String>? textList;

  @override
  Widget build(BuildContext context) {
    final List<String> languageTextList = textList ??
        <String>[
          context.ap.systemLanguage,
          context.ap.traditionalChinese,
          context.ap.english,
          context.ap.japanese,
        ];
    final String code = PreferenceUtil.instance.getString(
      ApConstants.prefLanguageCode,
      ApSupportLanguageConstants.system,
    );
    final int languageIndex = ApSupportLanguageExtension.fromCode(code);
    return SettingItem(
      text: context.ap.language,
      subText: languageTextList[languageIndex],
      icon: Icons.language_outlined,
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => SimpleOptionDialog(
            title: context.ap.language,
            items: languageTextList,
            index: languageIndex,
            onSelected: (int index) {
              Locale locale;
              final String code = ApSupportLanguage.values[index].code;
              switch (index) {
                case 0:
                  final List<Locale> locales =
                      WidgetsBinding.instance.platformDispatcher.locales;
                  if (locales.isEmpty) {
                    locale = const Locale('en');
                  } else {
                    locale = locales.first;
                  }
                  locale = AppLocaleUtils.supportedLocalesRaw
                          .contains(locale.languageCode)
                      ? locale
                      : const Locale('en');
                default:
                  locale = Locale(
                    code,
                    code == ApSupportLanguageConstants.zh ? 'TW' : null,
                  );
              }
              onChange.call(locale);
              PreferenceUtil.instance
                  .setString(ApConstants.prefLanguageCode, code);
              AnalyticsUtil.instance.logEvent(
                'change_language',
                parameters: <String, String>{'code': code},
              );
              AnalyticsUtil.instance.setUserProperty(
                AnalyticsConstants.language,
                locale.toLanguageTag(),
              );
            },
          ),
        );
        AnalyticsUtil.instance.logEvent('language_setting_click');
      },
    );
  }
}

class ChangeThemeModeItem extends StatelessWidget {
  const ChangeThemeModeItem({
    super.key,
    required this.onChange,
    this.textList,
  });

  final Function(ThemeMode themeMode) onChange;
  final List<String>? textList;

  @override
  Widget build(BuildContext context) {
    final List<String> themeTextList = <String>[
      context.ap.systemTheme,
      context.ap.light,
      context.ap.dark,
    ];
    final int themeModeIndex = ApTheme.of(context).themeMode.index;
    return SettingItem(
      text: context.ap.theme,
      subText: themeTextList[themeModeIndex],
      icon: Icons.dark_mode_outlined,
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => SimpleOptionDialog(
            title: context.ap.theme,
            items: themeTextList,
            index: themeModeIndex,
            onSelected: (int index) {
              final ThemeMode mode = ThemeMode.values[index];
              onChange.call(mode);
              PreferenceUtil.instance
                  .setInt(ApConstants.prefThemeModeIndex, index);
              AnalyticsUtil.instance.logEvent(
                'change_theme',
                parameters: <String, String>{
                  'code': mode.toString(),
                },
              );
            },
          ),
        );
        AnalyticsUtil.instance.logEvent('theme_mode_setting_click');
      },
    );
  }
}

class ChangeIconStyleItem extends StatelessWidget {
  const ChangeIconStyleItem({
    super.key,
    required this.onChange,
  });

  final Function(String code) onChange;

  @override
  Widget build(BuildContext context) {
    final int iconStyleIndex = ApIcon.index;
    return SettingItem(
      text: context.ap.iconStyle,
      subText: context.ap.iconText,
      icon: Icons.style_outlined,
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => SimpleOptionDialog(
            title: context.ap.theme,
            items: <String>[
              context.ap.outlined,
              context.ap.filled,
            ],
            index: iconStyleIndex,
            onSelected: (int index) {
              final String code = ApIcon.values[index];
              ApIcon.code = code;
              PreferenceUtil.instance
                  .setString(ApConstants.prefIconStyleCode, code);
              onChange.call(code);
              AnalyticsUtil.instance.logEvent(
                'change_icon_style',
                parameters: <String, String>{'code': code},
              );
            },
          ),
        );
        AnalyticsUtil.instance.logEvent('icon_style_setting_click');
      },
    );
  }
}

class ChangeThemeColorItem extends StatelessWidget {
  const ChangeThemeColorItem({
    super.key,
    required this.onChanged,
  });

  final Function(Color color) onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ApTheme apTheme = ApTheme.of(context);
    return SettingItem(
      text: context.ap.themeColor,
      subText: apTheme.getLocalizedCurrentColorName(context),
      icon: Icons.palette_outlined,
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: apTheme.seedColor,
          shape: BoxShape.circle,
          border: Border.all(color: colorScheme.outline),
        ),
      ),
      onTap: () async {
        final Color? result = await showDialog<Color>(
          context: context,
          builder: (BuildContext context) =>
              ColorPickerDialog(initialColor: apTheme.seedColor),
        );
        if (result != null) {
          onChanged(result);
        }
      },
    );
  }
}

class ColorPickerDialog extends StatefulWidget {
  const ColorPickerDialog({
    super.key,
    required this.initialColor,
  });

  final Color initialColor;

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late HSVColor _hsvColor;

  @override
  void initState() {
    super.initState();
    _hsvColor = HSVColor.fromColor(widget.initialColor);
  }

  @override
  Widget build(BuildContext context) {
    final Color currentColor = _hsvColor.toColor();
    final String hexCode = currentColor
        .toARGB32()
        .toRadixString(16)
        .substring(2)
        .toUpperCase();

    return AlertDialog(
      title: Text(context.ap.pickThemeColor),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: currentColor.withAlpha(128),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '#$hexCode',
                  style: TextStyle(
                    color: _hsvColor.value > 0.5 && _hsvColor.saturation < 0.5
                        ? const Color(0xDD000000)
                        : const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ColorSlider(
              label: context.ap.hue,
              gradientColors: const <Color>[
                Color(0xFFFF0000),
                Color(0xFFFFFF00),
                Color(0xFF00FF00),
                Color(0xFF00FFFF),
                Color(0xFF0000FF),
                Color(0xFFFF00FF),
                Color(0xFFFF0000),
              ],
              value: _hsvColor.hue,
              max: 360,
              onChanged: (double value) {
                setState(() => _hsvColor = _hsvColor.withHue(value));
              },
            ),
            const SizedBox(height: 16),
            ColorSlider(
              label: context.ap.saturation,
              gradientColors: <Color>[
                const Color(0xFFFFFFFF),
                HSVColor.fromAHSV(1, _hsvColor.hue, 1, 1).toColor(),
              ],
              value: _hsvColor.saturation,
              onChanged: (double value) {
                setState(() => _hsvColor = _hsvColor.withSaturation(value));
              },
            ),
            const SizedBox(height: 16),
            ColorSlider(
              label: context.ap.value,
              gradientColors: <Color>[
                const Color(0xFF000000),
                HSVColor.fromAHSV(1, _hsvColor.hue, _hsvColor.saturation, 1)
                    .toColor(),
              ],
              value: _hsvColor.value,
              onChanged: (double value) {
                setState(() => _hsvColor = _hsvColor.withValue(value));
              },
            ),
            const SizedBox(height: 24),
            PresetColorGrid(
              onColorSelected: (Color color) {
                setState(() => _hsvColor = HSVColor.fromColor(color));
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.ap.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, currentColor),
          child: Text(context.ap.determine),
        ),
      ],
    );
  }

}
