import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';

class WeeklyProgressCalculator {
  WeeklyProgressCalculator({
    required this.logs,
    required this.mobilityScore,
    required DateTime? programStartDate,
    required this.sessions,
    required this.profile,
  }) : _programStart = programStartDate ?? DateTime.now();

  final List<SessionLog> logs;
  final int? mobilityScore;
  final DateTime _programStart;
  final List<ExerciseSession> sessions;
  final UserProfile profile;

  WeeklyProgress calculate() {
    final currentScore = mobilityScore ?? 42;
    final beforeScore = (currentScore - logs.length * 2).clamp(30, currentScore);

    final weekLabels = List.generate(6, (i) => 'W${i + 1}');
    final mobilityScores = <double>[];

    for (var week = 0; week < 6; week++) {
      final weekEnd = _programStart.add(Duration(days: (week + 1) * 7));
      final cumulative =
          logs.where((l) => !l.completedAt.isAfter(weekEnd)).length;
      final projected = beforeScore + cumulative * 2.0;
      mobilityScores.add(projected.clamp(30, currentScore).toDouble());
    }

    if (logs.isNotEmpty) {
      mobilityScores[5] = currentScore.toDouble();
    }

    return WeeklyProgress(
      weekLabels: weekLabels,
      mobilityScores: mobilityScores,
      areaImprovements: _areaImprovements(),
      beforeScore: beforeScore,
      afterScore: currentScore,
      totalSessions: logs.length,
      totalMinutes: logs.fold(0, (sum, l) => sum + l.durationMinutes),
      averageRelief: _averageRelief(),
    );
  }

  Map<String, int> _areaImprovements() {
    final counts = <PainArea, int>{};
    for (final log in logs) {
      final session = sessions.cast<ExerciseSession?>().firstWhere(
            (s) => s?.id == log.sessionId,
            orElse: () => null,
          );
      if (session == null) continue;
      for (final area in session.focusAreas) {
        counts[area] = (counts[area] ?? 0) + 1;
      }
    }

    if (counts.isEmpty && profile.painAreas.isNotEmpty) {
      return {
        for (final area in profile.painAreas) area.label: 0,
      };
    }

    return {
      for (final entry in counts.entries)
        entry.key.label: (entry.value * 4).clamp(0, 28),
    };
  }

  double _averageRelief() {
    if (logs.isEmpty) return 0;
    final total = logs.fold(0, (sum, l) => sum + l.reliefScore);
    return total / logs.length;
  }
}
