import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

/// A row of compact info chips for the home dashboard.
///
/// Typically shows at-a-glance data like "next class in 32 min",
/// "4 classes today", etc.
///
/// ```dart
/// QuickInfoRow(
///   items: [
///     QuickInfoItem(
///       icon: Icons.timer_outlined,
///       label: '32 min',
///       subtitle: 'until next class',
///     ),
///     QuickInfoItem(
///       icon: Icons.menu_book_outlined,
///       label: '4',
///       subtitle: 'classes today',
///     ),
///   ],
/// )
/// ```
class QuickInfoRow extends StatelessWidget {
  const QuickInfoRow({
    super.key,
    required this.items,
  });

  final List<QuickInfoItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color cardColor =
        Theme.of(context).cardTheme.color ?? colorScheme.surfaceContainerLowest;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < items.length; i++) ...<Widget>[
            Expanded(child: _buildChip(colorScheme, cardColor, items[i])),
            if (i < items.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }

  Widget _buildChip(
    ColorScheme colorScheme,
    Color cardColor,
    QuickInfoItem item,
  ) {
    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: colorScheme.outlineVariant.withAlpha(77),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: (item.color ?? colorScheme.primary)
                      .withAlpha(26),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  item.icon,
                  size: 18,
                  color: item.color ?? colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data for a single [QuickInfoRow] chip.
class QuickInfoItem {
  const QuickInfoItem({
    required this.icon,
    required this.label,
    required this.subtitle,
    this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;
}

/// A card showing today's course schedule as a compact timeline.
///
/// ```dart
/// TodayScheduleCard(
///   courseData: courseData,
///   onTap: () => navigateToCourseTab(),
/// )
/// ```
class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({
    super.key,
    required this.courseData,
    this.onTap,
    this.maxItems = 4,
  });

  /// Course data to extract today's schedule from.
  final CourseData courseData;

  /// Called when the card is tapped (navigate to course page).
  final VoidCallback? onTap;

  /// Maximum number of items to show before "and N more".
  final int maxItems;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final CoursePaletteTheme palette = CoursePaletteTheme.of(context);
    final int todayWeekday = DateTime.now().weekday;
    final int tomorrowWeekday = todayWeekday == 7 ? 1 : todayWeekday + 1;
    List<_TodayItem> items = _getItemsForWeekday(todayWeekday);
    final bool isTomorrow = items.isEmpty;
    if (isTomorrow) {
      items = _getItemsForWeekday(tomorrowWeekday);
    }

    if (items.isEmpty) return const SizedBox.shrink();

    final String title = isTomorrow
        ? context.ap.tomorrowScheduleTitle
        : context.ap.todayScheduleTitle;

    final Color cardColor =
        Theme.of(context).cardTheme.color ?? colorScheme.surfaceContainerLowest;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Semantics(
        button: onTap != null,
        child: Material(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorScheme.outlineVariant.withAlpha(77),
                ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.today_rounded,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              for (int i = 0;
                  i < items.length && i < maxItems;
                  i++) ...<Widget>[
                _buildRow(colorScheme, palette, items[i]),
                if (i < items.length - 1 && i < maxItems - 1)
                  const SizedBox(height: 8),
              ],
              if (items.length > maxItems)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    // ignore: lines_longer_than_80_chars
                    '+${items.length - maxItems} ${context.ap.course}',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  ),
);
  }

  Widget _buildRow(
    ColorScheme colorScheme,
    CoursePaletteTheme palette,
    _TodayItem item,
  ) {
    final Color barColor = palette.colorAt(item.colorIndex);
    final DateTime now = DateTime.now();
    final bool isPast = item.endMinutes < now.hour * 60 + now.minute;

    return Row(
      children: <Widget>[
        // Time
        SizedBox(
          width: 44,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                item.startTime,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isPast
                      ? colorScheme.onSurfaceVariant
                      : colorScheme.onSurface,
                ),
              ),
              Text(
                item.endTime,
                style: TextStyle(
                  fontSize: 10,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Color bar
        Container(
          width: 3,
          height: 28,
          decoration: BoxDecoration(
            color: isPast ? colorScheme.outlineVariant : barColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        // Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isPast
                      ? colorScheme.onSurfaceVariant
                      : colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (item.location.isNotEmpty)
                Text(
                  item.location,
                  style: TextStyle(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                ),
            ],
          ),
        ),
      ],
    );
  }

  List<_TodayItem> _getItemsForWeekday(int weekday) {
    final List<_TodayItem> items = <_TodayItem>[];
    int colorIndex = 0;
    final Map<String, int> colorMap = <String, int>{};

    for (final Course course in courseData.courses) {
      if (!colorMap.containsKey(course.code)) {
        colorMap[course.code] = colorIndex++;
      }
      for (final SectionTime st in course.times) {
        if (st.weekday != weekday) continue;
        if (st.index >= courseData.timeCodes.length) continue;
        final TimeCode tc = courseData.timeCodes[st.index];

        // Parse end time for "is past" check.
        final List<String> endParts = tc.endTime.contains(':')
            ? tc.endTime.split(':')
            : <String>[
                tc.endTime.substring(0, 2),
                tc.endTime.substring(2),
              ];
        final int endMinutes = (int.tryParse(endParts[0]) ?? 0) * 60 +
            (int.tryParse(endParts[1]) ?? 0);

        items.add(_TodayItem(
          title: course.title,
          code: course.code,
          startTime: tc.startTime,
          endTime: tc.endTime,
          timeIndex: st.index,
          location: course.location?.toString() ?? '',
          endMinutes: endMinutes,
          colorIndex: colorMap[course.code]!,
        ),);
      }
    }
    items.sort(
      (_TodayItem a, _TodayItem b) => a.startTime.compareTo(b.startTime),
    );
    // Merge consecutive slots of the same course.
    final List<_TodayItem> merged = <_TodayItem>[];
    for (final _TodayItem item in items) {
      if (merged.isNotEmpty &&
          merged.last.code == item.code &&
          item.timeIndex == merged.last.timeIndex + 1) {
        final _TodayItem last = merged.last;
        merged[merged.length - 1] = _TodayItem(
          title: last.title,
          code: last.code,
          startTime: last.startTime,
          endTime: item.endTime,
          timeIndex: item.timeIndex,
          location: last.location,
          endMinutes: item.endMinutes,
          colorIndex: last.colorIndex,
        );
      } else {
        merged.add(item);
      }
    }
    return merged;
  }
}

/// A placeholder card shown when today's schedule is unavailable.
///
/// Displays a message and navigates on tap.
///
/// ```dart
/// EmptyScheduleCard(
///   message: 'Please login to view schedule',
///   onTap: () => navigateToLogin(),
/// )
/// ```
class EmptyScheduleCard extends StatelessWidget {
  const EmptyScheduleCard({
    super.key,
    required this.message,
    this.onTap,
    this.icon = Icons.today_rounded,
  });

  /// The message to display.
  final String message;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Leading icon. Defaults to [Icons.today_rounded].
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 32,
                  color: colorScheme.outline,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: colorScheme.outline,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: colorScheme.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TodayItem {
  const _TodayItem({
    required this.title,
    required this.code,
    required this.startTime,
    required this.endTime,
    required this.timeIndex,
    required this.location,
    required this.endMinutes,
    required this.colorIndex,
  });

  final String title;
  final String code;
  final String startTime;
  final String endTime;
  final int timeIndex;
  final String location;
  final int endMinutes;
  final int colorIndex;
}
