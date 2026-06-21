import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.name = '',
    this.painAreas = const {},
    this.sittingHours,
    this.preferredBreakTimes = const {},
    this.goals = const {},
    this.reminderMinutes = 45,
    this.smartReminders = true,
    this.isSaving = false,
  });

  final String name;
  final Set<PainArea> painAreas;
  final SittingHours? sittingHours;
  final Set<BreakTime> preferredBreakTimes;
  final Set<UserGoal> goals;
  final int reminderMinutes;
  final bool smartReminders;
  final bool isSaving;

  OnboardingState copyWith({
    String? name,
    Set<PainArea>? painAreas,
    SittingHours? sittingHours,
    Set<BreakTime>? preferredBreakTimes,
    Set<UserGoal>? goals,
    int? reminderMinutes,
    bool? smartReminders,
    bool? isSaving,
  }) {
    return OnboardingState(
      name: name ?? this.name,
      painAreas: painAreas ?? this.painAreas,
      sittingHours: sittingHours ?? this.sittingHours,
      preferredBreakTimes: preferredBreakTimes ?? this.preferredBreakTimes,
      goals: goals ?? this.goals,
      reminderMinutes: reminderMinutes ?? this.reminderMinutes,
      smartReminders: smartReminders ?? this.smartReminders,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  bool get canContinuePain => painAreas.isNotEmpty;
  bool get canContinueWork =>
      name.trim().isNotEmpty &&
      sittingHours != null &&
      preferredBreakTimes.isNotEmpty;
  bool get canContinueGoals => goals.isNotEmpty;

  @override
  List<Object?> get props => [
        name,
        painAreas,
        sittingHours,
        preferredBreakTimes,
        goals,
        reminderMinutes,
        smartReminders,
        isSaving,
      ];
}
