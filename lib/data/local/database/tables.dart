import 'package:drift/drift.dart';

/// Single-row user profile (id always 1).
class UserProfileRows extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withDefault(const Constant('there'))();
  TextColumn get sittingHours => text().nullable()();
  TextColumn get goal => text().nullable()();
  IntColumn get reminderMinutes => integer().withDefault(const Constant(45))();
  BoolColumn get smartReminders =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get onboardingComplete =>
      boolean().withDefault(const Constant(false))();
  IntColumn get streakDays => integer().withDefault(const Constant(0))();
  IntColumn get mobilityPoints => integer().withDefault(const Constant(0))();
  BoolColumn get isPremium => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class UserPainAreaRows extends Table {
  TextColumn get area => text()();

  @override
  Set<Column<Object>> get primaryKey => {area};
}

class UserBreakTimeRows extends Table {
  TextColumn get breakTime => text()();

  @override
  Set<Column<Object>> get primaryKey => {breakTime};
}

class UserGoalRows extends Table {
  TextColumn get goal => text()();

  @override
  Set<Column<Object>> get primaryKey => {goal};
}

class SessionLogRows extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  DateTimeColumn get completedAt => dateTime()();
  IntColumn get durationMinutes => integer()();
  IntColumn get prePainScore => integer()();
  IntColumn get postPainScore => integer()();
  IntColumn get mobilityPointsEarned => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// Single-row journey + engagement meta (id always 1).
class JourneyMetaRows extends Table {
  IntColumn get id => integer()();
  IntColumn get currentDay => integer().withDefault(const Constant(1))();
  DateTimeColumn get lastActiveDate => dateTime().nullable()();
  DateTimeColumn get lastCheckInDate => dateTime().nullable()();
  BoolColumn get checkedInToday =>
      boolean().withDefault(const Constant(false))();
  IntColumn get prePainScore => integer().withDefault(const Constant(3))();
  DateTimeColumn get programStartDate => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class JourneyCompletedDayRows extends Table {
  IntColumn get day => integer()();

  @override
  Set<Column<Object>> get primaryKey => {day};
}

class DailyCompletedSessionRows extends Table {
  TextColumn get sessionId => text()();

  @override
  Set<Column<Object>> get primaryKey => {sessionId};
}

class UnlockedAchievementRows extends Table {
  TextColumn get achievementId => text()();

  @override
  Set<Column<Object>> get primaryKey => {achievementId};
}

class SeenMilestoneRows extends Table {
  IntColumn get day => integer()();

  @override
  Set<Column<Object>> get primaryKey => {day};
}

/// Latest mobility assessment (single row, id = 1).
class MobilityScoreRows extends Table {
  IntColumn get id => integer()();
  IntColumn get overall => integer()();
  TextColumn get areaScoresJson => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class PostureAnalysisRows extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get issuesJson => text()();
  IntColumn get score => integer()();
  TextColumn get summary => text()();
  TextColumn get recommendationsJson => text()();
  TextColumn get deskTipsJson => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AiDailyPlanRows extends Table {
  IntColumn get id => integer()();
  DateTimeColumn get generatedAt => dateTime()();
  TextColumn get focus => text()();
  TextColumn get morning => text()();
  TextColumn get midday => text()();
  TextColumn get evening => text()();
  TextColumn get coachNote => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// App settings, subscription, preferences (single row, id = 1).
class AppSettingsRows extends Table {
  IntColumn get id => integer()();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  TextColumn get workoutMood => text().nullable()();
  BoolColumn get moodSoundEnabled =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get notificationsEnabled =>
      boolean().withDefault(const Constant(false))();
  TextColumn get premiumPlan => text().nullable()();
  DateTimeColumn get premiumSince => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
