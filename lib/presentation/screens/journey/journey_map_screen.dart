import 'package:calm_calibrate/core/animations/fade_slide_in.dart';
import 'package:calm_calibrate/core/constants/app_spacing.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/journey/journey_timeline_tile.dart';
import 'package:calm_calibrate/data/models/engagement_journey.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JourneyMapScreen extends StatelessWidget {
  const JourneyMapScreen({super.key});

  void _openDayAction(BuildContext context, JourneyDay plan) {
    final screen = plan.screen;
    if (screen.startsWith('/milestone/')) {
      context.push(screen);
      return;
    }
    if (screen.startsWith('/workout/')) {
      final id = screen.replaceFirst('/workout/', '');
      context.push('/pre-workout/$id');
      return;
    }
    if (screen.startsWith('/pre-workout/')) {
      context.push(screen);
      return;
    }
    context.push(screen);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final repo = EngagementRepository.instance;
    final currentDay = repo.currentDay;
    final todayPlan = JourneyPlan.resolve(currentDay);

    return Scaffold(
      appBar: AppBar(title: Text('30-Day Journey')),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.screenPadding),
        children: [
          FadeSlideIn(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    c.navy,
                    c.navy.withValues(alpha: 0.85),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day $currentDay of 30',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    todayPlan.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: currentDay / 30),
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          value: value,
                          backgroundColor: Colors.white24,
                          color: c.primary,
                          minHeight: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          ...List.generate(30, (i) {
            final day = i + 1;
            final plan = JourneyPlan.resolve(day);
            return FadeSlideIn(
              delay: Duration(milliseconds: 30 * i),
              child: JourneyTimelineTile(
                day: day,
                title: plan.title,
                action: plan.action,
                isPast: repo.isDayCompleted(day) && !repo.isDayCurrent(day),
                isCurrent: repo.isDayCurrent(day),
                isLast: day == 30,
                milestone: plan.milestone,
                onTap: () => _openDayAction(context, plan),
              ),
            );
          }),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
