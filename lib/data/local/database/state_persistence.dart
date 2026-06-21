import 'dart:convert';

import 'package:calm_calibrate/data/local/app_state.dart';
import 'package:calm_calibrate/data/local/database/app_database.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:drift/drift.dart';

const _singletonId = 1;

/// Reads and writes [AppState] to SQLite via Drift.
class StatePersistence {
  StatePersistence(this._db);

  final AppDatabase _db;

  Future<AppState> load() async {
    await _ensureDefaults();

    final profileRow = await (_db.select(_db.userProfileRows)
          ..where((t) => t.id.equals(_singletonId)))
        .getSingle();
    final painAreas = await _db.select(_db.userPainAreaRows).get();
    final breakTimes = await _db.select(_db.userBreakTimeRows).get();
    final goals = await _db.select(_db.userGoalRows).get();
    final sessionRows = await _db.select(_db.sessionLogRows).get();
    final journeyRow = await (_db.select(_db.journeyMetaRows)
          ..where((t) => t.id.equals(_singletonId)))
        .getSingle();
    final completedDays = await _db.select(_db.journeyCompletedDayRows).get();
    final completedToday = await _db.select(_db.dailyCompletedSessionRows).get();
    final achievements = await _db.select(_db.unlockedAchievementRows).get();
    final milestones = await _db.select(_db.seenMilestoneRows).get();
    final settingsRow = await (_db.select(_db.appSettingsRows)
          ..where((t) => t.id.equals(_singletonId)))
        .getSingle();

    final mobilityRow = await (_db.select(_db.mobilityScoreRows)
          ..where((t) => t.id.equals(_singletonId)))
        .getSingleOrNull();
    final postureRows = await (_db.select(_db.postureAnalysisRows)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
    final aiPlanRow = await (_db.select(_db.aiDailyPlanRows)
          ..where((t) => t.id.equals(_singletonId)))
        .getSingleOrNull();

    final profile = UserProfile(
      name: profileRow.name,
      painAreas: painAreas.map((r) => PainArea.values.byName(r.area)).toSet(),
      sittingHours: profileRow.sittingHours == null
          ? null
          : SittingHours.values.byName(profileRow.sittingHours!),
      preferredBreakTimes: breakTimes
          .map((r) => BreakTime.values.byName(r.breakTime))
          .toSet(),
      goals: goals.map((r) => UserGoal.values.byName(r.goal)).toSet(),
      reminderMinutes: profileRow.reminderMinutes,
      smartReminders: profileRow.smartReminders,
      onboardingComplete: profileRow.onboardingComplete,
      streakDays: profileRow.streakDays,
      mobilityPoints: profileRow.mobilityPoints,
      isPremium: profileRow.isPremium,
    );

    return AppState(
      profile: profile,
      mobilityScore: mobilityRow == null ? null : _mobilityFromRow(mobilityRow),
      sessionLogs: sessionRows.map(_sessionLogFromRow).toList(),
      currentDay: journeyRow.currentDay,
      lastActiveDate: journeyRow.lastActiveDate,
      lastCheckInDate: journeyRow.lastCheckInDate,
      checkedInToday: journeyRow.checkedInToday,
      prePainScore: journeyRow.prePainScore,
      unlockedAchievements:
          achievements.map((r) => r.achievementId).toSet(),
      seenMilestones: milestones.map((r) => r.day).toSet(),
      completedJourneyDays: completedDays.map((r) => r.day).toSet(),
      completedSessionsToday:
          completedToday.map((r) => r.sessionId).toSet(),
      programStartDate: journeyRow.programStartDate,
      premiumPlan: settingsRow.premiumPlan,
      premiumSince: settingsRow.premiumSince,
      postureAnalyses: postureRows.map(_postureFromRow).toList(),
      aiDailyPlan: aiPlanRow == null ? null : _aiPlanFromRow(aiPlanRow),
      workoutMood: settingsRow.workoutMood,
      moodSoundEnabled: settingsRow.moodSoundEnabled,
      notificationsEnabled: settingsRow.notificationsEnabled,
      themeMode: settingsRow.themeMode,
    );
  }

  Future<void> save(AppState state) async {
    await _db.transaction(() async {
      await _db.into(_db.userProfileRows).insertOnConflictUpdate(
            UserProfileRowsCompanion.insert(
              id: const Value(_singletonId),
              name: Value(state.profile.name),
              sittingHours: Value(state.profile.sittingHours?.name),
              goal: const Value(null),
              reminderMinutes: Value(state.profile.reminderMinutes),
              smartReminders: Value(state.profile.smartReminders),
              onboardingComplete: Value(state.profile.onboardingComplete),
              streakDays: Value(state.profile.streakDays),
              mobilityPoints: Value(state.profile.mobilityPoints),
              isPremium: Value(state.profile.isPremium),
            ),
          );

      await _db.delete(_db.userPainAreaRows).go();
      for (final area in state.profile.painAreas) {
        await _db.into(_db.userPainAreaRows).insert(
              UserPainAreaRowsCompanion.insert(area: area.name),
            );
      }

      await _db.delete(_db.userBreakTimeRows).go();
      for (final time in state.profile.preferredBreakTimes) {
        await _db.into(_db.userBreakTimeRows).insert(
              UserBreakTimeRowsCompanion.insert(breakTime: time.name),
            );
      }

      await _db.delete(_db.userGoalRows).go();
      for (final goal in state.profile.goals) {
        await _db.into(_db.userGoalRows).insert(
              UserGoalRowsCompanion.insert(goal: goal.name),
            );
      }

      await _db.delete(_db.sessionLogRows).go();
      for (final log in state.sessionLogs) {
        await _db.into(_db.sessionLogRows).insert(
              SessionLogRowsCompanion.insert(
                id: _logId(log),
                sessionId: log.sessionId,
                completedAt: log.completedAt,
                durationMinutes: log.durationMinutes,
                prePainScore: log.prePainScore,
                postPainScore: log.postPainScore,
                mobilityPointsEarned: log.mobilityPointsEarned,
              ),
            );
      }

      await _db.into(_db.journeyMetaRows).insertOnConflictUpdate(
            JourneyMetaRowsCompanion.insert(
              id: const Value(_singletonId),
              currentDay: Value(state.currentDay),
              lastActiveDate: Value(state.lastActiveDate),
              lastCheckInDate: Value(state.lastCheckInDate),
              checkedInToday: Value(state.checkedInToday),
              prePainScore: Value(state.prePainScore),
              programStartDate: Value(state.programStartDate),
            ),
          );

      await _db.delete(_db.journeyCompletedDayRows).go();
      for (final day in state.completedJourneyDays) {
        await _db.into(_db.journeyCompletedDayRows).insert(
              JourneyCompletedDayRowsCompanion.insert(day: Value(day)),
            );
      }

      await _db.delete(_db.dailyCompletedSessionRows).go();
      for (final sessionId in state.completedSessionsToday) {
        await _db.into(_db.dailyCompletedSessionRows).insert(
              DailyCompletedSessionRowsCompanion.insert(sessionId: sessionId),
            );
      }

      await _db.delete(_db.unlockedAchievementRows).go();
      for (final id in state.unlockedAchievements) {
        await _db.into(_db.unlockedAchievementRows).insert(
              UnlockedAchievementRowsCompanion.insert(achievementId: id),
            );
      }

      await _db.delete(_db.seenMilestoneRows).go();
      for (final day in state.seenMilestones) {
        await _db.into(_db.seenMilestoneRows).insert(
              SeenMilestoneRowsCompanion.insert(day: Value(day)),
            );
      }

      if (state.mobilityScore != null) {
        await _db.into(_db.mobilityScoreRows).insertOnConflictUpdate(
              MobilityScoreRowsCompanion.insert(
                id: const Value(_singletonId),
                overall: state.mobilityScore!.overall,
                areaScoresJson: jsonEncode(
                  state.mobilityScore!.areaScores
                      .map(
                        (a) => {
                          'area': a.area.name,
                          'score': a.score,
                          'potentialGain': a.potentialGain,
                        },
                      )
                      .toList(),
                ),
              ),
            );
      } else {
        await (_db.delete(_db.mobilityScoreRows)
              ..where((t) => t.id.equals(_singletonId)))
            .go();
      }

      await _db.delete(_db.postureAnalysisRows).go();
      for (final analysis in state.postureAnalyses) {
        await _db.into(_db.postureAnalysisRows).insert(
              PostureAnalysisRowsCompanion.insert(
                id: analysis.id,
                createdAt: analysis.createdAt,
                issuesJson: jsonEncode(analysis.issues),
                score: analysis.score,
                summary: analysis.summary,
                recommendationsJson: jsonEncode(analysis.recommendations),
                deskTipsJson: jsonEncode(analysis.deskTips),
              ),
            );
      }

      if (state.aiDailyPlan != null) {
        final plan = state.aiDailyPlan!;
        await _db.into(_db.aiDailyPlanRows).insertOnConflictUpdate(
              AiDailyPlanRowsCompanion.insert(
                id: const Value(_singletonId),
                generatedAt: plan.generatedAt,
                focus: plan.focus,
                morning: plan.morning,
                midday: plan.midday,
                evening: plan.evening,
                coachNote: plan.coachNote,
              ),
            );
      } else {
        await (_db.delete(_db.aiDailyPlanRows)
              ..where((t) => t.id.equals(_singletonId)))
            .go();
      }

      await _db.into(_db.appSettingsRows).insertOnConflictUpdate(
            AppSettingsRowsCompanion.insert(
              id: const Value(_singletonId),
              themeMode: Value(state.themeMode),
              workoutMood: Value(state.workoutMood),
              moodSoundEnabled: Value(state.moodSoundEnabled),
              notificationsEnabled: Value(state.notificationsEnabled),
              premiumPlan: Value(state.premiumPlan),
              premiumSince: Value(state.premiumSince),
            ),
          );
    });
  }

  Future<void> _ensureDefaults() async {
    await _db.into(_db.userProfileRows).insertOnConflictUpdate(
          UserProfileRowsCompanion.insert(id: const Value(_singletonId)),
        );
    await _db.into(_db.journeyMetaRows).insertOnConflictUpdate(
          JourneyMetaRowsCompanion.insert(id: const Value(_singletonId)),
        );
    await _db.into(_db.appSettingsRows).insertOnConflictUpdate(
          AppSettingsRowsCompanion.insert(id: const Value(_singletonId)),
        );
  }

  String _logId(SessionLog log) =>
      '${log.sessionId}_${log.completedAt.millisecondsSinceEpoch}';

  SessionLog _sessionLogFromRow(SessionLogRow row) => SessionLog(
        sessionId: row.sessionId,
        completedAt: row.completedAt,
        durationMinutes: row.durationMinutes,
        prePainScore: row.prePainScore,
        postPainScore: row.postPainScore,
        mobilityPointsEarned: row.mobilityPointsEarned,
      );

  MobilityScore _mobilityFromRow(MobilityScoreRow row) {
    final areas = (jsonDecode(row.areaScoresJson) as List<dynamic>)
        .map(
          (e) => AreaScore(
            area: PainArea.values.byName((e as Map)['area'] as String),
            score: e['score'] as int,
            potentialGain: e['potentialGain'] as int,
          ),
        )
        .toList();
    return MobilityScore(overall: row.overall, areaScores: areas);
  }

  PostureAnalysis _postureFromRow(PostureAnalysisRow row) => PostureAnalysis(
        id: row.id,
        createdAt: row.createdAt,
        issues: (jsonDecode(row.issuesJson) as List<dynamic>).cast<String>(),
        score: row.score,
        summary: row.summary,
        recommendations:
            (jsonDecode(row.recommendationsJson) as List<dynamic>).cast<String>(),
        deskTips: (jsonDecode(row.deskTipsJson) as List<dynamic>).cast<String>(),
      );

  AiDailyPlan _aiPlanFromRow(AiDailyPlanRow row) => AiDailyPlan(
        generatedAt: row.generatedAt,
        focus: row.focus,
        morning: row.morning,
        midday: row.midday,
        evening: row.evening,
        coachNote: row.coachNote,
      );
}
