import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A single option for [OptionPickerBottomSheet].
///
/// ```dart
/// PickerOption(
///   label: '繁體中文',
///   subtitle: 'Traditional Chinese',
///   icon: Icons.translate_rounded,
/// )
/// ```
class PickerOption {
  const PickerOption({
    this.value,
    required this.label,
    this.subtitle,
    this.icon,
    this.iconBackgroundColor,
  });

  /// Value returned when this option is selected.
  /// In flat lists, defaults to the positional index.
  final int? value;

  /// Primary display text.
  final String label;

  /// Optional secondary text below the label.
  final String? subtitle;

  /// Optional leading icon.
  final IconData? icon;

  /// Background color for the icon circle.
  /// Defaults to [ColorScheme.primaryContainer].
  final Color? iconBackgroundColor;
}

/// A named group of [PickerOption]s displayed under a
/// header chip.
///
/// When [title] is `null`, no header is rendered — useful
/// for flat lists wrapped in a single group.
class PickerOptionGroup {
  const PickerOptionGroup({
    this.title,
    required this.options,
  });

  /// Group header text. `null` hides the header.
  final String? title;

  /// Options within this group.
  final List<PickerOption> options;
}

/// A Material 3 bottom-sheet option picker.
///
/// Supports **flat lists** and **grouped lists** with
/// section headers.
///
/// Embed as a widget for an inline pill button, or call
/// the static [show] / [showGrouped] methods to open
/// the sheet programmatically.
///
/// ```dart
/// // Flat list
/// final int? i = await OptionPickerBottomSheet.show(
///   context: context,
///   title: 'Language',
///   options: [
///     PickerOption(label: '繁體中文'),
///     PickerOption(label: 'English'),
///   ],
/// );
///
/// // Grouped list
/// final int? v =
///     await OptionPickerBottomSheet.showGrouped(
///   context: context,
///   title: 'Pick',
///   groups: [
///     PickerOptionGroup(
///       title: 'Group A',
///       options: [
///         PickerOption(value: 10, label: 'Item'),
///       ],
///     ),
///   ],
/// );
/// ```
class OptionPickerBottomSheet extends StatelessWidget {
  const OptionPickerBottomSheet({
    super.key,
    required this.groups,
    required this.title,
    this.titleIcon,
    this.buttonIcon,
    this.onSelect,
    this.selectedValue = 0,
    this.defaultValue,
    this.defaultLabel,
    this.featureTag,
  });

  /// Convenience constructor for a flat list.
  OptionPickerBottomSheet.fromOptions({
    super.key,
    required List<PickerOption> options,
    required this.title,
    this.titleIcon,
    this.buttonIcon,
    this.onSelect,
    this.selectedValue = 0,
    this.defaultValue,
    this.defaultLabel,
    this.featureTag,
  }) : groups = <PickerOptionGroup>[
          PickerOptionGroup(options: options),
        ];

  /// Option groups to display.
  final List<PickerOptionGroup> groups;

  /// Bottom-sheet header title.
  final String title;

  /// Icon next to the title in the sheet header.
  final IconData? titleIcon;

  /// Icon shown in the inline pill button.
  final IconData? buttonIcon;

  /// Called with the selected value.
  final void Function(int value)? onSelect;

  /// The value of the currently selected option.
  final int selectedValue;

  /// The value of the "default" option to badge.
  final int? defaultValue;

  /// Badge text for [defaultValue].
  final String? defaultLabel;

  /// Analytics feature tag.
  final String? featureTag;

  /// Opens a **flat-list** option picker.
  ///
  /// Returns the selected value, or `null` if dismissed.
  /// When [PickerOption.value] is not set, the positional
  /// index is used.
  static Future<int?> show({
    required BuildContext context,
    required List<PickerOption> options,
    required String title,
    IconData? titleIcon,
    int selectedValue = 0,
    int? defaultValue,
    String? defaultLabel,
  }) {
    return showGrouped(
      context: context,
      groups: <PickerOptionGroup>[
        PickerOptionGroup(options: options),
      ],
      title: title,
      titleIcon: titleIcon,
      selectedValue: selectedValue,
      defaultValue: defaultValue,
      defaultLabel: defaultLabel,
    );
  }

  /// Opens a **grouped** option picker.
  ///
  /// Returns the selected value, or `null` if dismissed.
  static Future<int?> showGrouped({
    required BuildContext context,
    required List<PickerOptionGroup> groups,
    required String title,
    IconData? titleIcon,
    int selectedValue = 0,
    int? defaultValue,
    String? defaultLabel,
  }) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // Precompute flat-index offset per group so that
    // options without an explicit value get a stable
    // positional index.
    final List<int> offsets = <int>[];
    int total = 0;
    for (final PickerOptionGroup g in groups) {
      offsets.add(total);
      total += g.options.length;
    }

