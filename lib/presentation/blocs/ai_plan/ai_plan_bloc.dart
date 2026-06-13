import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/data/services/ai_service.dart';
import 'package:calm_calibrate/presentation/blocs/ai_plan/ai_plan_event.dart';
import 'package:calm_calibrate/presentation/blocs/ai_plan/ai_plan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Handles AI daily plan logic. UI sends [AiPlanEvent]s; UI rebuilds from [AiPlanState].
class AiPlanBloc extends Bloc<AiPlanEvent, AiPlanState> {
  AiPlanBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? MockUserRepository.instance,
        super(const AiPlanState()) {
    on<AiPlanStarted>(_onStarted);
    on<AiPlanGenerateRequested>(_onGenerateRequested);
  }

  final UserRepository _userRepository;

  void _onStarted(AiPlanStarted event, Emitter<AiPlanState> emit) {
    final cached = AppCache.instance.aiDailyPlan;
    emit(state.copyWith(plan: cached));

    if (event.autoGenerate && cached == null) {
      add(const AiPlanGenerateRequested());
    }
  }

  Future<void> _onGenerateRequested(
    AiPlanGenerateRequested event,
    Emitter<AiPlanState> emit,
  ) async {
    emit(state.copyWith(status: AiPlanStatus.generating));

    try {
      final plan = await AiService.instance.generateDailyPlan(
        profile: _userRepository.profile,
        mobilityScore: _userRepository.mobilityScore?.overall,
        recentSessions: _userRepository.sessionLogs.take(14).toList(),
        latestPosture: AppCache.instance.latestPostureAnalysis,
      );
      await AppCache.instance.saveAiDailyPlan(plan);
      emit(state.copyWith(status: AiPlanStatus.done, plan: plan));
    } catch (_) {
      emit(state.copyWith(status: AiPlanStatus.error));
    }
  }
}
