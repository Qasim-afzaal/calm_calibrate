import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartBreakPromptScreen extends StatelessWidget {
  const SmartBreakPromptScreen({super.key});

  String _breakMessage() {
    if (SubscriptionRepository.instance.hasProAccess) {
      final posture = AppCache.instance.latestPostureAnalysis;
      if (posture != null && posture.issues.isNotEmpty) {
        return 'AI picked this break for your ${posture.issues.first.toLowerCase()}. '
            'You\'ve been sitting 47 min. 90 seconds will help.';
      }
      return 'Pro smart break: your neck needs a reset after 47 min of sitting.';
    }
    return 'You\'ve been sitting 47 min. '
        'Your neck could use a 90 second reset.';
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] smart_break loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: m.contentMaxWidth),
          child: Container(
            margin: m.screenPaddingAll,
            padding: m.screenPaddingAll,
            decoration: BoxDecoration(
              color: c.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(m.stackSpacing),
                  decoration: BoxDecoration(
                    color: c.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.bolt,
                    color: c.primary,
                    size: m.isCompact ? 30 : 36,
                  ),
                ),
                SizedBox(height: m.stackSpacing),
                Text(
                  'Smart Break',
                  style: TextStyle(
                    fontSize: m.headlineSize - 2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  _breakMessage(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: m.onboardingSectionGap),
                PrimaryButton(
                  label: 'Start 90 sec break',
                  onPressed: () {
                    Navigator.pop(context);
                    context.push('/pre-workout/midday_break');
                  },
                ),
                SizedBox(height: m.sectionGap + 2),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Snooze 15 min'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
