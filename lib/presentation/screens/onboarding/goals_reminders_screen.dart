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

class GoalsRemindersScreen extends StatelessWidget {
  GoalsRemindersScreen({super.key});

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
                  'Goals & reminders',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'We\'ll nudge you at the right time — never during meetings.',
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: 28),
                Text(
                  'Primary goal',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: 12),
                ...UserGoal.values.map(
                  (goal) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SelectableChip(
                      label: goal.label,
                      selected: state.goal == goal,
                      onTap: () => bloc.add(OnboardingGoalSet(goal)),
                      expanded: true,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Reminder frequency',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [30, 45, 60].map((mins) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
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
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(16),
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
                Spacer(),
                PrimaryButton(
                  label: 'Continue',
                  onPressed: state.canContinueGoals
                      ? () {
                          bloc.add(const OnboardingPartialProfileSaveRequested());
                          context.push('/onboarding/notifications');
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
