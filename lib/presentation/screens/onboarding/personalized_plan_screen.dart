import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/content_l10n.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalizedPlanScreen extends StatelessWidget {
  const PersonalizedPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] personalized_plan loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    final l10n = context.l10n;
    final profile = MockUserRepository.instance.profile;
    final sessions =
        MockSessionRepository.instance.getTodaySessions(profile);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.yourPlanAppBar),
      ),
      body: SafeArea(
        child: ResponsiveContent(
          child: Padding(
            padding: m.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.personalizedForYou,
                  style: m.headlineStyle(Theme.of(context).textTheme),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  _planSubtitle(l10n, profile),
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: m.onboardingSectionGap),
                Expanded(
                  child: ListView.separated(
                    itemCount: sessions.length,
                    separatorBuilder: (_, _) => SizedBox(height: m.sectionGap + 4),
                    itemBuilder: (context, index) {
                      return _SessionPlanCard(
                        session: localizeSession(l10n, sessions[index]),
                        l10n: l10n,
                      );
                    },
                  ),
                ),
                PrimaryButton(
                  label: l10n.startMyPlan,
                  onPressed: () async {
                    await MockUserRepository.instance.saveProfile(
                      profile.copyWith(onboardingComplete: true),
                    );
                    if (context.mounted) context.go('/home');
                  },
                ),
                SizedBox(height: m.onboardingBottomGap),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _planSubtitle(AppLocalizations l10n, UserProfile profile) {
    final areas = localizedPainAreaList(l10n, profile.painAreas);
    if (areas.isEmpty) return l10n.planSubtitleDefault;
    return l10n.planSubtitleFocused(areas);
  }
}

class _SessionPlanCard extends StatelessWidget {
  const _SessionPlanCard({required this.session, required this.l10n});

  final ExerciseSession session;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    return Container(
      padding: EdgeInsets.all(m.stackSpacing),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: c.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(session.icon, size: 24, color: c.primary),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: c.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  session.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: c.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: c.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              l10n.sessionDurationMin(session.durationMinutes),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: c.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
