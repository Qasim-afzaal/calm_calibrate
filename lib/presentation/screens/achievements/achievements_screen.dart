import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] achievements loaded'); // auth-check-debug
    final c = context.appColors;
    final achievements = EngagementRepository.instance.achievements;
    final unlocked = achievements.where((a) => a.isUnlocked).length;

    final m = context.metrics;
    return Scaffold(
      appBar: AppBar(title: Text('Achievements')),
      body: ListView(
        padding: responsiveScreenPaddingAll(context),
        children: [
          Text(
            '$unlocked / ${achievements.length} unlocked',
            style: TextStyle(
              fontSize: 16,
              color: c.textSecondary,
            ),
          ),
          SizedBox(height: m.stackSpacing),
          ...achievements.map(
            (a) => Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: a.isUnlocked
                      ? c.primaryLight
                      : c.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: a.isUnlocked
                        ? c.primary.withValues(alpha: 0.3)
                        : c.border,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      a.icon,
                      size: 32,
                      color: a.isUnlocked ? c.primary : c.textMuted,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: a.isUnlocked
                                  ? c.textPrimary
                                  : c.textMuted,
                            ),
                          ),
                          Text(
                            a.description,
                            style: TextStyle(
                              fontSize: 13,
                              color: c.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (a.isUnlocked)
                      Icon(Icons.check_circle, color: c.success)
                    else
                      Text(
                        'Day ${a.unlockedDay}',
                        style: TextStyle(
                          fontSize: 12,
                          color: c.textMuted,
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
}
