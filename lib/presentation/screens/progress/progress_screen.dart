import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/presentation/widgets/premium/ai_weekly_insight_section.dart';
import 'package:calm_calibrate/core/widgets/score_gauge.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_event.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] progress_screen loaded'); // auth-check-debug

    context.read<ProgressBloc>().add(const ProgressLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProgressBloc, ProgressState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            final weekly = state.weeklyProgress;
            if (weekly == null) {
              return Center(child: Text('No progress data yet'));
            }

            return ListView(
              padding: responsiveScreenPadding(context),
              children: [
                SizedBox(height: 16),
                Text(
                  'Weekly Progress',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 8),
                Text(
                  weekly.totalSessions == 0
                      ? 'Complete your first session to start tracking.'
                      : '${weekly.totalSessions} sessions · ${weekly.totalMinutes} min total'
                          '${weekly.averageRelief > 0 ? ' · avg relief +${weekly.averageRelief.toStringAsFixed(1)}' : ''}',
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final i = value.toInt();
                              if (i < 0 || i >= weekly.weekLabels.length) {
                                return SizedBox.shrink();
                              }
                              return Text(
                                weekly.weekLabels[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: c.textMuted,
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            for (var i = 0; i < weekly.mobilityScores.length; i++)
                              FlSpot(i.toDouble(), weekly.mobilityScores[i]),
                          ],
                          isCurved: true,
                          color: c.primary,
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: c.primary.withValues(alpha: 0.1),
                          ),
                        ),
                      ],
                      minY: 30,
                      maxY: 70,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ScoreGauge(score: weekly.beforeScore, size: 100),
                    Icon(Icons.arrow_forward, color: c.textMuted),
                    ScoreGauge(score: weekly.afterScore, size: 100),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Before', style: TextStyle(color: c.textMuted)),
                    SizedBox(width: 40),
                    Text('Now', style: TextStyle(color: c.textMuted)),
                  ],
                ),
                SizedBox(height: 28),
                Text(
                  'Area improvements',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 12),
                ...weekly.areaImprovements.entries.map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: _ImprovementRow(area: e.key, percent: e.value),
                  ),
                ),
                SizedBox(height: 28),
                if (SubscriptionRepository.instance.isPremium)
                  AiWeeklyInsightSection(
                    profile: state.profile,
                    totalSessions: weekly.totalSessions,
                    totalMinutes: weekly.totalMinutes,
                    averageRelief: weekly.averageRelief,
                    mobilityScore: weekly.afterScore,
                  )
                else
                  AiWeeklyInsightLockedTeaser(),
                SizedBox(height: 80),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ImprovementRow extends StatelessWidget {
  _ImprovementRow({required this.area, required this.percent});

  final String area;
  final int percent;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              area,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '+$percent%',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: c.success,
            ),
          ),
        ],
      ),
    );
  }
}
