import 'package:equatable/equatable.dart';

class SessionLog extends Equatable {
  const SessionLog({
    required this.sessionId,
    required this.completedAt,
    required this.durationMinutes,
    required this.prePainScore,
    required this.postPainScore,
    required this.mobilityPointsEarned,
  });

  final String sessionId;
  final DateTime completedAt;
  final int durationMinutes;
  final int prePainScore;
  final int postPainScore;
  final int mobilityPointsEarned;

  int get reliefScore => prePainScore - postPainScore;

  @override
  List<Object?> get props => [
        sessionId,
        completedAt,
        durationMinutes,
        prePainScore,
        postPainScore,
        mobilityPointsEarned,
      ];
}

class WeeklyProgress extends Equatable {
  const WeeklyProgress({
    required this.weekLabels,
    required this.mobilityScores,
    required this.areaImprovements,
    required this.beforeScore,
    required this.afterScore,
    this.totalSessions = 0,
    this.totalMinutes = 0,
    this.averageRelief = 0,
  });

  final List<String> weekLabels;
  final List<double> mobilityScores;
  final Map<String, int> areaImprovements;
  final int beforeScore;
  final int afterScore;
  final int totalSessions;
  final int totalMinutes;
  final double averageRelief;

  @override
  List<Object?> get props => [
        weekLabels,
        mobilityScores,
        areaImprovements,
        beforeScore,
        afterScore,
        totalSessions,
        totalMinutes,
        averageRelief,
      ];
}
