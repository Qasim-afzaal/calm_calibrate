import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:equatable/equatable.dart';

class ProgressState extends Equatable {
  const ProgressState({
    this.profile = const UserProfile(),
    this.weeklyProgress,
    this.sessionLogs = const [],
    this.isLoading = true,
  });

  final UserProfile profile;
  final WeeklyProgress? weeklyProgress;
  final List<SessionLog> sessionLogs;
  final bool isLoading;

  int get totalRelief =>
      sessionLogs.fold(0, (sum, log) => sum + log.reliefScore);

  ProgressState copyWith({
    UserProfile? profile,
    WeeklyProgress? weeklyProgress,
    List<SessionLog>? sessionLogs,
    bool? isLoading,
  }) {
    return ProgressState(
      profile: profile ?? this.profile,
      weeklyProgress: weeklyProgress ?? this.weeklyProgress,
      sessionLogs: sessionLogs ?? this.sessionLogs,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [profile, weeklyProgress, sessionLogs, isLoading];
}
