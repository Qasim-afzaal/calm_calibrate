import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/core/widgets/selectable_chip.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkPatternScreen extends StatelessWidget {
  const WorkPatternScreen({super.key});

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
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your work pattern',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'This helps us schedule breaks when you need them most.',
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: 32),
                Text(
                  'Hours sitting per day',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: SittingHours.values.map((hours) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: SelectableChip(
                          label: hours.label,
                          selected: state.sittingHours == hours,
                          onTap: () =>
                              bloc.add(OnboardingSittingHoursSet(hours)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 32),
                Text(
                  'Best break times?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: BreakTime.values.map((time) {
                    return SelectableChip(
                      label: time.label,
                      selected: state.preferredBreakTimes.contains(time),
                      onTap: () => bloc.add(OnboardingBreakTimeToggled(time)),
                    );
                  }).toList(),
                ),
                Spacer(),
                PrimaryButton(
                  label: 'Continue',
                  onPressed: state.canContinueWork
                      ? () {
                          bloc.add(const OnboardingPartialProfileSaveRequested());
                          context.push('/onboarding/goals');
                        }
                      : null,
                ),
                SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
