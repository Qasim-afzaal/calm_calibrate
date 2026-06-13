import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:equatable/equatable.dart';

enum AssessmentStatus { idle, scanning, complete }

class AssessmentState extends Equatable {
  const AssessmentState({
    this.status = AssessmentStatus.idle,
    this.scanProgress = 0,
    this.mobilityScore,
  });

  final AssessmentStatus status;
  final double scanProgress;
  final MobilityScore? mobilityScore;

  AssessmentState copyWith({
    AssessmentStatus? status,
    double? scanProgress,
    MobilityScore? mobilityScore,
  }) {
    return AssessmentState(
      status: status ?? this.status,
      scanProgress: scanProgress ?? this.scanProgress,
      mobilityScore: mobilityScore ?? this.mobilityScore,
    );
  }

  @override
  List<Object?> get props => [status, scanProgress, mobilityScore];
}
