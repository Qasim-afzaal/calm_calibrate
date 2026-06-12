import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_event.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    UserRepository? userRepository,
    SessionRepository? sessionRepository,
  })  : _userRepository = userRepository ?? MockUserRepository.instance,
        _sessionRepository = sessionRepository ?? MockSessionRepository.instance,
        super(const HomeState()) {
    on<HomeLoadRequested>(_onLoad);
    on<HomeRefreshRequested>(_onLoad);
  }

  final UserRepository _userRepository;
  final SessionRepository _sessionRepository;

  Future<void> _onLoad(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final profile = _userRepository.profile;
    final sessions = _sessionRepository.getTodaySessions(profile);
    emit(
      state.copyWith(
        profile: profile,
        sessions: sessions,
        nextBreakMinutes: profile.reminderMinutes,
        isLoading: false,
      ),
    );
  }
}
