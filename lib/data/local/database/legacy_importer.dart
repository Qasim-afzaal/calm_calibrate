import 'package:calm_calibrate/data/local/app_state.dart';
import 'package:calm_calibrate/data/local/database/app_database.dart';
import 'package:calm_calibrate/data/local/database/state_persistence.dart';
import 'package:calm_calibrate/data/local/local_storage.dart';

abstract final class MigrationKeys {
  static const sqliteMigrated = 'sqlite_migrated_v1';
}

/// One-time import from SharedPreferences JSON → SQLite.
class LegacyImporter {
  LegacyImporter._();

  static Future<void> runIfNeeded(AppDatabase db) async {
    final prefs = LocalStorage.instance;
    if (prefs.getString(MigrationKeys.sqliteMigrated) == 'true') return;

    final json = prefs.getJson(CacheKeys.appState);
    if (json != null) {
      final state = AppState.fromJson(json);
      await StatePersistence(db).save(state);
    }

    await prefs.setString(MigrationKeys.sqliteMigrated, 'true');
    await prefs.remove(CacheKeys.appState);
  }
}
