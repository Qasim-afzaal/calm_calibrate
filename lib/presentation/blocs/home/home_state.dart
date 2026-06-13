import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.profile = const UserProfile(),
    this.sessions = const [],
    this.nextBreakMinutes = 12,
    this.isLoading = true,
  });

  final UserProfile profile;
  final List<ExerciseSession> sessions;
  final int nextBreakMinutes;
  final bool isLoading;

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  HomeState copyWith({
    UserProfile? profile,
    List<ExerciseSession>? sessions,
    int? nextBreakMinutes,
    bool? isLoading,
  }) {
    return HomeState(
      profile: profile ?? this.profile,
      sessions: sessions ?? this.sessions,
      nextBreakMinutes: nextBreakMinutes ?? this.nextBreakMinutes,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [profile, sessions, nextBreakMinutes, isLoading];
}
