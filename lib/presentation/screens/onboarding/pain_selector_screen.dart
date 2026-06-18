import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PainSelectorScreen extends StatelessWidget {
  const PainSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] pain_selector loaded'); // auth-check-debug
    final m = context.metrics;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bloc = context.read<OnboardingBloc>();

        return OnboardingPage(
          step: 1,
          title: 'Where does sitting hurt?',
          bottom: AppButton(
            label: 'Continue',
            onPressed: state.canContinuePain
                ? () {
                    bloc.add(const OnboardingPartialProfileSaveRequested());
                    context.push('/onboarding/work-pattern');
                  }
                : null,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 380,
                    maxHeight: constraints.maxHeight,
                    minHeight: m.isVeryCompact ? 260 : 300,
                  ),
                  child: BodyPainMap(
                    selectedAreas: state.painAreas,
                    onAreaToggled: (area) =>
                        bloc.add(OnboardingPainAreaToggled(area)),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
