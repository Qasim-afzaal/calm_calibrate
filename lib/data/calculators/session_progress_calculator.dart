import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';

/// How completed sessions affect mobility and area stats.
abstract final class SessionProgressCalculator {
  /// Points added to overall mobility after one session.
  static int mobilityBump(SessionLog log) {
    final relief = log.reliefScore.clamp(0, 4);
    final durationBonus = log.durationMinutes >= 5 ? 1 : 0;
    return relief + durationBonus;
  }

  /// Overall score after [logs], starting from onboarding [baseline].
  static int scoreAfterLogs(int baseline, List<SessionLog> logs) {
    final total = logs.fold(0, (sum, log) => sum + mobilityBump(log));
    return (baseline + total).clamp(30, 100);
  }

  /// Apply one session to stored mobility (updates matching focus areas).
  static MobilityScore applySession(
    MobilityScore current,
    SessionLog log,
    List<PainArea> focusAreas,
  ) {
    final bump = mobilityBump(log);
    final newOverall = (current.overall + bump).clamp(30, 100);

    final updatedAreas = current.areaScores.map((areaScore) {
      if (!focusAreas.contains(areaScore.area)) return areaScore;
      final areaBump = (bump * 0.75).round().clamp(1, bump);
      final newScore = (areaScore.score + areaBump).clamp(30, 100);
      return AreaScore(
        area: areaScore.area,
        score: newScore,
        potentialGain: (100 - newScore).clamp(5, 50),
      );
    }).toList();

    return MobilityScore(overall: newOverall, areaScores: updatedAreas);
  }

  /// Average pain relief (pre minus post) → improvement percent for UI.
  static int reliefToImprovementPercent(List<int> reliefScores) {
    if (reliefScores.isEmpty) return 0;
    final avg = reliefScores.reduce((a, b) => a + b) / reliefScores.length;
    return (avg * 8).round().clamp(0, 40);
  }
}
