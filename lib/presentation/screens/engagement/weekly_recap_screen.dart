import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/core/widgets/score_gauge.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/data/services/ai_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeeklyRecapScreen extends StatefulWidget {
  WeeklyRecapScreen({super.key});

  @override
  State<WeeklyRecapScreen> createState() => _WeeklyRecapScreenState();
}

class _WeeklyRecapScreenState extends State<WeeklyRecapScreen> {
  String? _aiInsight;
  bool _loadingInsight = false;

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] weekly_recap loaded'); // auth-check-debug

    if (SubscriptionRepository.instance.hasProAccess && AiFeatures.llmEnabled) {
      _loadAiInsight();
    }
  }

  Future<void> _loadAiInsight() async {
    setState(() => _loadingInsight = true);
    final userRepo = MockUserRepository.instance;
    final sessionRepo = MockSessionRepository.instance;
    final profile = userRepo.profile;
    final weekly = sessionRepo.getWeeklyProgress(profile);
    final insight = await AiService.instance.generateWeeklyInsight(
      profile: profile,
      sessionCount: weekly.totalSessions,
      totalMinutes: weekly.totalMinutes,
      avgRelief: weekly.averageRelief,
      mobilityScore: weekly.afterScore,
    );
    if (mounted) {
      setState(() {
        _aiInsight = insight;
        _loadingInsight = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final l10n = context.l10n;
    final repo = EngagementRepository.instance;
    final weekNum = (repo.currentDay / 7).ceil();
    final sub = SubscriptionRepository.instance;
    final showProUi = sub.showSubscriptionUi;
    final hasProAccess = sub.hasProAccess;
    final weekly =
        MockSessionRepository.instance.getWeeklyProgress(
          MockUserRepository.instance.profile,
        );

    final m = context.metrics;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.weekRecapTitle(weekNum)),
      ),
      body: ListView(
        padding: responsiveScreenPaddingAll(context),
        children: [
          Text(
            l10n.yourWeekInReview,
            style: m.headlineStyle(Theme.of(context).textTheme)?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          SizedBox(height: m.onboardingTitleGap),
          Text(
            l10n.weekRecapSubtitle,
            style: TextStyle(color: c.textSecondary),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _RecapStat(
                label: l10n.recapSessions,
                value: '${weekly.totalSessions}',
              ),
              _RecapStat(
                label: l10n.recapStreak,
                value: l10n.statStreakValue(repo.streakDays),
              ),
              _RecapStat(
                label: l10n.recapMinutes,
                value: '${weekly.totalMinutes}',
              ),
            ],
          ),
          SizedBox(height: 28),
          SizedBox(
            height: 160,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      for (var i = 0; i < weekly.mobilityScores.length; i++)
                        FlSpot(
                          i.toDouble(),
                          weekly.mobilityScores[i],
                        ),
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
                maxY: 80,
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScoreGauge(score: weekly.beforeScore, size: 90),
              Icon(Icons.arrow_forward, color: c.textMuted),
              ScoreGauge(score: weekly.afterScore, size: 90),
            ],
          ),
          if (hasProAccess) ...[
            SizedBox(height: 28),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: c.primaryLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: c.primary.withValues(alpha: 0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, color: c.primary),
                      SizedBox(width: 8),
                      Text(
                        l10n.aiWeeklyInsightTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: c.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (_loadingInsight)
                    Center(child: CircularProgressIndicator())
                  else
                    Text(
                      _aiInsight ?? l10n.aiInsightEmpty,
                      style: TextStyle(height: 1.5),
                    ),
                ],
              ),
            ),
          ] else if (showProUi) ...[
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => context.push('/premium'),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: c.navy,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock_outline, color: Colors.white70),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.unlockAiWeeklyInsights,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.white54),
                  ],
                ),
              ),
            ),
          ],
          SizedBox(height: 32),
          PrimaryButton(
            label: l10n.backToHome,
            onPressed: () => context.go('/home'),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _RecapStat extends StatelessWidget {
  _RecapStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: c.primary,
          ),
        ),
        Text(label, style: TextStyle(color: c.textMuted)),
      ],
    );
  }
}
