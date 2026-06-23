import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/local/local_storage.dart';
import 'package:calm_calibrate/data/services/reminder_notification_service.dart';

/// Initializes local cache before the app runs.
class AppBootstrap {
  static Future<void> init() async {
    AppLogger.debug('bootstrap', 'init start');
    await LocalStorage.init();
    await AppCache.instance.load();
    AppLogger.debug(
      'bootstrap',
      'cache loaded — onboardingComplete=${AppCache.instance.profile.onboardingComplete}',
    );
    await ReminderNotificationService.instance.init();
    if (AppCache.instance.notificationsEnabled) {
      await ReminderNotificationService.instance.syncFromProfile(
        AppCache.instance.profile,
        enabled: true,
      );
    }
  }
}
