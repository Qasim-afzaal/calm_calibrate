import 'package:calm_calibrate/data/models/premium.dart';
import 'package:equatable/equatable.dart';

enum AiPlanStatus { idle, generating, done, error }

/// What the UI reads to decide what to show.
class AiPlanState extends Equatable {
  const AiPlanState({
    this.status = AiPlanStatus.idle,
    this.plan,
  });

  final AiPlanStatus status;
  final AiDailyPlan? plan;

  AiPlanState copyWith({
    AiPlanStatus? status,
    AiDailyPlan? plan,
  }) {
    return AiPlanState(
      status: status ?? this.status,
      plan: plan ?? this.plan,
    );
  }

  @override
  List<Object?> get props => [status, plan];
}
