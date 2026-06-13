import 'package:equatable/equatable.dart';

sealed class AssessmentEvent extends Equatable {
  const AssessmentEvent();

  @override
  List<Object?> get props => [];
}

final class AssessmentScanStarted extends AssessmentEvent {
  const AssessmentScanStarted();
}

final class AssessmentResetRequested extends AssessmentEvent {
  const AssessmentResetRequested();
}
