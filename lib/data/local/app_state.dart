import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';

/// All app data stored locally — one JSON blob in SharedPreferences.
class AppState {
  AppState({
    this.profile = const UserProfile(),
    this.mobilityScore,
    this.sessionLogs = const [],
    this.currentDay = 1,
    this.lastActiveDate,
    this.lastCheckInDate,
    this.checkedInToday = false,
    this.prePainScore = 3,
    this.unlockedAchievements = const {},
    this.seenMilestones = const {},
    this.completedJourneyDays = const {},
    this.completedSessionsToday = const {},
    this.programStartDate,
    this.premiumPlan,
    this.premiumSince,
    this.postureAnalyses = const [],
    this.aiDailyPlan,
    this.workoutMood,
    this.moodSoundEnabled = true,
    this.notificationsEnabled = false,
    this.themeMode = 'system',
    this.localeCode = 'system',
  });

  UserProfile profile;
  MobilityScore? mobilityScore;
  List<SessionLog> sessionLogs;
  int currentDay;
  DateTime? lastActiveDate;
  DateTime? lastCheckInDate;
  bool checkedInToday;
  int prePainScore;
  Set<String> unlockedAchievements;
  Set<int> seenMilestones;
  Set<int> completedJourneyDays;
  Set<String> completedSessionsToday;
  DateTime? programStartDate;
  String? premiumPlan;
  DateTime? premiumSince;
  List<PostureAnalysis> postureAnalyses;
  AiDailyPlan? aiDailyPlan;
  String? workoutMood;
  bool moodSoundEnabled;
  bool notificationsEnabled;
  String themeMode;
  String localeCode;

  static String todayKey() {
    final n = DateTime.now();
    return '${n.year}-${n.month.toString().padLeft(2, '0')}-${n.day.toString().padLeft(2, '0')}';
  }

