import 'package:calm_calibrate/core/branding/app_logo.dart';
import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/constants/app_durations.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/app_locales.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/widgets/premium/cancel_premium_flow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] profile_screen loaded'); // auth-check-debug
    final l10n = context.l10n;
    return ListenableBuilder(
      listenable: AppCache.instance,
      builder: (context, _) {
        final c = context.appColors;
        final profile = MockUserRepository.instance.profile;
        final score = MockUserRepository.instance.mobilityScore;
        final isPremium = SubscriptionRepository.instance.isPremium;
        final showProUi = SubscriptionRepository.instance.showSubscriptionUi;
        final m = context.metrics;

        final settingsTiles = <_SettingsTileData>[
          if (showProUi)
            _SettingsTileData(
              icon: isPremium
                  ? Icons.workspace_premium
                  : Icons.workspace_premium_outlined,
              title: isPremium ? l10n.proSubscription : l10n.upgradeToPro,
              subtitle: isPremium
                  ? '${SubscriptionRepository.instance.plan?.label ?? 'Trial'} · ${SubscriptionRepository.instance.trialDaysLeft}d trial left'
                  : l10n.proBenefitsSubtitle,
              onTap: () => isPremium
                  ? _showProManageSheet(context)
                  : context.push('/premium'),
            ),
          _SettingsTileData(
            icon: Icons.language_outlined,
            title: l10n.language,
            subtitle: appLocaleDisplayName(
              AppCache.instance.localeCode,
              l10n,
            ),
            onTap: () => _showLanguageSheet(context),
          ),
          _SettingsTileData(
            icon: Icons.dark_mode_outlined,
            title: l10n.appearance,
            subtitle: _themeLabel(context, AppCache.instance.themeMode),
            onTap: () => _showAppearanceSheet(context),
          ),
          _SettingsTileData(
            icon: Icons.notifications_outlined,
            title: l10n.reminders,
            subtitle: l10n.remindersEveryMinutes(profile.reminderMinutes),
            onTap: () => context.push('/settings/reminders'),
          ),
          _SettingsTileData(
            icon: Icons.map_outlined,
            title: l10n.journeyTitle,
            subtitle: l10n.journeySubtitle,
            onTap: () => context.push('/journey'),
          ),
          _SettingsTileData(
            icon: Icons.emoji_events_outlined,
            title: l10n.achievements,
            subtitle: l10n.achievementsSubtitle,
            onTap: () => context.push('/achievements'),
          ),
          if (AiFeatures.cameraScanEnabled)
            _SettingsTileData(
              icon: Icons.replay,
              title: l10n.retakeAssessment,
              subtitle: l10n.retakeAssessmentSubtitle,
              onTap: () => context.push('/onboarding/assessment'),
            ),
        ];

        return Scaffold(
          backgroundColor: c.background,
          body: Stack(
            children: [
              const _ProfileBackdrop(),
              SafeArea(
                child: ListView(
                  padding: responsiveScreenPadding(context),
                  children: [
                    SizedBox(height: m.stackSpacing),
                    FadeSlideIn(
                      child: Text(
                        l10n.profileTitle,
                        style: m.headlineStyle(Theme.of(context).textTheme),
                      ),
                    ),
                    SizedBox(height: m.onboardingSectionGap),
                    FadeSlideIn(
                      delay: AppDurations.staggerStep,
                      child: _ProfileHeroCard(
                        profile: profile,
                        score: score?.overall,
                        isPremium: showProUi && isPremium,
                      ),
                    ),
                    SizedBox(height: 24),
                    for (var i = 0; i < settingsTiles.length; i++)
                      FadeSlideIn(
                        delay: AppDurations.staggerStep * (i + 3),
                        offsetY: 16,
                        child: _SettingsTile(data: settingsTiles[i]),
                      ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProManageSheet(BuildContext context) {
    final l10n = context.l10n;
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final c = ctx.appColors;
        final sheetM = ctx.metrics;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              sheetM.horizontalPadding,
              12,
              sheetM.horizontalPadding,
              sheetM.onboardingBottomGap,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: c.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  l10n.proSubscription,
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: 4),
                Text(
                  l10n.trialDaysLeft(
                    SubscriptionRepository.instance.trialDaysLeft,
                  ),
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.star_outline, color: c.primary),
                  title: Text(l10n.viewProBenefits),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pop(ctx);
                    context.push('/premium');
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.cancel_outlined, color: c.primary),
                  title: Text(l10n.cancelFreeTrial),
                  subtitle: Text(l10n.returnToFreePlan),
                  onTap: () async {
                    Navigator.pop(ctx);
                    await cancelPremiumSubscription(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _themeLabel(BuildContext context, ThemeMode mode) {
    final l10n = context.l10n;
    return switch (mode) {
      ThemeMode.light => l10n.themeLight,
      ThemeMode.dark => l10n.themeDark,
      ThemeMode.system => l10n.themeSystem,
    };
  }

  void _showLanguageSheet(BuildContext context) {
    final l10n = context.l10n;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final c = ctx.appColors;
        final current = AppCache.instance.localeCode;
        final sheetM = ctx.metrics;
        final listMaxHeight = MediaQuery.sizeOf(ctx).height * 0.52;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              sheetM.horizontalPadding,
              12,
              sheetM.horizontalPadding,
              sheetM.onboardingBottomGap,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: c.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  l10n.language,
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: 8),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: listMaxHeight),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (final option in appLocaleOptions)
                        _ThemeOption(
                          label: option.code == localeSystemCode
                              ? appLocaleDisplayName(option.code, l10n)
                              : '${appLocaleDisplayName(option.code, l10n)} · ${option.nativeName}',
                          icon: Icons.translate,
                          selected: current == option.code,
                          onTap: () async {
                            await AppCache.instance.setLocaleCode(option.code);
                            if (ctx.mounted) Navigator.pop(ctx);
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  l10n.languageHint,
                  style: TextStyle(color: c.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAppearanceSheet(BuildContext context) {
    final l10n = context.l10n;
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final c = ctx.appColors;
        final current = AppCache.instance.themeMode;
        final sheetM = ctx.metrics;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              sheetM.horizontalPadding,
              12,
              sheetM.horizontalPadding,
              sheetM.onboardingBottomGap,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.appearance,
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: 8),
                _ThemeOption(
                  label: l10n.systemDefault,
                  icon: Icons.brightness_auto,
                  selected: current == ThemeMode.system,
                  onTap: () async {
                    await AppCache.instance.setThemeMode(ThemeMode.system);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
                _ThemeOption(
                  label: l10n.themeLight,
                  icon: Icons.light_mode_outlined,
                  selected: current == ThemeMode.light,
                  onTap: () async {
                    await AppCache.instance.setThemeMode(ThemeMode.light);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
                _ThemeOption(
                  label: l10n.themeDark,
                  icon: Icons.dark_mode_outlined,
                  selected: current == ThemeMode.dark,
                  onTap: () async {
                    await AppCache.instance.setThemeMode(ThemeMode.dark);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
                SizedBox(height: 8),
                Text(
                  l10n.appearanceHint,
                  style: TextStyle(color: c.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SettingsTileData {
  const _SettingsTileData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
}

class _ProfileBackdrop extends StatelessWidget {
  const _ProfileBackdrop();

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -20,
            child: _GlowOrb(
              size: 180,
              color: c.primary.withValues(alpha: 0.1),
            ),
          ),
          Positioned(
            top: 120,
            left: -40,
            child: _GlowOrb(
              size: 140,
              color: c.navy.withValues(alpha: 0.04),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _ProfileHeroCard extends StatelessWidget {
  const _ProfileHeroCard({
    required this.profile,
    required this.score,
    required this.isPremium,
  });

  final UserProfile profile;
  final int? score;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            c.surface,
            c.primaryLight.withValues(alpha: 0.45),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: c.primary.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: c.cardShadow,
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          CelebrationPop(
            child: PulseRing(
              active: profile.streakDays > 0,
              child: BreatheAnimation(
                child: const AppLogo(size: 72, iconSize: 40),
              ),
            ),
          ),
          const SizedBox(height: 14),
          FadeSlideIn(
            delay: const Duration(milliseconds: 120),
            offsetY: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profile.displayName,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: c.textPrimary,
                    letterSpacing: -0.3,
                  ),
                ),
                if (isPremium) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [c.primary, c.primary.withValues(alpha: 0.85)],
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: c.primary.withValues(alpha: 0.25),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'PRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (score != null) ...[
            const SizedBox(height: 10),
            FadeSlideIn(
              delay: const Duration(milliseconds: 180),
              offsetY: 8,
              child: _MobilityScoreBar(score: score!),
            ),
          ],
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AnimatedProfileStat(
                label: 'Streak',
                value: profile.streakDays,
                suffix: 'd',
                delay: const Duration(milliseconds: 220),
              ),
              _AnimatedProfileStat(
                label: 'Points',
                value: profile.mobilityPoints,
                suffix: '',
                delay: const Duration(milliseconds: 280),
              ),
              _AnimatedProfileStat(
                label: 'Reminders',
                value: profile.reminderMinutes,
                suffix: 'm',
                delay: const Duration(milliseconds: 340),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobilityScoreBar extends StatelessWidget {
  const _MobilityScoreBar({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final progress = (score / 100).clamp(0.0, 1.0);

    return Column(
      children: [
        Text(
          'Mobility Score: $score/100',
          style: TextStyle(
            color: c.textSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 6,
                backgroundColor: c.border,
                color: c.primary,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AnimatedProfileStat extends StatelessWidget {
  const _AnimatedProfileStat({
    required this.label,
    required this.value,
    required this.suffix,
    required this.delay,
  });

  final String label;
  final int value;
  final String suffix;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;

    return FadeSlideIn(
      delay: delay,
      offsetY: 12,
      child: TweenAnimationBuilder<int>(
        tween: IntTween(begin: 0, end: value),
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCubic,
        builder: (context, animated, _) {
          return Column(
            children: [
              Text(
                '$animated$suffix',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: c.textPrimary,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(fontSize: 12, color: c.textMuted),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: c.primary),
      title: Text(label),
      trailing: selected ? Icon(Icons.check, color: c.primary) : null,
      onTap: onTap,
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.data});

  final _SettingsTileData data;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ScaleTap(
        onTap: data.onTap,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: _SettingsIcon(icon: data.icon),
          title: Text(
            data.title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(data.subtitle),
          trailing: Icon(Icons.chevron_right, color: c.textMuted),
        ),
      ),
    );
  }
}

class _SettingsIcon extends StatelessWidget {
  const _SettingsIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            c.primaryLight,
            c.primaryLight.withValues(alpha: 0.55),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.primary.withValues(alpha: 0.1)),
      ),
      child: Icon(icon, color: c.primary),
    );
  }
}
