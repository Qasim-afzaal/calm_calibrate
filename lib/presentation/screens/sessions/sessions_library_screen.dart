import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/content_l10n.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/l10n/model_labels.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/buttons/app_button.dart';
import 'package:calm_calibrate/core/widgets/cards/session_card.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionsLibraryScreen extends StatefulWidget {
  const SessionsLibraryScreen({super.key});

  @override
  State<SessionsLibraryScreen> createState() => _SessionsLibraryScreenState();
}

class _SessionsLibraryScreenState extends State<SessionsLibraryScreen> {
  PainArea? _filter;

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] sessions_library loaded'); // auth-check-debug
    final c = context.appColors;
    final l10n = context.l10n;
    final profile = MockUserRepository.instance.profile;
    final repo = MockSessionRepository.instance;
    final daily = repo.getTodaySessions(profile);
    final visibleDaily = _filter == null
        ? daily
        : daily
            .where((s) => CachedSessionRepository.sessionMatchesArea(s, _filter!))
            .toList();
    final hasProAccess = SubscriptionRepository.instance.hasProAccess;

    final programs = _filter == null
        ? repo.getPremiumPrograms()
        : repo
            .getPremiumPrograms()
            .where((s) => s.focusAreas.contains(_filter))
            .toList();

    final m = context.metrics;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: responsiveScreenPadding(context),
          children: [
            SizedBox(height: m.stackSpacing),
            Text(
              l10n.sessionsTitle,
              style: m.headlineStyle(Theme.of(context).textTheme),
            ),
            SizedBox(height: m.onboardingTitleGap),
            Text(
              hasProAccess
                  ? l10n.sessionsSubtitlePro
                  : l10n.sessionsSubtitleFree,
              style: TextStyle(color: c.textSecondary),
            ),
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _AreaFilterChip(
                    label: l10n.filterAll,
                    selected: _filter == null,
                    onTap: () => setState(() => _filter = null),
                  ),
                  ...PainArea.values.map(
                    (a) => _AreaFilterChip(
                      label: a.localized(l10n),
                      selected: _filter == a,
                      onTap: () {
                      AppLogger.debug('sessions_library', 'filter=${a.label}');
                      setState(() => _filter = a);
                    },
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.todaysPlan,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...visibleDaily.map(
              (s) {
                final session = localizeSession(l10n, s);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SessionCard(
                    icon: session.icon,
                    title: session.title,
                    subtitle: session.subtitle,
                    durationMinutes: session.durationMinutes,
                    isCompleted: session.isCompleted,
                    onTap: () => context.push('/pre-workout/${s.id}'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              l10n.allPrograms,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...programs.map(
              (s) {
                final session = localizeSession(l10n, s);
                final locked = !hasProAccess;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SessionCard(
                    icon: session.icon,
                    title: session.title,
                    subtitle: session.subtitle,
                    durationMinutes: session.durationMinutes,
                    isLocked: locked,
                    onTap: () {
                      if (locked) {
                        context.push('/premium');
                      } else {
                        context.push('/pre-workout/${s.id}');
                      }
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _AreaFilterChip extends StatelessWidget {
  const _AreaFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: FilterChip(
              label: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              selected: selected,
              onSelected: (_) => onTap(),
              selectedColor: c.primaryLight,
              checkmarkColor: c.primary,
              side: BorderSide(
                color: selected ? c.primary : c.border,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ),
      ),
    );
  }
}
