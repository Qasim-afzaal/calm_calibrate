import 'package:calm_calibrate/core/constants/screen_metrics.dart';
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
    final profile = MockUserRepository.instance.profile;
    final repo = MockSessionRepository.instance;
    final daily = repo.getTodaySessions(profile);
    final isPremium = SubscriptionRepository.instance.isPremium;

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
              'Sessions',
              style: m.headlineStyle(Theme.of(context).textTheme),
            ),
            SizedBox(height: m.onboardingTitleGap),
            Text(
              isPremium
                  ? 'Pro library unlocked · programs by area'
                  : 'Programs by pain area at your desk',
              style: TextStyle(color: c.textSecondary),
            ),
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _AreaFilterChip(
                    label: 'All',
                    selected: _filter == null,
                    onTap: () => setState(() => _filter = null),
                  ),
                  ...PainArea.values.map(
                    (a) => _AreaFilterChip(
                      label: a.label,
                      selected: _filter == a,
                      onTap: () => setState(() => _filter = a),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Today\'s plan',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...daily.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SessionCard(
                  icon: s.icon,
                  title: s.title,
                  subtitle: s.subtitle,
                  durationMinutes: s.durationMinutes,
                  isCompleted: s.isCompleted,
                  onTap: () => context.push('/pre-workout/${s.id}'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'All programs',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...programs.map(
              (s) {
                final locked = !isPremium;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SessionCard(
                    icon: s.icon,
                    title: s.title,
                    subtitle: s.subtitle,
                    durationMinutes: s.durationMinutes,
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
