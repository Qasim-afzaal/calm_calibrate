import 'package:calm_calibrate/app/router.dart';
import 'package:calm_calibrate/core/theme/app_theme.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:flutter/material.dart';

class CalmCalibrateApp extends StatefulWidget {
  const CalmCalibrateApp({super.key});

  @override
  State<CalmCalibrateApp> createState() => _CalmCalibrateAppState();
}

class _CalmCalibrateAppState extends State<CalmCalibrateApp> {
  late final _router = createRouter();
  late ThemeMode _themeMode = AppCache.instance.themeMode;

  @override
  void initState() {
    super.initState();
    AppCache.instance.addListener(_onCacheChanged);
  }

  @override
  void dispose() {
    AppCache.instance.removeListener(_onCacheChanged);
    super.dispose();
  }

  void _onCacheChanged() {
    final next = AppCache.instance.themeMode;
    if (next != _themeMode) {
      setState(() => _themeMode = next);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CalmCalibrate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      routerConfig: _router,
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        // Keep layouts stable when system text size is very large.
        final scale = mq.textScaler.scale(1).clamp(0.9, 1.12);
        return MediaQuery(
          data: mq.copyWith(textScaler: TextScaler.linear(scale)),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
