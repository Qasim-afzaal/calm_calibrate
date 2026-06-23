import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/l10n/model_labels.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/presentation/widgets/premium/ai_weekly_insight_section.dart';
import 'package:calm_calibrate/core/widgets/score_gauge.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
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
  int _lastSessionCount = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] progress_screen loaded'); // auth-check-debug

    _lastSessionCount = AppCache.instance.sessionLogs.length;
    AppCache.instance.addListener(_onCacheUpdated);
    context.read<ProgressBloc>().add(const ProgressLoadRequested());
  }

  @override
  void dispose() {
    AppCache.instance.removeListener(_onCacheUpdated);
    super.dispose();
  }

  void _onCacheUpdated() {
    if (!mounted) return;
    final count = AppCache.instance.sessionLogs.length;
    if (count == _lastSessionCount) return;
    _lastSessionCount = count;
    context.read<ProgressBloc>().add(const ProgressRefreshRequested());
  }

  double _chartMinY(List<double> scores) {
    if (scores.isEmpty) return 30;
    final min = scores.reduce((a, b) => a < b ? a : b);
    return (min - 8).clamp(20, 90).toDouble();
  }

  double _chartMaxY(List<double> scores) {
    if (scores.isEmpty) return 70;
    final max = scores.reduce((a, b) => a > b ? a : b);
    return (max + 8).clamp(40, 100).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProgressBloc, ProgressState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            final weekly = state.weeklyProgress;
            if (weekly == null) {
              return Center(child: Text(l10n.noProgressDataYet));
            }

            return RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<ProgressBloc>();
                bloc.add(const ProgressRefreshRequested());
                await bloc.stream.firstWhere((s) => !s.isLoading);
              },
              child: ListView(
              padding: responsiveScreenPadding(context),
              children: [
                SizedBox(height: m.stackSpacing),
                Text(
                  l10n.weeklyProgressTitle,
                  style: m.headlineStyle(Theme.of(context).textTheme),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  weekly.totalSessions == 0
                      ? l10n.weeklyProgressEmptyHint
                      : '${l10n.weeklyProgressSummary(weekly.totalSessions, weekly.totalMinutes)}'
                          '${weekly.averageRelief > 0 ? ' · ${l10n.weeklyProgressAvgRelief(weekly.averageRelief.round())}' : ''}',
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: m.onboardingSectionGap),
                SizedBox(
                  height: m.chartHeight,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: (weekly.mobilityScores.length - 1).toDouble(),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              if (value != value.roundToDouble()) {
                                return const SizedBox.shrink();
                              }
                              final i = value.toInt();
                              if (i < 0 || i >= weekly.weekLabels.length) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  weekly.weekLabels[i],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: c.textMuted,
                                  ),
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
                      minY: _chartMinY(weekly.mobilityScores),
                      maxY: _chartMaxY(weekly.mobilityScores),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ScoreGauge(score: weekly.beforeScore, size: 88),
                    Icon(Icons.arrow_forward, color: c.textMuted, size: 18),
                    ScoreGauge(score: weekly.afterScore, size: 88),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(l10n.beforeLabel, style: TextStyle(color: c.textMuted)),
                    SizedBox(width: 40),
                    Text(l10n.nowLabel, style: TextStyle(color: c.textMuted)),
                  ],
                ),
                SizedBox(height: 28),
                Text(
                  l10n.areaImprovementsTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 12),
                ...weekly.areaImprovements.entries.map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: _ImprovementRow(
                      area: localizedPainAreaFromLabel(l10n, e.key),
                      percent: e.value,
                    ),
                  ),
                ),
                SizedBox(height: 28),
                if (SubscriptionRepository.instance.hasProAccess)
                  AiWeeklyInsightSection(
                    profile: state.profile,
                    totalSessions: weekly.totalSessions,
                    totalMinutes: weekly.totalMinutes,
                    averageRelief: weekly.averageRelief,
                    mobilityScore: weekly.afterScore,
                  )
                else if (SubscriptionRepository.instance.showSubscriptionUi)
                  AiWeeklyInsightLockedTeaser(),
                SizedBox(height: 80),
              ],
            ),
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
    final l10n = context.l10n;
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
            l10n.improvementPercent(percent),
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
