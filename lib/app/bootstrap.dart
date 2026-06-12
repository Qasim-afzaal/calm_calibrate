import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/local/local_storage.dart';

/// Initializes local cache before the app runs.
class AppBootstrap {
  static Future<void> init() async {
    await LocalStorage.init();
    await AppCache.instance.load();
  }
}
