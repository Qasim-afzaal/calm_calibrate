import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Today's journey goal with streak progress — home screen hero card.
class JourneyDayCard extends StatelessWidget {
  const JourneyDayCard({
    super.key,
    required this.day,
    required this.goal,
    required this.action,
    this.streakDays = 0,
    this.onTap,
  });

  final int day;
  final String goal;
  final String action;
  final int streakDays;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final l10n = context.l10n;
    final progressDots = day.clamp(1, 7);

    return ScaleTap(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              c.surface,
              c.primaryLight.withValues(alpha: 0.35),
            ],
          ),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: c.primary.withValues(alpha: 0.28)),
          boxShadow: [
            BoxShadow(
              color: c.primary.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DayBadge(day: day),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.journeyCardTodaysGoal,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: c.textMuted,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        goal,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: c.textPrimary,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: c.textMuted),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              action,
              style: TextStyle(fontSize: 13, color: c.textSecondary, height: 1.35),
            ),
            if (streakDays > 0) ...[
              const SizedBox(height: 14),
              Row(
                children: [
                  Row(
                    children: List.generate(progressDots, (index) {
                      final filled = index < streakDays;
                      final isActive = filled && index == streakDays - 1;
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: isActive ? 10 : 8,
                          height: isActive ? 10 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: filled
                                ? (isActive
                                    ? c.primary
                                    : c.primary.withValues(alpha: 0.55))
                                : c.border,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.local_fire_department_rounded,
                    size: 15,
                    color: c.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    l10n.journeyCardStreak(streakDays),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: c.primary,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DayBadge extends StatelessWidget {
  const _DayBadge({required this.day});

  final int day;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final l10n = context.l10n;
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            c.primary.withValues(alpha: 0.18),
            c.primary.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.primary.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.journeyCardDayLabel,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w800,
              color: c.primary,
              letterSpacing: 0.8,
              height: 1,
            ),
          ),
          Text(
            '$day',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: c.primary,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
