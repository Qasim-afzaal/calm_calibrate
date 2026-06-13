import 'package:equatable/equatable.dart';

/// Things the UI (or other code) can ask [AiPlanBloc] to do.
sealed class AiPlanEvent extends Equatable {
  const AiPlanEvent();

  @override
  List<Object?> get props => [];
}

/// Load any plan already saved on the device. Optionally kick off generation.
final class AiPlanStarted extends AiPlanEvent {
  const AiPlanStarted({this.autoGenerate = false});

  final bool autoGenerate;

  @override
  List<Object?> get props => [autoGenerate];
}

/// Call the AI service and save a new daily plan.
final class AiPlanGenerateRequested extends AiPlanEvent {
  const AiPlanGenerateRequested();
}
