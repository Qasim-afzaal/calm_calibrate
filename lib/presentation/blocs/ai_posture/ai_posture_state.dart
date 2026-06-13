import 'package:calm_calibrate/data/models/premium.dart';
import 'package:equatable/equatable.dart';

enum AiPostureStatus { idle, analyzing, done, error }

class AiPostureState extends Equatable {
  const AiPostureState({
    this.status = AiPostureStatus.idle,
    this.selectedIssues = const {},
    this.result,
    this.history = const [],
  });

  final AiPostureStatus status;
  final Set<String> selectedIssues;
  final PostureAnalysis? result;
  final List<PostureAnalysis> history;

  AiPostureState copyWith({
    AiPostureStatus? status,
    Set<String>? selectedIssues,
    PostureAnalysis? result,
    List<PostureAnalysis>? history,
  }) {
    return AiPostureState(
      status: status ?? this.status,
      selectedIssues: selectedIssues ?? this.selectedIssues,
      result: result ?? this.result,
      history: history ?? this.history,
    );
  }

  @override
  List<Object?> get props => [status, selectedIssues, result, history];
}
