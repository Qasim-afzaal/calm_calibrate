import 'package:equatable/equatable.dart';

sealed class AiPostureEvent extends Equatable {
  const AiPostureEvent();

  @override
  List<Object?> get props => [];
}

final class AiPostureStarted extends AiPostureEvent {
  const AiPostureStarted();
}

final class AiPostureIssueToggled extends AiPostureEvent {
  const AiPostureIssueToggled(this.issue);

  final String issue;

  @override
  List<Object?> get props => [issue];
}

final class AiPostureAnalyzeRequested extends AiPostureEvent {
  const AiPostureAnalyzeRequested();
}