  Map<String, dynamic> toJson() => {
        'profile': _profileToJson(profile),
        'mobilityScore': mobilityScore == null
            ? null
            : _mobilityScoreToJson(mobilityScore!),
        'sessionLogs': sessionLogs.map(_sessionLogToJson).toList(),
        'currentDay': currentDay,
        'lastActiveDate': lastActiveDate?.toIso8601String(),
        'lastCheckInDate': lastCheckInDate?.toIso8601String(),
        'checkedInToday': checkedInToday,
        'prePainScore': prePainScore,
        'unlockedAchievements': unlockedAchievements.toList(),
        'seenMilestones': seenMilestones.toList(),
        'completedJourneyDays': completedJourneyDays.toList(),
        'completedSessionsToday': completedSessionsToday.toList(),
        'programStartDate': programStartDate?.toIso8601String(),
        'premiumPlan': premiumPlan,
        'premiumSince': premiumSince?.toIso8601String(),
        'postureAnalyses':
            postureAnalyses.map((a) => a.toJson()).toList(),
        'aiDailyPlan': aiDailyPlan?.toJson(),
        'workoutMood': workoutMood,
        'moodSoundEnabled': moodSoundEnabled,
        'notificationsEnabled': notificationsEnabled,
        'themeMode': themeMode,
        'localeCode': localeCode,
      };

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      profile: _profileFromJson(json['profile'] as Map<String, dynamic>? ?? {}),
      mobilityScore: json['mobilityScore'] != null
          ? _mobilityScoreFromJson(json['mobilityScore'] as Map<String, dynamic>)
          : null,
      sessionLogs: (json['sessionLogs'] as List<dynamic>? ?? [])
          .map((e) => _sessionLogFromJson(e as Map<String, dynamic>))
          .toList(),
      currentDay: json['currentDay'] as int? ?? 1,
      lastActiveDate: _parseDate(json['lastActiveDate'] as String?),
      lastCheckInDate: _parseDate(json['lastCheckInDate'] as String?),
      checkedInToday: json['checkedInToday'] as bool? ?? false,
      prePainScore: json['prePainScore'] as int? ?? 3,
      unlockedAchievements:
          (json['unlockedAchievements'] as List<dynamic>? ?? [])
              .map((e) => e as String)
              .toSet(),
      seenMilestones: (json['seenMilestones'] as List<dynamic>? ?? [])
          .map((e) => e as int)
          .toSet(),
      completedJourneyDays:
          (json['completedJourneyDays'] as List<dynamic>? ?? [])
              .map((e) => e as int)
              .toSet(),
      completedSessionsToday:
          (json['completedSessionsToday'] as List<dynamic>? ?? [])
              .map((e) => e as String)
              .toSet(),
      programStartDate: _parseDate(json['programStartDate'] as String?),
      premiumPlan: json['premiumPlan'] as String?,
      premiumSince: _parseDate(json['premiumSince'] as String?),
      postureAnalyses: (json['postureAnalyses'] as List<dynamic>? ?? [])
          .map((e) => PostureAnalysis.fromJson(e as Map<String, dynamic>))
          .toList(),
      aiDailyPlan: json['aiDailyPlan'] != null
          ? AiDailyPlan.fromJson(json['aiDailyPlan'] as Map<String, dynamic>)
          : null,
      workoutMood: json['workoutMood'] as String?,
      moodSoundEnabled: json['moodSoundEnabled'] as bool? ?? true,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? false,
      themeMode: json['themeMode'] as String? ?? 'system',
      localeCode: json['localeCode'] as String? ?? 'system',
    );
  }

  static DateTime? _parseDate(String? iso) =>
      iso == null ? null : DateTime.tryParse(iso);

  static Map<String, dynamic> _profileToJson(UserProfile p) => {
        'name': p.name,
        'painAreas': p.painAreas.map((a) => a.name).toList(),
        'sittingHours': p.sittingHours?.name,
        'preferredBreakTimes': p.preferredBreakTimes.map((t) => t.name).toList(),
        'goals': p.goals.map((g) => g.name).toList(),
        'reminderMinutes': p.reminderMinutes,
        'smartReminders': p.smartReminders,
        'onboardingComplete': p.onboardingComplete,
        'streakDays': p.streakDays,
        'mobilityPoints': p.mobilityPoints,
        'isPremium': p.isPremium,
      };

  static UserProfile _profileFromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] as String? ?? 'there',
      painAreas: (json['painAreas'] as List<dynamic>? ?? [])
          .map((e) => PainArea.values.byName(e as String))
          .toSet(),
      sittingHours: json['sittingHours'] != null
          ? SittingHours.values.byName(json['sittingHours'] as String)
          : null,
      preferredBreakTimes:
          (json['preferredBreakTimes'] as List<dynamic>? ?? [])
              .map((e) => BreakTime.values.byName(e as String))
              .toSet(),
      goals: _goalsFromJson(json),
      reminderMinutes: json['reminderMinutes'] as int? ?? 45,
      smartReminders: json['smartReminders'] as bool? ?? true,
      onboardingComplete: json['onboardingComplete'] as bool? ?? false,
      streakDays: json['streakDays'] as int? ?? 0,
      mobilityPoints: json['mobilityPoints'] as int? ?? 0,
      isPremium: json['isPremium'] as bool? ?? false,
    );
  }

  static Set<UserGoal> _goalsFromJson(Map<String, dynamic> json) {
    final goalsJson = json['goals'] as List<dynamic>?;
    if (goalsJson != null) {
      return goalsJson.map((e) => UserGoal.values.byName(e as String)).toSet();
    }
    final legacyGoal = json['goal'] as String?;
    if (legacyGoal != null) {
      return {UserGoal.values.byName(legacyGoal)};
    }
    return {};
  }

  static Map<String, dynamic> _mobilityScoreToJson(MobilityScore s) => {
        'overall': s.overall,
        'areaScores': s.areaScores
            .map(
              (a) => {
                'area': a.area.name,
                'score': a.score,
                'potentialGain': a.potentialGain,
              },
            )
            .toList(),
      };

  static MobilityScore _mobilityScoreFromJson(Map<String, dynamic> json) {
    return MobilityScore(
      overall: json['overall'] as int,
      areaScores: (json['areaScores'] as List<dynamic>)
          .map(
            (e) => AreaScore(
              area: PainArea.values.byName((e as Map)['area'] as String),
              score: e['score'] as int,
              potentialGain: e['potentialGain'] as int,
            ),
          )
          .toList(),
    );
  }

  static Map<String, dynamic> _sessionLogToJson(SessionLog log) => {
        'sessionId': log.sessionId,
        'completedAt': log.completedAt.toIso8601String(),
        'durationMinutes': log.durationMinutes,
        'prePainScore': log.prePainScore,
        'postPainScore': log.postPainScore,
        'mobilityPointsEarned': log.mobilityPointsEarned,
      };

  static SessionLog _sessionLogFromJson(Map<String, dynamic> json) {
    return SessionLog(
      sessionId: json['sessionId'] as String,
      completedAt: DateTime.parse(json['completedAt'] as String),
      durationMinutes: json['durationMinutes'] as int,
      prePainScore: json['prePainScore'] as int,
      postPainScore: json['postPainScore'] as int,
      mobilityPointsEarned: json['mobilityPointsEarned'] as int,
    );
  }
}