    return showModalBottomSheet<int>(
      context: context,
      useRootNavigator: true,
      backgroundColor: const Color(0x00000000),
      isScrollControlled: true,
      builder: (BuildContext sheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: _sheetSize(total),
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (
            BuildContext ctx,
            ScrollController scrollCtrl,
          ) {
            return Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: <Widget>[
                  _buildHandle(colorScheme),
                  _buildTitle(
                    title,
                    titleIcon,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.outlineVariant.withAlpha(128),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollCtrl,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: groups.length,
                      itemBuilder: (
                        BuildContext c,
                        int gi,
                      ) {
                        return _buildGroup(
                          context: c,
                          group: groups[gi],
                          flatOffset: offsets[gi],
                          colorScheme: colorScheme,
                          selectedValue: selectedValue,
                          defaultValue: defaultValue,
                          defaultLabel: defaultLabel,
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
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final String label = _selectedLabel(groups, selectedValue);

    return Material(
      color: cs.primaryContainer,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () async {
          if (featureTag != null) {
            AnalyticsUtil.instance.logEvent(
              '${featureTag}_item_picker_click',
            );
          }
          final int? v = await showGrouped(
            context: context,
            groups: groups,
            title: title,
            titleIcon: titleIcon,
            selectedValue: selectedValue,
            defaultValue: defaultValue,
            defaultLabel: defaultLabel,
          );
          if (v != null) {
            onSelect?.call(v);
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (buttonIcon != null) ...<Widget>[
                Icon(
                  buttonIcon,
                  size: 16,
                  color: cs.onPrimaryContainer,
                ),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: TextStyle(
                  color: cs.onPrimaryContainer,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 20,
                color: cs.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────

  static String _selectedLabel(
    List<PickerOptionGroup> groups,
    int selectedValue,
  ) {
    int flat = 0;
    for (final PickerOptionGroup g in groups) {
      for (final PickerOption o in g.options) {
        if ((o.value ?? flat) == selectedValue) {
          return o.label;
        }
        flat++;
      }
    }
    return groups.isNotEmpty && groups.first.options.isNotEmpty
        ? groups.first.options.first.label
        : '';
  }

  static double _sheetSize(int count) {
    if (count <= 3) return 0.35;
    if (count <= 6) return 0.5;
    return 0.6;
  }

  static Widget _buildHandle(
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  static Widget _buildTitle(
    String title,
    IconData? icon,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, color: colorScheme.primary),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildGroup({
    required BuildContext context,
    required PickerOptionGroup group,
    required int flatOffset,
    required ColorScheme colorScheme,
    required int selectedValue,
    int? defaultValue,
    String? defaultLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (group.title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              8,
              16,
              8,
              8,
            ),
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
                    group.title!,
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
        for (int i = 0; i < group.options.length; i++)
          _buildItem(
            context: context,
            option: group.options[i],
            effectiveValue: group.options[i].value ?? (flatOffset + i),
            colorScheme: colorScheme,
            selectedValue: selectedValue,
            defaultValue: defaultValue,
            defaultLabel: defaultLabel,
          ),
      ],
    );
  }

  static Widget _buildItem({
    required BuildContext context,
    required PickerOption option,
    required int effectiveValue,
    required ColorScheme colorScheme,
    required int selectedValue,
    int? defaultValue,
    String? defaultLabel,
  }) {
    final bool isSelected = effectiveValue == selectedValue;
    final bool isDefault = effectiveValue == defaultValue;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primaryContainer
            : colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.outlineVariant.withAlpha(77),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          Navigator.of(context).pop(effectiveValue);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: Row(
            children: <Widget>[
              if (option.icon != null) ...<Widget>[
                _buildIcon(
                  option: option,
                  colorScheme: colorScheme,
                  isSelected: isSelected,
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: _buildLabel(
                  option: option,
                  colorScheme: colorScheme,
                  isSelected: isSelected,
                  isDefault: isDefault,
                  defaultLabel: defaultLabel,
                ),
              ),
              Icon(
                isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildIcon({
    required PickerOption option,
    required ColorScheme colorScheme,
    required bool isSelected,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primary
            : (option.iconBackgroundColor ?? colorScheme.primaryContainer),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          option.icon,
          size: 22,
          color: isSelected
              ? colorScheme.onPrimary
              : colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  static Widget _buildLabel({
    required PickerOption option,
    required ColorScheme colorScheme,
    required bool isSelected,
    required bool isDefault,
    String? defaultLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Text(
                option.label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? colorScheme.primary : colorScheme.onSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isDefault && defaultLabel != null) ...<Widget>[
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
                  defaultLabel,
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
        if (option.subtitle != null) ...<Widget>[
          const SizedBox(height: 2),
          Text(
            option.subtitle!,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
