import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_event.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Simulates posture scan — replace with MediaPipe / camera pipeline later.
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
    emit(state.copyWith(status: AssessmentStatus.scanning, scanProgress: 0));

    for (var i = 1; i <= 20; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 120));
      if (isClosed) return;
      emit(state.copyWith(scanProgress: i / 20));
    }

    final profile = _userRepository.profile;
    final score = _computeScore(profile.painAreas);

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

  MobilityScore _computeScore(Set<PainArea> painAreas) {
    const base = 72;
    final penalty = painAreas.length * 4;
    final overall = (base - penalty).clamp(35, 85);

    final areas = painAreas.isEmpty
        ? PainArea.values.take(3)
        : painAreas.take(3);

    final areaScores = areas.map((area) {
      final areaScore = (overall - 8 + area.index * 2).clamp(30, 80);
      return AreaScore(
        area: area,
        score: areaScore,
        potentialGain: (100 - areaScore).clamp(10, 40),
      );
    }).toList();

    return MobilityScore(overall: overall, areaScores: areaScores);
  }
}
