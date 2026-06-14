import 'package:calm_calibrate/data/calculators/session_progress_calculator.dart';
import 'package:calm_calibrate/data/calculators/weekly_progress_calculator.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const profile = UserProfile(
    name: 'Alex',
    painAreas: {PainArea.neck, PainArea.shoulders},
  );

  final start = DateTime(2026, 1, 1);

  test('empty logs show baseline only', () {
    final result = WeeklyProgressCalculator(
      logs: const [],
      mobilityScore: 68,
      programStartDate: start,
      sessions: const [],
      profile: profile,
    ).calculate();

    expect(result.beforeScore, 68);
    expect(result.afterScore, 68);
    expect(result.totalSessions, 0);
    expect(result.averageRelief, 0);
    expect(result.mobilityScores.every((s) => s == 68), isTrue);
  });

  test('session bumps score from pain relief', () {
    final logs = [
      SessionLog(
        sessionId: 'morning_reset',
        completedAt: start.add(const Duration(days: 2)),
        durationMinutes: 3,
        prePainScore: 4,
        postPainScore: 3,
        mobilityPointsEarned: 15,
      ),
    ];

    expect(SessionProgressCalculator.mobilityBump(logs.first), 1);

    final result = WeeklyProgressCalculator(
      logs: logs,
      mobilityScore: 68,
      programStartDate: start,
      sessions: const [],
      profile: profile,
    ).calculate();

    expect(result.beforeScore, 68);
    expect(result.afterScore, 69);
    expect(result.totalSessions, 1);
    expect(result.totalMinutes, 3);
    expect(result.averageRelief, 1);
  });
}
