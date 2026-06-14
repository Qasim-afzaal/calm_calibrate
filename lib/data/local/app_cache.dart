import 'package:calm_calibrate/data/calculators/session_progress_calculator.dart';
import 'package:calm_calibrate/data/local/app_state.dart';
import 'package:calm_calibrate/data/local/database/app_database.dart';
import 'package:calm_calibrate/data/local/database/legacy_importer.dart';
import 'package:calm_calibrate/data/local/database/state_persistence.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calm_calibrate/data/models/engagement_journey.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/services/reminder_notification_service.dart';

/// Central cache — loads on startup, saves after every change.
class AppCache extends ChangeNotifier {
  AppCache._();
  static final AppCache instance = AppCache._();

  late AppState _state;
  bool _loaded = false;

  AppState get state {
    assert(_loaded, 'AppCache not loaded');
    return _state;
  }

  Future<void> load() async {
    final db = AppDatabase.instance;
    await LegacyImporter.runIfNeeded(db);
    _state = await StatePersistence(db).load();
    _handleNewDay();
    _loaded = true;
    await persist();
  }

  Future<void> persist() async {
    await StatePersistence(AppDatabase.instance).save(_state);
    notifyListeners();
  }

  Future<void> reset() async {
    _state = AppState();
    await persist();
  }

  /// Clears singleton state between tests.
  @visibleForTesting
  static Future<void> resetForTesting() async {
    instance._loaded = false;
    await AppDatabase.closeInstance();
  }

  // ── Day / engagement ──────────────────────────────────────────────

  void _handleNewDay() {
    final today = _dateOnly(DateTime.now());
    final last = _state.lastActiveDate == null
        ? null
        : _dateOnly(_state.lastActiveDate!);

    if (last != null && today.isAfter(last)) {
      if (_state.completedJourneyDays.contains(_state.currentDay)) {
        if (_state.currentDay < 30) _state.currentDay++;
      }
      _state.checkedInToday = false;
      _state.completedSessionsToday = {};
    }

    final checkInDate = _state.lastCheckInDate == null
        ? null
        : _dateOnly(_state.lastCheckInDate!);
    if (checkInDate == null ||
        checkInDate.year != today.year ||
        checkInDate.month != today.month ||
        checkInDate.day != today.day) {
      _state.checkedInToday = false;
    }
  }

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  int get currentDay => _state.currentDay;
  JourneyDay? get todayPlan => JourneyPlan.resolve(_state.currentDay);

  bool get shouldShowCheckIn =>
      _state.profile.onboardingComplete &&
      _state.currentDay >= 2 &&
      !_state.checkedInToday;

  bool get checkedInToday => _state.checkedInToday;

  bool isDayCompleted(int day) =>
      day < _state.currentDay ||
      _state.completedJourneyDays.contains(day);

  bool isDayCurrent(int day) => day == _state.currentDay;

  void recordCheckIn({required int painScore}) {
    _state.prePainScore = painScore;
    _state.checkedInToday = true;
    _state.lastCheckInDate = DateTime.now();
    _touchActivity();
    persist();
  }

  void completeSession({required String sessionId}) {
    _touchActivity();
    _state.completedSessionsToday = {
      ..._state.completedSessionsToday,
      sessionId,
    };
    _state.completedJourneyDays = {
      ..._state.completedJourneyDays,
      _state.currentDay,
    };
    _unlock('first_break');
    if (_state.profile.streakDays >= 3) _unlock('streak_3');
    if (_state.profile.streakDays >= 14) _unlock('streak_14');
    if (_state.currentDay >= 7) _unlock('week_1');
    if (_state.currentDay >= 30) _unlock('graduate_30');
    persist();
  }

  void markMilestoneSeen(int day) {
    _state.seenMilestones = {..._state.seenMilestones, day};
    persist();
  }

  void advanceDay() {
    if (_state.currentDay < 30) {
      _state.currentDay++;
      _state.checkedInToday = false;
      _state.completedSessionsToday = {};
      persist();
    }
  }

  void simulateDay(int day) {
    _state.currentDay = day.clamp(1, 30);
    _state.checkedInToday = false;
    persist();
  }

  JourneyDay? get pendingMilestone {
    final m = JourneyPlan.milestoneForDay(_state.currentDay);
    if (m != null && !_state.seenMilestones.contains(m.day)) return m;
    return null;
  }

  List<Achievement> get achievements {
    return Achievements.all
        .map(
          (a) => a.copyWith(
            isUnlocked: _state.unlockedAchievements.contains(a.id) ||
                _state.currentDay >= a.unlockedDay,
          ),
        )
        .toList();
  }

