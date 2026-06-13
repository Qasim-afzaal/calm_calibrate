import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_event.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc({
    UserRepository? userRepository,
    SessionRepository? sessionRepository,
  })  : _userRepository = userRepository ?? MockUserRepository.instance,
        _sessionRepository = sessionRepository ?? MockSessionRepository.instance,
        super(const ProgressState()) {
    on<ProgressLoadRequested>(_onLoad);
  }

  final UserRepository _userRepository;
  final SessionRepository _sessionRepository;

  Future<void> _onLoad(
    ProgressLoadRequested event,
    Emitter<ProgressState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final profile = _userRepository.profile;
    emit(
      state.copyWith(
        profile: profile,
        weeklyProgress: _sessionRepository.getWeeklyProgress(profile),
        sessionLogs: _userRepository.sessionLogs,
        isLoading: false,
      ),
    );
  }
}
