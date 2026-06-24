import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/data/calculators/mobility_score_calculator.dart';
import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_event.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Mobility score for onboarding.
///
/// When [AiFeatures.cameraScanEnabled] is false, score is estimated from
/// pain areas picked in onboarding — no camera or ML.
///
/// Future: replace with MediaPipe / ML Kit camera pipeline when enabled.
class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? MockUserRepository.instance,
        super(const AssessmentState()) {
    on<AssessmentScanStarted>(_onScanStarted);
    on<AssessmentResetRequested>(_onReset);
  }

  final UserRepository _userRepository;

  Future<void> _onScanStarted(
    AssessmentScanStarted event,
    Emitter<AssessmentState> emit,
  ) async {
    final profile = _userRepository.profile;
    final score = MobilityScoreCalculator.compute(profile.painAreas);
    AppLogger.debug(
      'assessment',
      'scan started camera=${AiFeatures.cameraScanEnabled} '
      'painAreas=${profile.painAreas.length}',
    );

    if (!AiFeatures.cameraScanEnabled) {
      // No camera / LLM yet — save estimate and continue onboarding.
      await _userRepository.saveMobilityScore(score);
      emit(
        state.copyWith(
          status: AssessmentStatus.complete,
          mobilityScore: score,
          scanProgress: 1,
        ),
      );
      return;
    }

    // --- Future: real camera scan (uncomment when ML Kit is wired) ---
    emit(state.copyWith(status: AssessmentStatus.scanning, scanProgress: 0));

    for (var i = 1; i <= 20; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 120));
      if (isClosed) return;
      emit(state.copyWith(scanProgress: i / 20));
    }

    await _userRepository.saveMobilityScore(score);

    emit(
      state.copyWith(
        status: AssessmentStatus.complete,
        mobilityScore: score,
        scanProgress: 1,
      ),
    );
  }

  void _onReset(
    AssessmentResetRequested event,
    Emitter<AssessmentState> emit,
  ) {
    emit(const AssessmentState());
  }
}
