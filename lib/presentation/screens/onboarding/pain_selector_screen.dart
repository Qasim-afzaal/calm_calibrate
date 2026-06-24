import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/l10n/model_labels.dart';
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
    final l10n = context.l10n;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bloc = context.read<OnboardingBloc>();

        return OnboardingPage(
          step: 1,
          title: l10n.painSelectorTitle,
          bottom: AppButton(
            label: l10n.continueButton,
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
                    areaLabel: (area) => area.localized(l10n),
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
