import 'package:calm_calibrate/core/animations/celebration_pop.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Streak counter with subtle pop on build.
class StreakBadge extends StatelessWidget {
  StreakBadge({
    super.key,
    required this.days,
    this.compact = false,
  });

  final int days;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    if (days == 0) return SizedBox.shrink();

    final label = compact ? '${days}d' : '$days day streak';

    return CelebrationPop(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 10 : 14,
          vertical: compact ? 6 : 8,
        ),
        decoration: BoxDecoration(
          color: c.primaryLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('🔥', style: TextStyle(fontSize: compact ? 14 : 16)),
            SizedBox(width: compact ? 4 : 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: c.primary,
                fontSize: compact ? 12 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
