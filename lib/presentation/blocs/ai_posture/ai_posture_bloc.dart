import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/data/services/ai_service.dart';
import 'package:calm_calibrate/presentation/blocs/ai_posture/ai_posture_event.dart';
import 'package:calm_calibrate/presentation/blocs/ai_posture/ai_posture_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiPostureBloc extends Bloc<AiPostureEvent, AiPostureState> {
  AiPostureBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? MockUserRepository.instance,
        super(const AiPostureState()) {
    on<AiPostureStarted>(_onStarted);
    on<AiPostureIssueToggled>(_onIssueToggled);
    on<AiPostureAnalyzeRequested>(_onAnalyzeRequested);
  }

  final UserRepository _userRepository;

  static const issueOptions = [
    'Forward head',
    'Rounded shoulders',
    'Slouched lower back',
    'Elevated shoulders',
    'Tight hips',
    'Wrist strain',
  ];

  void _onStarted(AiPostureStarted event, Emitter<AiPostureState> emit) {
    emit(
      state.copyWith(history: AppCache.instance.postureAnalyses),
    );
  }

  void _onIssueToggled(
    AiPostureIssueToggled event,
    Emitter<AiPostureState> emit,
  ) {
    final next = Set<String>.from(state.selectedIssues);
    if (next.contains(event.issue)) {
      next.remove(event.issue);
    } else {
      next.add(event.issue);
    }
    emit(state.copyWith(selectedIssues: next));
  }

  Future<void> _onAnalyzeRequested(
    AiPostureAnalyzeRequested event,
    Emitter<AiPostureState> emit,
  ) async {
    if (!AiFeatures.llmEnabled) return;
    if (state.selectedIssues.isEmpty) return;
    emit(state.copyWith(status: AiPostureStatus.analyzing, result: null));

    try {
      final result = await AiService.instance.analyzePosture(
        profile: _userRepository.profile,
        mobilityScore: _userRepository.mobilityScore?.overall,
        selectedIssues: state.selectedIssues.toList(),
        recentSessions: _userRepository.sessionLogs.take(10).toList(),
      );
      await AppCache.instance.savePostureAnalysis(result);
      emit(
        state.copyWith(
          status: AiPostureStatus.done,
          result: result,
          history: AppCache.instance.postureAnalyses,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: AiPostureStatus.error));
    }
  }
}
