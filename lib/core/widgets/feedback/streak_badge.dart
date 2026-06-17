import 'package:calm_calibrate/core/animations/celebration_pop.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Streak counter pill — home header and compact surfaces.
class StreakBadge extends StatelessWidget {
  const StreakBadge({
    super.key,
    required this.days,
    this.compact = false,
  });

  final int days;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    if (days == 0) return const SizedBox.shrink();

    final label = compact ? '${days}d' : '$days day streak';

    return CelebrationPop(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 10 : 12,
          vertical: compact ? 6 : 7,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              c.primaryLight,
              c.primaryLight.withValues(alpha: 0.65),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: c.primary.withValues(alpha: 0.22)),
          boxShadow: [
            BoxShadow(
              color: c.primary.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department_rounded,
              size: compact ? 15 : 17,
              color: c.primary,
            ),
            SizedBox(width: compact ? 4 : 5),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: c.primary,
                fontSize: compact ? 12 : 13,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
