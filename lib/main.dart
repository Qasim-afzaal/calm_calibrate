import 'package:calm_calibrate/app/app.dart';
import 'package:calm_calibrate/app/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
    debugPrint('[CalmCalibrate] main loaded'); // auth-check-debug
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrap.init();
  runApp(const CalmCalibrateApp());
}
