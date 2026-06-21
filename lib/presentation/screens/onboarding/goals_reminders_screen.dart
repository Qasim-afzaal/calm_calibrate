import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/core/widgets/selectable_chip.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoalsRemindersScreen extends StatelessWidget {
  const GoalsRemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] goals_reminders loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();

          return ResponsiveScrollBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Goals & reminders',
                  style: m.headlineStyle(Theme.of(context).textTheme),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  'We\'ll nudge you at the right time, never during meetings.',
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: m.onboardingSectionGap + 4),
                Text(
                  'Your goals',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: m.sectionGap + 4),
                ...UserGoal.values.map(
                  (goal) => Padding(
                    padding: EdgeInsets.only(bottom: m.sectionGap + 2),
                    child: SelectableChip(
                      label: goal.label,
                      selected: state.goals.contains(goal),
                      onTap: () => bloc.add(OnboardingGoalToggled(goal)),
                      expanded: true,
                    ),
                  ),
                ),
                SizedBox(height: m.onboardingSectionGap),
                Text(
                  'Reminder frequency',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: m.sectionGap + 4),
                Row(
                  children: [30, 45, 60].map((mins) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: m.sectionGap),
                        child: SelectableChip(
                          label: '$mins min',
                          selected: state.reminderMinutes == mins,
                          onTap: () =>
                              bloc.add(OnboardingReminderMinutesSet(mins)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: m.onboardingSectionGap),
                Container(
                  padding: EdgeInsets.all(m.stackSpacing),
                  decoration: BoxDecoration(
                    color: c.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: c.border),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Smart Reminders',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: c.textPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Adapt to your work hours & activity',
                              style: TextStyle(
                                fontSize: 13,
                                color: c.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: state.smartReminders,
                        onChanged: (enabled) =>
                            bloc.add(OnboardingSmartRemindersSet(enabled)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: m.blockSpacing),
                PrimaryButton(
                  label: 'Continue',
                  onPressed: state.canContinueGoals
                      ? () {
                          bloc.add(const OnboardingPartialProfileSaveRequested());
                          context.push('/onboarding/notifications');
                        }
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
