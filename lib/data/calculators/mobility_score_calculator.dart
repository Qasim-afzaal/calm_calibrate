import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';

/// Estimates mobility score from onboarding pain areas (no camera / LLM).
class MobilityScoreCalculator {
  MobilityScoreCalculator._();

  static MobilityScore compute(Set<PainArea> painAreas) {
    const base = 72;
    final penalty = painAreas.length * 4;
    final overall = (base - penalty).clamp(35, 85);

    final areas = painAreas.isEmpty
        ? PainArea.values.take(3)
        : painAreas.take(3);

    final areaScores = areas.map((area) {
      final areaScore = (overall - 8 + area.index * 2).clamp(30, 80);
      return AreaScore(
        area: area,
        score: areaScore,
        potentialGain: (100 - areaScore).clamp(10, 40),
      );
    }).toList();

    return MobilityScore(overall: overall, areaScores: areaScores);
  }

  /// Saves an estimated score from the current profile if none exists yet.
  static Future<void> ensureEstimatedScore(UserRepository repo) async {
    if (repo.mobilityScore != null) return;
    await repo.saveMobilityScore(compute(repo.profile.painAreas));
  }
}
