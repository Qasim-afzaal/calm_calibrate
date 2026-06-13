import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/onboarding_step_indicator.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnboardingStepIndicator(currentStep: 4),
            SizedBox(height: 24),
            Text(
              'Stay on track',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              'Smart reminders nudge you at the right time — never during meetings.',
              style: TextStyle(color: c.textSecondary),
            ),
            Spacer(),
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: c.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: 56,
                  color: c.primary,
                ),
              ),
            ),
            SizedBox(height: 32),
            _BenefitRow(text: 'Break reminders during work hours'),
            _BenefitRow(text: '3pm slump alerts'),
            _BenefitRow(text: 'Streak protection nudges'),
            Spacer(flex: 2),
            PrimaryButton(
              label: 'Enable Notifications',
              onPressed: () => context.push('/onboarding/assessment'),
            ),
            SizedBox(height: 12),
            PrimaryButton(
              label: 'Maybe later',
              variant: PrimaryButtonVariant.outlined,
              onPressed: () => context.push('/onboarding/assessment'),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  _BenefitRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: c.success, size: 20),
          SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
