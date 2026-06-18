import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/core/widgets/score_gauge.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScoreResultScreen extends StatelessWidget {
  const ScoreResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] score_result loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    return Scaffold(
      body: BlocBuilder<AssessmentBloc, AssessmentState>(
        builder: (context, state) {
          final score = state.mobilityScore ??
              MockUserRepository.instance.mobilityScore;
          if (score == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ResponsiveScrollBody(
            child: Column(
              children: [
                SizedBox(height: m.onboardingSectionGap),
                Text(
                  'Your Mobility Score',
                  style: m.headlineStyle(Theme.of(context).textTheme),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  'Based on your posture scan and pain areas',
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: m.blockSpacing),
                ScoreGauge(score: score.overall),
                SizedBox(height: m.blockSpacing),
                ...score.areaScores.map(
                  (areaScore) => Padding(
                    padding: EdgeInsets.only(bottom: m.sectionGap + 4),
                    child: _AreaScoreRow(
                      label: areaScore.area.label,
                      score: areaScore.score,
                      gain: areaScore.potentialGain,
                    ),
                  ),
                ),
                SizedBox(height: m.onboardingSectionGap),
                PrimaryButton(
                  label: 'See My Plan',
                  onPressed: () => context.push('/onboarding/plan'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AreaScoreRow extends StatelessWidget {
  const _AreaScoreRow({
    required this.label,
    required this.score,
    required this.gain,
  });

  final String label;
  final int score;
  final int gain;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: c.textPrimary,
              ),
            ),
          ),
          Text(
            '$score',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: c.textPrimary,
            ),
          ),
          SizedBox(width: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: c.successLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_upward, size: 14, color: c.success),
                Text(
                  '+$gain',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: c.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
