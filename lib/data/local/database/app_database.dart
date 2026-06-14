import 'package:calm_calibrate/data/local/database/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  UserProfileRows,
  UserPainAreaRows,
  UserBreakTimeRows,
  SessionLogRows,
  JourneyMetaRows,
  JourneyCompletedDayRows,
  DailyCompletedSessionRows,
  UnlockedAchievementRows,
  SeenMilestoneRows,
  MobilityScoreRows,
  PostureAnalysisRows,
  AiDailyPlanRows,
  AppSettingsRows,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase._(super.executor);

  static AppDatabase? _instance;
  static bool _useMemory = false;

  /// Use in-memory SQLite for widget/unit tests.
  static void enableTestMode() {
    _useMemory = true;
    _instance?.close();
    _instance = null;
  }

  static AppDatabase get instance {
    _instance ??= AppDatabase._(_openConnection());
    return _instance!;
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(
              appSettingsRows,
              appSettingsRows.notificationsEnabled,
            );
          }
        },
      );

  static QueryExecutor _openConnection() {
    if (_useMemory) {
      return LazyDatabase(() async => NativeDatabase.memory());
    }
    return driftDatabase(name: 'calm_calibrate.db');
  }

  static Future<void> closeInstance() async {
    await _instance?.close();
    _instance = null;
  }
}
