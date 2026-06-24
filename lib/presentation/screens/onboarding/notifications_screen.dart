import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/onboarding_step_indicator.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/calculators/mobility_score_calculator.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/data/services/reminder_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] notifications loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: ResponsiveScrollBody(
        fillViewport: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnboardingStepIndicator(currentStep: 4),
            SizedBox(height: m.onboardingSectionGap),
            Text(
              l10n.stayOnTrackTitle,
              style: m.headlineStyle(Theme.of(context).textTheme),
            ),
            SizedBox(height: m.onboardingTitleGap),
            Text(
              l10n.stayOnTrackSubtitle,
              style: TextStyle(color: c.textSecondary),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: m.heroIconOuter,
                height: m.heroIconOuter,
                decoration: BoxDecoration(
                  color: c.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: m.heroIconInner,
                  color: c.primary,
                ),
              ),
            ),
            SizedBox(height: m.blockSpacing),
            _BenefitRow(text: l10n.notificationBenefitBreaks),
            _BenefitRow(text: l10n.notificationBenefitSlump),
            _BenefitRow(text: l10n.notificationBenefitStreak),
            const Spacer(flex: 2),
            PrimaryButton(
              label: l10n.enableNotifications,
              onPressed: () => _enableAndContinue(context),
            ),
            SizedBox(height: m.sectionGap + 4),
            PrimaryButton(
              label: l10n.maybeLater,
              variant: PrimaryButtonVariant.outlined,
              onPressed: () => _skipAndContinue(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _enableAndContinue(BuildContext context) async {
    final granted =
        await ReminderNotificationService.instance.requestPermission();
    if (granted) {
      await AppCache.instance.setNotificationsEnabled(true);
    }
    if (!context.mounted) return;
    await _continueOnboarding(context);
  }

  Future<void> _skipAndContinue(BuildContext context) async {
    await AppCache.instance.setNotificationsEnabled(false);
    await ReminderNotificationService.instance.cancelAll();
    if (!context.mounted) return;
    await _continueOnboarding(context);
  }

  Future<void> _continueOnboarding(BuildContext context) async {
    if (!AiFeatures.cameraScanEnabled) {
      await MobilityScoreCalculator.ensureEstimatedScore(
        MockUserRepository.instance,
      );
      if (!context.mounted) return;
      context.push('/onboarding/plan');
      return;
    }
    context.push('/onboarding/assessment');
  }
}

class _BenefitRow extends StatelessWidget {
  const _BenefitRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    return Padding(
      padding: EdgeInsets.only(bottom: m.sectionGap + 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: c.success, size: 20),
          SizedBox(width: m.sectionGap + 4),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
