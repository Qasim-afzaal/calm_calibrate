import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/workout_mood.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';

/// Mood-matched soundscapes for Pro sessions (UI + cache; wire audio later).
class MoodSoundService {
  MoodSoundService._();
  static final MoodSoundService instance = MoodSoundService._();

  final _cache = AppCache.instance;

  WorkoutMood? get selectedMood => WorkoutMood.fromKey(_cache.workoutMood);
  bool get soundEnabled => _cache.moodSoundEnabled;

  WorkoutMood moodForPainScore(int painScore) {
    if (painScore >= 4) return WorkoutMood.sore;
    if (painScore >= 3) return WorkoutMood.stressed;
    if (painScore <= 2) return WorkoutMood.calm;
    return WorkoutMood.focused;
  }

  Future<void> selectMood(WorkoutMood mood) async {
    await _cache.saveWorkoutMood(mood.name);
  }

  Future<void> setSoundEnabled(bool enabled) async {
    await _cache.setMoodSoundEnabled(enabled);
  }

  String? activeSoundscapeLabel() {
    if (!SubscriptionRepository.instance.hasProAccess) return null;
    if (!soundEnabled) return null;
    return selectedMood?.soundscape;
  }
}
