import 'package:calm_calibrate/core/animations/breathe_animation.dart';
import 'package:calm_calibrate/core/animations/fade_slide_in.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] splash_screen loaded'); // auth-check-debug

    Future<void>.delayed(Duration(milliseconds: 2200), () {
      if (!mounted) return;
      final onboardingDone = AppCache.instance.profile.onboardingComplete;
      if (onboardingDone) {
        final milestone = AppCache.instance.pendingMilestone;
        if (milestone != null) {
          context.go('/milestone/${milestone.day}');
        } else if (AppCache.instance.shouldShowCheckIn) {
          context.go('/check-in');
        } else {
          context.go('/home');
        }
      } else {
        context.go('/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Scaffold(
      backgroundColor: c.navy,
      body: Center(
        child: FadeSlideIn(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BreatheAnimation(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: c.primary,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(
                    Icons.self_improvement,
                    color: Colors.white,
                    size: 44,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'CalmCalibrate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Mobility for desk workers',
                style: TextStyle(color: Colors.white54, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
