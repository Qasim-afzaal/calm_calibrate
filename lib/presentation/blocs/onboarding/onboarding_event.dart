import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:equatable/equatable.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

final class OnboardingPainAreaToggled extends OnboardingEvent {
  const OnboardingPainAreaToggled(this.area);

  final PainArea area;

  @override
  List<Object?> get props => [area];
}

final class OnboardingSittingHoursSet extends OnboardingEvent {
  const OnboardingSittingHoursSet(this.hours);

  final SittingHours hours;

  @override
  List<Object?> get props => [hours];
}

final class OnboardingBreakTimeToggled extends OnboardingEvent {
  const OnboardingBreakTimeToggled(this.time);

  final BreakTime time;

  @override
  List<Object?> get props => [time];
}

final class OnboardingGoalSet extends OnboardingEvent {
  const OnboardingGoalSet(this.goal);

  final UserGoal goal;

  @override
  List<Object?> get props => [goal];
}

final class OnboardingReminderMinutesSet extends OnboardingEvent {
  const OnboardingReminderMinutesSet(this.minutes);

  final int minutes;

  @override
  List<Object?> get props => [minutes];
}

final class OnboardingSmartRemindersSet extends OnboardingEvent {
  const OnboardingSmartRemindersSet(this.enabled);

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class OnboardingPartialProfileSaveRequested extends OnboardingEvent {
  const OnboardingPartialProfileSaveRequested();
}
