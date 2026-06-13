import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PainSelectorScreen extends StatelessWidget {
  PainSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bloc = context.read<OnboardingBloc>();

        return OnboardingPage(
          step: 1,
          title: 'Where does\nsitting hurt?',
          subtitle: 'Tap the areas that bother you most. We\'ll personalize your plan.',
          bottom: AppButton(
            label: 'Continue',
            onPressed: state.canContinuePain
                ? () {
                    bloc.add(const OnboardingPartialProfileSaveRequested());
                    context.push('/onboarding/work-pattern');
                  }
                : null,
          ),
          child: Column(
            children: [
              Expanded(
                child: BodyPainMap(
                  selectedAreas: state.painAreas,
                  onAreaToggled: (area) =>
                      bloc.add(OnboardingPainAreaToggled(area)),
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: PainArea.values.map((area) {
                  final selected = state.painAreas.contains(area);
                  return FilterChip(
                    label: Text(area.label),
                    selected: selected,
                    onSelected: (_) =>
                        bloc.add(OnboardingPainAreaToggled(area)),
                    selectedColor: c.primaryLight,
                    checkmarkColor: c.primary,
                    side: BorderSide(
                      color: selected ? c.primary : c.border,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
