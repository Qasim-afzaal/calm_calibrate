import 'dart:async';

import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_event.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc({
    SessionRepository? sessionRepository,
    UserRepository? userRepository,
  })  : _sessionRepository = sessionRepository ?? MockSessionRepository.instance,
        _userRepository = userRepository ?? MockUserRepository.instance,
        super(const WorkoutState()) {
    on<WorkoutSessionLoadRequested>(_onSessionLoad);
    on<WorkoutTimerTicked>(_onTimerTick);
    on<WorkoutPaused>(_onPaused);
    on<WorkoutResumed>(_onResumed);
    on<WorkoutNextStepRequested>(_onNextStep);
    on<WorkoutPreviousStepRequested>(_onPreviousStep);
    on<WorkoutSkipped>(_onSkipped);
    on<WorkoutPostPainScoreSet>(_onPostPainScoreSet);
  }

  final SessionRepository _sessionRepository;
  final UserRepository _userRepository;
  Timer? _timer;

  void _onSessionLoad(
    WorkoutSessionLoadRequested event,
    Emitter<WorkoutState> emit,
  ) {
    var session = _sessionRepository.getSessionById(event.sessionId);
    session ??= _sessionRepository.getSessionById('midday_break');
    if (session == null) return;

    final firstStep = session.steps.first;
    emit(
      WorkoutState(
        session: session,
        secondsRemaining: firstStep.durationSeconds,
        status: WorkoutStatus.active,
      ),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const WorkoutTimerTicked());
    });
  }

  Future<void> _onTimerTick(
    WorkoutTimerTicked event,
    Emitter<WorkoutState> emit,
  ) async {
    if (state.status != WorkoutStatus.active) return;

    if (state.secondsRemaining > 1) {
      emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
      return;
    }

    if (state.isLastStep) {
      await _completeWorkout(emit);
    } else {
      final nextIndex = state.currentStepIndex + 1;
      final nextStep = state.session!.steps[nextIndex];
      emit(
        state.copyWith(
          currentStepIndex: nextIndex,
          secondsRemaining: nextStep.durationSeconds,
        ),
      );
    }
  }

  void _onPaused(WorkoutPaused event, Emitter<WorkoutState> emit) {
    _timer?.cancel();
    emit(state.copyWith(status: WorkoutStatus.paused));
  }

  void _onResumed(WorkoutResumed event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(status: WorkoutStatus.active));
    _startTimer();
  }

  Future<void> _onNextStep(
    WorkoutNextStepRequested event,
    Emitter<WorkoutState> emit,
  ) async {
    if (state.session == null) return;
    if (state.isLastStep) {
      await _completeWorkout(emit);
      return;
    }
    final nextIndex = state.currentStepIndex + 1;
    final nextStep = state.session!.steps[nextIndex];
    emit(
      state.copyWith(
        currentStepIndex: nextIndex,
        secondsRemaining: nextStep.durationSeconds,
      ),
    );
  }

  void _onPreviousStep(
    WorkoutPreviousStepRequested event,
    Emitter<WorkoutState> emit,
  ) {
    if (state.currentStepIndex == 0 || state.session == null) return;
    final prevIndex = state.currentStepIndex - 1;
    final prevStep = state.session!.steps[prevIndex];
    emit(
      state.copyWith(
        currentStepIndex: prevIndex,
        secondsRemaining: prevStep.durationSeconds,
      ),
    );
  }

  void _onSkipped(WorkoutSkipped event, Emitter<WorkoutState> emit) {
    _timer?.cancel();
    emit(const WorkoutState());
  }

  Future<void> _completeWorkout(Emitter<WorkoutState> emit) async {
    _timer?.cancel();
    final session = state.session!;
    final points = session.durationMinutes * 5;
    await _userRepository.logSession(
      SessionLog(
        sessionId: session.id,
        completedAt: DateTime.now(),
        durationMinutes: session.durationMinutes,
        prePainScore: state.prePainScore,
        postPainScore: state.postPainScore,
        mobilityPointsEarned: points,
      ),
      focusAreas: session.focusAreas,
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: WorkoutStatus.completed,
        mobilityPointsEarned: points,
        secondsRemaining: 0,
      ),
    );
  }

  void _onPostPainScoreSet(
    WorkoutPostPainScoreSet event,
    Emitter<WorkoutState> emit,
  ) {
    emit(state.copyWith(postPainScore: event.score));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
