import 'package:calm_calibrate/data/local/app_state.dart';
import 'package:calm_calibrate/data/local/database/app_database.dart';
import 'package:calm_calibrate/data/local/database/legacy_importer.dart';
import 'package:calm_calibrate/data/local/database/state_persistence.dart';
import 'package:calm_calibrate/data/local/local_storage.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppDatabase.enableTestMode();
    await AppDatabase.closeInstance();
    await LocalStorage.init();
  });

  tearDown(() async {
    await AppDatabase.closeInstance();
  });

  test('StatePersistence round-trips profile and session logs', () async {
    final db = AppDatabase.instance;
    final store = StatePersistence(db);

    final state = AppState(
      profile: UserProfile(
        name: 'Qasim',
        painAreas: {PainArea.neck},
        onboardingComplete: true,
        streakDays: 3,
      ),
      sessionLogs: [
        SessionLog(
          sessionId: 'morning_reset',
          completedAt: DateTime(2026, 6, 13, 9),
          durationMinutes: 3,
          prePainScore: 4,
          postPainScore: 2,
          mobilityPointsEarned: 10,
        ),
      ],
      currentDay: 5,
    );

    await store.save(state);
    final loaded = await store.load();

    expect(loaded.profile.name, 'Qasim');
    expect(loaded.profile.painAreas, {PainArea.neck});
    expect(loaded.profile.streakDays, 3);
    expect(loaded.currentDay, 5);
    expect(loaded.sessionLogs.length, 1);
    expect(loaded.sessionLogs.first.sessionId, 'morning_reset');
  });

  test('LegacyImporter migrates SharedPreferences JSON to SQLite', () async {
    final legacy = AppState(
      profile: const UserProfile(name: 'legacy', onboardingComplete: true),
      currentDay: 2,
    );
    await LocalStorage.instance.setJson(CacheKeys.appState, legacy.toJson());

    final db = AppDatabase.instance;
    await LegacyImporter.runIfNeeded(db);

    final loaded = await StatePersistence(db).load();
    expect(loaded.profile.name, 'legacy');
    expect(loaded.currentDay, 2);
    expect(LocalStorage.instance.getJson(CacheKeys.appState), isNull);
    expect(
      LocalStorage.instance.getString(MigrationKeys.sqliteMigrated),
      'true',
    );
  });
}
