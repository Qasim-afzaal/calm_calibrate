import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/l10n/model_labels.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/presentation/widgets/feature_widgets.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyCheckInScreen extends StatefulWidget {
  DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  int _painScore = 3;
  final Set<PainArea> _areas = {};
  bool _eyesSelected = false;

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] daily_checkin loaded'); // auth-check-debug
    final c = context.appColors;
    final l10n = context.l10n;
    final repo = EngagementRepository.instance;
    final day = repo.currentDay;
    final sub = SubscriptionRepository.instance;

    final m = context.metrics;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: responsiveScreenPaddingAll(context),
          child: ResponsiveContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeSlideIn(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: c.primaryLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      l10n.dayCheckIn(day),
                      style: TextStyle(
                        color: c.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: m.stackSpacing),
                FadeSlideIn(
                  delay: Duration(milliseconds: 80),
                  child: Text(
                    l10n.howDoesBodyFeelToday,
                    style: m.headlineStyle(Theme.of(context).textTheme),
                  ),
                ),
                SizedBox(height: m.onboardingTitleGap),
                FadeSlideIn(
                  delay: Duration(milliseconds: 120),
                  child: Text(
                    l10n.checkInHelpsPickRoutine,
                    style: TextStyle(color: c.textSecondary),
                  ),
                ),
                SizedBox(height: m.blockSpacing),
                Text(
                  l10n.overallPainLevel,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: m.stackSpacing),
                FadeSlideIn(
                  delay: Duration(milliseconds: 160),
                  child: PainScalePicker(
                    value: _painScore,
                    onChanged: (v) => setState(() => _painScore = v),
                  ),
                ),
                SizedBox(height: m.blockSpacing),
                Text(
                  l10n.troubleAreasToday,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: m.sectionGap + 4),
                Wrap(
                  spacing: m.sectionGap,
                  runSpacing: m.sectionGap,
                  children: [
                    ...PainArea.values.map((area) {
                      final selected = _areas.contains(area);
                      return FilterChip(
                        label: Text(area.localized(l10n)),
                        selected: selected,
                        onSelected: (_) {
                          setState(() {
                            if (selected) {
                              _areas.remove(area);
                            } else {
                              _areas.add(area);
                            }
                          });
                        },
                        selectedColor: c.primaryLight,
                        checkmarkColor: c.primary,
                      );
                    }),
                    FilterChip(
                      label: Text(l10n.troubleAreaEyes),
                      selected: _eyesSelected,
                      onSelected: (_) {
                        setState(() => _eyesSelected = !_eyesSelected);
                      },
                      selectedColor: c.primaryLight,
                      checkmarkColor: c.primary,
                    ),
                  ],
                ),
                SizedBox(height: m.onboardingSectionGap + 4),
                if (sub.hasProAccess)
                  AiPostureSection(compact: true)
                else if (sub.showSubscriptionUi)
                  AiPostureLockedTeaser(),
                SizedBox(height: m.onboardingSectionGap + 4),
                FadeSlideIn(
                  delay: Duration(milliseconds: 240),
                  child: AppButton(
                    label: l10n.continueToTodaysSession,
                    onPressed: () {
                      repo.recordCheckIn(painScore: _painScore);
                      context.go('/home');
                    },
                  ),
                ),
                SizedBox(height: m.onboardingBottomGap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
