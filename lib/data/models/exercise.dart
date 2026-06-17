import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Visual guide for how the user should move during a step.
enum ExercisePose {
  neckRoll,
  shoulderShrug,
  seatedTwist,
  chestOpener,
  neckSideRelease,
  seatedCatCow,
  hipFlexorStretch,
  standingBackExtension,
  thoracicExtension,
  figure4Stretch,
  childPoseChair,
  deepBreathing,
  deskStretch,
}

class ExerciseStep extends Equatable {
  const ExerciseStep({
    required this.name,
    required this.durationSeconds,
    required this.instruction,
    this.pose = ExercisePose.deskStretch,
    this.tip,
  });

  final String name;
  final int durationSeconds;
  final String instruction;
  final ExercisePose pose;
  final String? tip;

  @override
  List<Object?> get props => [name, durationSeconds, instruction, pose, tip];
}

class ExerciseSession extends Equatable {
  const ExerciseSession({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.durationMinutes,
    required this.focusAreas,
    required this.steps,
    this.isCompleted = false,
    this.icon = Icons.self_improvement_outlined,
  });

  final String id;
  final String title;
  final String subtitle;
  final int durationMinutes;
  final List<PainArea> focusAreas;
  final List<ExerciseStep> steps;
  final bool isCompleted;
  final IconData icon;

  int get totalSeconds =>
      steps.fold(0, (sum, step) => sum + step.durationSeconds);

  ExerciseSession copyWith({bool? isCompleted}) {
    return ExerciseSession(
      id: id,
      title: title,
      subtitle: subtitle,
      durationMinutes: durationMinutes,
      focusAreas: focusAreas,
      steps: steps,
      isCompleted: isCompleted ?? this.isCompleted,
      icon: icon,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, subtitle, durationMinutes, focusAreas, steps, isCompleted];
}
