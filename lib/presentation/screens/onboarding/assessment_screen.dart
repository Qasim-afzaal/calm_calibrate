import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/data/calculators/mobility_score_calculator.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/assessment_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Redirects away from assessment when camera scan is disabled.
class AssessmentScreen extends StatefulWidget {
  AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  @override
  void initState() {
    super.initState();
    if (!AiFeatures.cameraScanEnabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _redirect());
    }
  }

  Future<void> _redirect() async {
    AppLogger.debug('assessment', 'camera off — estimating score from pain areas');
    await MobilityScoreCalculator.ensureEstimatedScore(
      MockUserRepository.instance,
    );
    if (!mounted) return;
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/onboarding/plan');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!AiFeatures.cameraScanEnabled) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return const AssessmentScanScreen();
  }
}
