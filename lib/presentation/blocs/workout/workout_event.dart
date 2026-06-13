import 'package:equatable/equatable.dart';

sealed class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutSessionLoadRequested extends WorkoutEvent {
  const WorkoutSessionLoadRequested(this.sessionId);

  final String sessionId;

  @override
  List<Object?> get props => [sessionId];
}

final class WorkoutTimerTicked extends WorkoutEvent {
  const WorkoutTimerTicked();
}

final class WorkoutPaused extends WorkoutEvent {
  const WorkoutPaused();
}

final class WorkoutResumed extends WorkoutEvent {
  const WorkoutResumed();
}

final class WorkoutNextStepRequested extends WorkoutEvent {
  const WorkoutNextStepRequested();
}

final class WorkoutPreviousStepRequested extends WorkoutEvent {
  const WorkoutPreviousStepRequested();
}

final class WorkoutSkipped extends WorkoutEvent {
  const WorkoutSkipped();
}

final class WorkoutPostPainScoreSet extends WorkoutEvent {
  const WorkoutPostPainScoreSet(this.score);

  final int score;

  @override
  List<Object?> get props => [score];
}
