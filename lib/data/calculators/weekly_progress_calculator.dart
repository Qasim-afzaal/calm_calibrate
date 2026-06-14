import 'package:calm_calibrate/data/calculators/session_progress_calculator.dart';
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
  }) : _programStart = _normalizeStart(programStartDate);

  final List<SessionLog> logs;
  final int? mobilityScore;
  final DateTime _programStart;
  final List<ExerciseSession> sessions;
  final UserProfile profile;

  static DateTime _normalizeStart(DateTime? date) {
    final start = date ?? DateTime.now();
    return DateTime(start.year, start.month, start.day);
  }

  WeeklyProgress calculate() {
    final baseline = mobilityScore ?? 42;
    final afterScore = SessionProgressCalculator.scoreAfterLogs(baseline, logs);
    final beforeScore = baseline;

    final weekLabels = List.generate(6, (i) => 'W${i + 1}');
    final mobilityScores = <double>[];

    for (var week = 0; week < 6; week++) {
      final weekEnd = _programStart.add(Duration(days: (week + 1) * 7));
      final logsThroughWeek = logs
          .where((log) => !log.completedAt.isAfter(weekEnd))
          .toList();
      mobilityScores.add(
        SessionProgressCalculator
            .scoreAfterLogs(baseline, logsThroughWeek)
            .toDouble(),
      );
    }

    return WeeklyProgress(
      weekLabels: weekLabels,
      mobilityScores: mobilityScores,
      areaImprovements: _areaImprovements(),
      beforeScore: beforeScore,
      afterScore: afterScore,
      totalSessions: logs.length,
      totalMinutes: logs.fold(0, (sum, log) => sum + log.durationMinutes),
      averageRelief: _averageRelief(),
    );
  }

  Map<String, int> _areaImprovements() {
    final reliefByArea = <PainArea, List<int>>{};

    for (final log in logs) {
      final session = _sessionFor(log.sessionId);
      if (session == null) continue;
      final relief = log.reliefScore.clamp(0, 5);
      for (final area in session.focusAreas) {
        reliefByArea.putIfAbsent(area, () => []).add(relief);
      }
    }

    if (reliefByArea.isEmpty && profile.painAreas.isNotEmpty) {
      return {for (final area in profile.painAreas) area.label: 0};
    }

    return {
      for (final entry in reliefByArea.entries)
        entry.key.label: SessionProgressCalculator.reliefToImprovementPercent(
          entry.value,
        ),
    };
  }

  ExerciseSession? _sessionFor(String sessionId) {
    for (final session in sessions) {
      if (session.id == sessionId) return session;
    }
    return null;
  }

  double _averageRelief() {
    if (logs.isEmpty) return 0;
    final total = logs.fold(0, (sum, log) => sum + log.reliefScore);
    return total / logs.length;
  }
}
