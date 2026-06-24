import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/content_l10n.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
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
    final l10n = context.l10n;
    final achievements = EngagementRepository.instance.achievements;
    final unlocked = achievements.where((a) => a.isUnlocked).length;

    final m = context.metrics;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.achievementsTitle)),
      body: ListView(
        padding: responsiveScreenPaddingAll(context),
        children: [
          Text(
            l10n.achievementsUnlockedCount(unlocked, achievements.length),
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
                            localizedAchievementTitle(l10n, a.id),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: a.isUnlocked
                                  ? c.textPrimary
                                  : c.textMuted,
                            ),
                          ),
                          Text(
                            localizedAchievementDesc(l10n, a.id),
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
                        l10n.achievementUnlockDay(a.unlockedDay),
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
