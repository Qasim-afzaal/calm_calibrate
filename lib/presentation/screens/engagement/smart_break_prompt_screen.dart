import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartBreakPromptScreen extends StatelessWidget {
  SmartBreakPromptScreen({super.key});

  String _breakMessage() {
    final isPremium = SubscriptionRepository.instance.isPremium;
    if (isPremium) {
      final posture = AppCache.instance.latestPostureAnalysis;
      if (posture != null && posture.issues.isNotEmpty) {
        return 'AI picked this break for your ${posture.issues.first.toLowerCase()}. '
            'You\'ve been sitting 47 min — 90 seconds will help.';
      }
      return 'Pro smart break: your neck needs a reset after 47 min of sitting.';
    }
    return 'You\'ve been sitting 47 min. '
        'Your neck could use a 90-second reset.';
  }

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] smart_break loaded'); // auth-check-debug
    final c = context.appColors;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: c.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bolt,
                  color: c.primary,
                  size: 36,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Smart Break',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _breakMessage(),
                textAlign: TextAlign.center,
                style: TextStyle(color: c.textSecondary),
              ),
              SizedBox(height: 24),
              PrimaryButton(
                label: 'Start 90-sec break',
                onPressed: () {
                  Navigator.pop(context);
                  context.push('/pre-workout/midday_break');
                },
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Snooze 15 min'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
