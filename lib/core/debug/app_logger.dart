import 'package:flutter/foundation.dart';

/// Debug-only logging — stripped in release builds via [kDebugMode].
abstract final class AppLogger {
  static void debug(String tag, String message) {
    if (kDebugMode) {
      debugPrint('[CalmCalibrate/$tag] $message');
    }
  }
}
