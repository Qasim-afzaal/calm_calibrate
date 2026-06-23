import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] welcome_screen loaded'); // auth-check-debug
    final m = context.metrics;
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveContent(
          child: Padding(
            padding: m.screenPadding,
            child: Column(
              children: [
                Spacer(flex: m.isVeryCompact ? 1 : 2),
                FadeSlideIn(child: DeskHeroIllustration()),
                SizedBox(height: m.largeSpacing),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 100),
                  child: Text(
                    l10n.welcomeTitle,
                    textAlign: TextAlign.center,
                    style: m.headlineLargeStyle(Theme.of(context).textTheme),
                  ),
                ),
                SizedBox(height: m.onboardingTitleGap),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 180),
                  child: Text(
                    l10n.welcomeSubtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Spacer(flex: m.isVeryCompact ? 2 : 3),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 260),
                  child: AppButton(
                    label: l10n.getStarted,
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () => context.push('/onboarding/pain'),
                  ),
                ),
                SizedBox(height: m.onboardingBottomGap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
