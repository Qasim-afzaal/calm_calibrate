import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    this.name = 'there',
    this.painAreas = const {},
    this.sittingHours,
    this.preferredBreakTimes = const {},
    this.goal,
    this.reminderMinutes = 45,
    this.smartReminders = true,
    this.onboardingComplete = false,
    this.streakDays = 0,
    this.mobilityPoints = 0,
    this.isPremium = false,
  });

  final String name;
  final Set<PainArea> painAreas;
  final SittingHours? sittingHours;
  final Set<BreakTime> preferredBreakTimes;
  final UserGoal? goal;
  final int reminderMinutes;
  final bool smartReminders;
  final bool onboardingComplete;
  final int streakDays;
  final int mobilityPoints;
  final bool isPremium;

  UserProfile copyWith({
    String? name,
    Set<PainArea>? painAreas,
    SittingHours? sittingHours,
    Set<BreakTime>? preferredBreakTimes,
    UserGoal? goal,
    int? reminderMinutes,
    bool? smartReminders,
    bool? onboardingComplete,
    int? streakDays,
    int? mobilityPoints,
    bool? isPremium,
  }) {
    return UserProfile(
      name: name ?? this.name,
      painAreas: painAreas ?? this.painAreas,
      sittingHours: sittingHours ?? this.sittingHours,
      preferredBreakTimes: preferredBreakTimes ?? this.preferredBreakTimes,
      goal: goal ?? this.goal,
      reminderMinutes: reminderMinutes ?? this.reminderMinutes,
      smartReminders: smartReminders ?? this.smartReminders,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
      streakDays: streakDays ?? this.streakDays,
      mobilityPoints: mobilityPoints ?? this.mobilityPoints,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  @override
  List<Object?> get props => [
        name,
        painAreas,
        sittingHours,
        preferredBreakTimes,
        goal,
        reminderMinutes,
        smartReminders,
        onboardingComplete,
        streakDays,
        mobilityPoints,
        isPremium,
      ];
}
