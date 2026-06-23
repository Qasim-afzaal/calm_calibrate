import 'package:calm_calibrate/app/app.dart';
import 'package:calm_calibrate/app/bootstrap.dart';
import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  AppLogger.debug('main', 'starting');
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrap.init();
  AppLogger.debug('main', 'bootstrap complete — launching app');
  runApp(const CalmCalibrateApp());
}
