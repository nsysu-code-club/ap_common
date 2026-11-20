import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:flutter/material.dart';

/// Displays the pending review count provided by the host app.
class PendingAnnouncementBadge extends StatelessWidget {
  const PendingAnnouncementBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool highContrast = MediaQuery.highContrastOf(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: highContrast ? colors.onSurface : colors.primaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Text(
          ap.pendingAnnouncementCount(count: count),
          style: TextStyle(
            color: highContrast ? colors.surface : colors.onPrimaryContainer,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
