import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/models/engagement_journey.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StreakMilestoneScreen extends StatelessWidget {
  StreakMilestoneScreen({super.key, required this.day});

  final int day;

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] streak_milestone loaded'); // auth-check-debug
    final c = context.appColors;
    final plan = JourneyPlan.forDay(day);
    final milestone = plan?.milestone ?? 'Milestone reached!';
    final repo = EngagementRepository.instance;
    repo.markMilestoneSeen(day);

    return Scaffold(
      backgroundColor: c.navy,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Text(
                milestone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 16),
              Text(
                plan?.goal ?? 'Keep showing up — your body is changing.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 40),
              CelebrationPop(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    day == 30
                        ? '🏆'
                        : day == 14
                            ? '💪'
                            : '🔥',
                    style: TextStyle(fontSize: 64),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                '${repo.streakDays} day streak',
                style: TextStyle(
                  color: c.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(flex: 2),
              FadeSlideIn(
                delay: Duration(milliseconds: 300),
                child: Column(
                  children: [
                    if (day == 30)
                      AppButton(
                        label: 'Unlock Pro — Free Trial',
                        onPressed: () => context.push('/premium'),
                      ),
                    if (day == 30) SizedBox(height: 12),
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
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
