import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.painAreas = const {},
    this.sittingHours,
    this.preferredBreakTimes = const {},
    this.goal,
    this.reminderMinutes = 45,
    this.smartReminders = true,
    this.isSaving = false,
  });

  final Set<PainArea> painAreas;
  final SittingHours? sittingHours;
  final Set<BreakTime> preferredBreakTimes;
  final UserGoal? goal;
  final int reminderMinutes;
  final bool smartReminders;
  final bool isSaving;

  OnboardingState copyWith({
    Set<PainArea>? painAreas,
    SittingHours? sittingHours,
    Set<BreakTime>? preferredBreakTimes,
    UserGoal? goal,
    int? reminderMinutes,
    bool? smartReminders,
    bool? isSaving,
  }) {
    return OnboardingState(
      painAreas: painAreas ?? this.painAreas,
      sittingHours: sittingHours ?? this.sittingHours,
      preferredBreakTimes: preferredBreakTimes ?? this.preferredBreakTimes,
      goal: goal ?? this.goal,
      reminderMinutes: reminderMinutes ?? this.reminderMinutes,
      smartReminders: smartReminders ?? this.smartReminders,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  bool get canContinuePain => painAreas.isNotEmpty;
  bool get canContinueWork =>
      sittingHours != null && preferredBreakTimes.isNotEmpty;
  bool get canContinueGoals => goal != null;

  @override
  List<Object?> get props => [
        painAreas,
        sittingHours,
        preferredBreakTimes,
        goal,
        reminderMinutes,
        smartReminders,
        isSaving,
      ];
}
