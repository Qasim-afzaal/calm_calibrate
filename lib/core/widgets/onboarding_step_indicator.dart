import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

class OnboardingStepIndicator extends StatelessWidget {
  OnboardingStepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      children: List.generate(totalSteps, (i) {
        final active = i < currentStep;
        final current = i == currentStep - 1;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: i < totalSteps - 1 ? 6 : 0),
            decoration: BoxDecoration(
              color: active || current ? c.primary : c.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}
