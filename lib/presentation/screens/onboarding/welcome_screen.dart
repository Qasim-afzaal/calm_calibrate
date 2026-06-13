import 'package:calm_calibrate/core/constants/app_spacing.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] welcome_screen loaded'); // auth-check-debug
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              FadeSlideIn(child: DeskHeroIllustration()),
              const SizedBox(height: 40),
              FadeSlideIn(
                delay: const Duration(milliseconds: 100),
                child: Text(
                  'Move better\nat work',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 16),
              FadeSlideIn(
                delay: const Duration(milliseconds: 180),
                child: Text(
                  'Relieve stiffness, fix posture, and feel energized — '
                  'with 90-second desk breaks made for you.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Spacer(flex: 3),
              FadeSlideIn(
                delay: const Duration(milliseconds: 260),
                child: AppButton(
                  label: 'Get Started',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () => context.push('/onboarding/pain'),
                ),
              ),
              const SizedBox(height: 12),
              FadeSlideIn(
                delay: const Duration(milliseconds: 320),
                child: AppButton(
                  label: 'I already have an account',
                  variant: AppButtonVariant.outlined,
                  onPressed: () => context.go('/home'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
