import 'package:calm_calibrate/core/animations/fade_slide_in.dart';
import 'package:calm_calibrate/core/constants/app_spacing.dart';
import 'package:calm_calibrate/core/widgets/onboarding_step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Standard onboarding layout — step bar, title, animated content, bottom CTA.
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.step,
    this.totalSteps = 5,
    this.bottom,
    this.showBack = true,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? bottom;
  final int? step;
  final int totalSteps;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBack
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                onPressed: () => context.pop(),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (step != null) ...[
                OnboardingStepIndicator(
                  currentStep: step!,
                  totalSteps: totalSteps,
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
              FadeSlideIn(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: AppSpacing.sm),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 60),
                  child: Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              Expanded(
                child: FadeSlideIn(
                  delay: const Duration(milliseconds: 120),
                  child: child,
                ),
              ),
              if (bottom != null) ...[
                FadeSlideIn(
                  delay: const Duration(milliseconds: 200),
                  child: bottom!,
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
