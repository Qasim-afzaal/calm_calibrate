import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/models/engagement_journey.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StreakMilestoneScreen extends StatelessWidget {
  const StreakMilestoneScreen({super.key, required this.day});

  final int day;

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] streak_milestone loaded'); // auth-check-debug
    final c = context.appColors;
    final plan = JourneyPlan.forDay(day);
    final milestone = plan?.milestone ?? 'Milestone reached!';
    final repo = EngagementRepository.instance;
    repo.markMilestoneSeen(day);
    final m = context.metrics;
    final achievement = _achievementForDay(day);
    final icon = achievement?.icon ?? _iconForDay(day);
    final message = _messageForDay(day, plan?.goal);

    return Scaffold(
      backgroundColor: c.navy,
      body: Stack(
        children: [
          const _MilestoneBackdrop(),
          SafeArea(
            child: ResponsiveContent(
              child: Padding(
                padding: m.screenPaddingAll,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => context.go('/home'),
                        icon: Icon(Icons.close_rounded, color: c.onNavy),
                        tooltip: 'Close',
                      ),
                    ),
                    const Spacer(),
                    FadeSlideIn(
                      child: _AchievementPill(label: 'Achievement unlocked'),
                    ),
                    SizedBox(height: m.sectionGap + 4),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 80),
                      child: PulseRing(
                        color: c.primary,
                        child: CelebrationPop(
                          child: Container(
                            width: m.isCompact ? 132 : 152,
                            height: m.isCompact ? 132 : 152,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  c.primary.withValues(alpha: 0.28),
                                  c.primary.withValues(alpha: 0.08),
                                ],
                              ),
                              border: Border.all(
                                color: c.primary.withValues(alpha: 0.35),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: c.primary.withValues(alpha: 0.25),
                                  blurRadius: 32,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(icon, size: m.isCompact ? 52 : 60, color: c.primary),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: m.onboardingSectionGap),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 140),
                      child: Text(
                        '$day',
                        style: TextStyle(
                          color: c.onNavy,
                          fontSize: m.isCompact ? 72 : 88,
                          fontWeight: FontWeight.w800,
                          height: 1,
                          letterSpacing: -2,
                        ),
                      ),
                    ),
                    SizedBox(height: m.sectionGap),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 180),
                      child: Text(
                        milestone.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: c.primary,
                          fontSize: m.isCompact ? 14 : 15,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: m.onboardingTitleGap),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 220),
                      child: _StreakProgress(day: day),
                    ),
                    SizedBox(height: m.onboardingSectionGap),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 260),
                      child: _MessageCard(message: message),
                    ),
                    if (achievement != null) ...[
                      SizedBox(height: m.sectionGap + 4),
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 300),
                        child: _AchievementCard(achievement: achievement),
                      ),
                    ],
                    const Spacer(flex: 2),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 340),
                      child: Column(
                        children: [
                          if (day == 30 && SubscriptionFeatures.enabled)
                            AppButton(
                              label: 'Unlock Pro free trial',
                              onPressed: () => context.push('/premium'),
                            ),
                          if (day == 30 && SubscriptionFeatures.enabled) SizedBox(height: m.sectionGap + 4),
                          AppButton(
                            label: day == 30 ? 'Continue to Home' : 'Keep going',
                            variant: day == 30
                                ? AppButtonVariant.outlined
                                : AppButtonVariant.filled,
                            onPressed: () => context.go('/home'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Achievement? _achievementForDay(int day) {
    for (final a in Achievements.all) {
      if (a.unlockedDay == day) return a;
    }
    return null;
  }

  static IconData _iconForDay(int day) {
    return switch (day) {
      30 => Icons.emoji_events_outlined,
      14 => Icons.fitness_center_outlined,
      7 => Icons.star_outline_rounded,
      _ => Icons.local_fire_department_outlined,
    };
  }

  static String _messageForDay(int day, String? goal) {
    if (goal != null && goal.isNotEmpty) return goal;
    return switch (day) {
      3 => 'Three days in a row. Small breaks are adding up.',
      7 => 'One full week of showing up for your body.',
      14 => 'Two weeks of consistency — your mobility is improving.',
      30 => 'Thirty days. You built a real desk recovery habit.',
      _ => 'Keep showing up. Your body is changing.',
    };
  }
}

class _MilestoneBackdrop extends StatelessWidget {
  const _MilestoneBackdrop();

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -80,
            right: -40,
            child: _GlowOrb(
              size: 220,
              color: c.primary.withValues(alpha: 0.14),
            ),
          ),
          Positioned(
            bottom: 120,
            left: -60,
            child: _GlowOrb(
              size: 180,
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _AchievementPill extends StatelessWidget {
  const _AchievementPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome_rounded, size: 16, color: c.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: c.onNavy.withValues(alpha: 0.9),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakProgress extends StatelessWidget {
  const _StreakProgress({required this.day});

  final int day;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;

    if (day <= 7) {
      return _StreakProgressDots(day: day, maxDots: day);
    }

    final weeks = (day / 7).floor();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(weeks.clamp(1, 4), (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: 28,
                height: 8,
                decoration: BoxDecoration(
                  color: c.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          '$day days strong',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _StreakProgressDots extends StatelessWidget {
  const _StreakProgressDots({required this.day, required this.maxDots});

  final int day;
  final int maxDots;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(maxDots, (index) {
        final filled = index < day;
        final isLast = index == day - 1;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isLast ? 12 : 10,
            height: isLast ? 12 : 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: filled
                  ? (isLast ? c.primary : c.primary.withValues(alpha: 0.75))
                  : Colors.white.withValues(alpha: 0.18),
              boxShadow: isLast
                  ? [
                      BoxShadow(
                        color: c.primary.withValues(alpha: 0.45),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
          ),
        );
      }),
    );
  }
}

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.82),
          fontSize: 15,
          height: 1.45,
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: c.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.primary.withValues(alpha: 0.28)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: c.primary.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(achievement.icon, color: c.primary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: TextStyle(
                    color: c.onNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  achievement.description,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
