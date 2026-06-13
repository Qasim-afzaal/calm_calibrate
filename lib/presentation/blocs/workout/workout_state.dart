import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:equatable/equatable.dart';

enum WorkoutStatus { idle, active, paused, completed }

class WorkoutState extends Equatable {
  const WorkoutState({
    this.session,
    this.currentStepIndex = 0,
    this.secondsRemaining = 0,
    this.status = WorkoutStatus.idle,
    this.prePainScore = 3,
    this.postPainScore = 2,
    this.mobilityPointsEarned = 0,
  });

  final ExerciseSession? session;
  final int currentStepIndex;
  final int secondsRemaining;
  final WorkoutStatus status;
  final int prePainScore;
  final int postPainScore;
  final int mobilityPointsEarned;

  ExerciseStep? get currentStep {
    final s = session;
    if (s == null || currentStepIndex >= s.steps.length) return null;
    return s.steps[currentStepIndex];
  }

  bool get isLastStep =>
      session != null && currentStepIndex >= session!.steps.length - 1;

  double get progress {
    final s = session;
    if (s == null || s.steps.isEmpty) return 0;
    return (currentStepIndex + 1) / s.steps.length;
  }

  WorkoutState copyWith({
    ExerciseSession? session,
    int? currentStepIndex,
    int? secondsRemaining,
    WorkoutStatus? status,
    int? prePainScore,
    int? postPainScore,
    int? mobilityPointsEarned,
  }) {
    return WorkoutState(
      session: session ?? this.session,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      status: status ?? this.status,
      prePainScore: prePainScore ?? this.prePainScore,
      postPainScore: postPainScore ?? this.postPainScore,
      mobilityPointsEarned: mobilityPointsEarned ?? this.mobilityPointsEarned,
    );
  }

  @override
  List<Object?> get props => [
        session,
        currentStepIndex,
        secondsRemaining,
        status,
        prePainScore,
        postPainScore,
        mobilityPointsEarned,
      ];
}
