import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';

/// Repository contract — backed by local SQLite via AppCache.
abstract class UserRepository {
  UserProfile get profile;
  MobilityScore? get mobilityScore;
  List<SessionLog> get sessionLogs;

  Future<void> saveProfile(UserProfile profile);
  Future<void> saveMobilityScore(MobilityScore score);
  Future<void> logSession(SessionLog log, {List<PainArea>? focusAreas});
  Future<void> incrementStreak();
}

class CachedUserRepository implements UserRepository {
  CachedUserRepository._();
  static final CachedUserRepository instance = CachedUserRepository._();

  final _cache = AppCache.instance;

  @override
  UserProfile get profile => _cache.profile;

  @override
  MobilityScore? get mobilityScore => _cache.mobilityScore;

  @override
  List<SessionLog> get sessionLogs => _cache.sessionLogs;

  @override
  Future<void> saveProfile(UserProfile profile) {
    AppLogger.debug('user', 'saveProfile streak=${profile.streakDays}');
    return _cache.saveProfile(profile);
  }

  @override
  Future<void> saveMobilityScore(MobilityScore score) =>
      _cache.saveMobilityScore(score);

  @override
  Future<void> logSession(SessionLog log, {List<PainArea>? focusAreas}) {
    AppLogger.debug('user', 'logSession id=${log.sessionId} min=${log.durationMinutes}');
    return _cache.logSession(log, focusAreas: focusAreas);
  }

  @override
  Future<void> incrementStreak() async {
    // Streak is updated inside logSession / recordCheckIn via AppCache.
  }
}

/// Backward-compatible alias.
typedef MockUserRepository = CachedUserRepository;