  void _touchActivity() {
    final today = DateTime.now();
    final last = _state.lastActiveDate;
    var streak = _state.profile.streakDays;

    if (last == null) {
      streak = 1;
    } else {
      final diff = _dateOnly(today).difference(_dateOnly(last)).inDays;
      if (diff == 0) {
        // same day — keep streak
      } else if (diff == 1) {
        streak++;
      } else {
        streak = 1;
      }
    }

    _state.lastActiveDate = today;
    _state.profile = _state.profile.copyWith(streakDays: streak);
    _state.programStartDate ??= today;
  }

  void _unlock(String id) {
    _state.unlockedAchievements = {..._state.unlockedAchievements, id};
  }

  // ── User profile ──────────────────────────────────────────────────

  UserProfile get profile => _state.profile;
  MobilityScore? get mobilityScore => _state.mobilityScore;
  List<SessionLog> get sessionLogs => List.unmodifiable(_state.sessionLogs);

  bool get notificationsEnabled => _state.notificationsEnabled;

  Future<void> setNotificationsEnabled(bool enabled) async {
    _state.notificationsEnabled = enabled;
    await persist();
    await _syncReminders();
  }

  Future<void> saveProfile(UserProfile profile) async {
    _state.profile = profile;
    await persist();
    await _syncReminders();
  }

  Future<void> _syncReminders() async {
    await ReminderNotificationService.instance.syncFromProfile(
      _state.profile,
      enabled: _state.notificationsEnabled,
    );
  }

  Future<void> saveMobilityScore(MobilityScore score) async {
    _state.mobilityScore = score;
    if (score.overall >= 60) _unlock('score_60');
    await persist();
  }

  Future<void> logSession(SessionLog log, {List<PainArea>? focusAreas}) async {
    _touchActivity();
    _state.sessionLogs = [..._state.sessionLogs, log];
    if (focusAreas != null && _state.mobilityScore != null) {
      _state.mobilityScore = SessionProgressCalculator.applySession(
        _state.mobilityScore!,
        log,
        focusAreas,
      );
    }
    _state.profile = _state.profile.copyWith(
      mobilityPoints: _state.profile.mobilityPoints + log.mobilityPointsEarned,
    );
    _state.completedSessionsToday = {
      ..._state.completedSessionsToday,
      log.sessionId,
    };
    _state.completedJourneyDays = {
      ..._state.completedJourneyDays,
      _state.currentDay,
    };
    _unlock('first_break');
    if (_state.profile.streakDays >= 3) _unlock('streak_3');
    if (_state.profile.streakDays >= 14) _unlock('streak_14');
    if (_state.currentDay >= 7) _unlock('week_1');
    if (_state.currentDay >= 30) _unlock('graduate_30');
    await persist();
  }

  bool isSessionCompletedToday(String sessionId) =>
      _state.completedSessionsToday.contains(sessionId);

  // ── Premium / subscription ────────────────────────────────────────

  PremiumPlan? get premiumPlan {
    final key = _state.premiumPlan;
    if (key == null) return null;
    if (key == 'yearly') return PremiumPlan.weekly;
    return PremiumPlan.values.byName(key);
  }

  DateTime? get premiumSince => _state.premiumSince;
  List<PostureAnalysis> get postureAnalyses =>
      List.unmodifiable(_state.postureAnalyses);
  PostureAnalysis? get latestPostureAnalysis =>
      _state.postureAnalyses.isEmpty ? null : _state.postureAnalyses.last;
  AiDailyPlan? get aiDailyPlan => _state.aiDailyPlan;
  String? get workoutMood => _state.workoutMood;
  bool get moodSoundEnabled => _state.moodSoundEnabled;

  ThemeMode get themeMode => switch (_state.themeMode) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };

  Future<void> setThemeMode(ThemeMode mode) async {
    _state.themeMode = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await persist();
  }

  Future<void> activatePremium({required PremiumPlan plan}) async {
    _state.premiumPlan = plan.storageKey;
    _state.premiumSince = DateTime.now();
    _state.profile = _state.profile.copyWith(isPremium: true);
    await persist();
  }

  Future<void> deactivatePremium() async {
    _state.premiumPlan = null;
    _state.premiumSince = null;
    _state.profile = _state.profile.copyWith(isPremium: false);
    await persist();
  }

  Future<void> savePostureAnalysis(PostureAnalysis analysis) async {
    _state.postureAnalyses = [..._state.postureAnalyses, analysis];
    await persist();
  }

  Future<void> saveAiDailyPlan(AiDailyPlan plan) async {
    _state.aiDailyPlan = plan;
    await persist();
  }

  Future<void> saveWorkoutMood(String moodKey) async {
    _state.workoutMood = moodKey;
    await persist();
  }

  Future<void> setMoodSoundEnabled(bool enabled) async {
    _state.moodSoundEnabled = enabled;
    await persist();
  }
}
