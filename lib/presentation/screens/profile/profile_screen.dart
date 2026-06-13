import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/presentation/widgets/premium/cancel_premium_flow.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppCache.instance,
      builder: (context, _) {
        final c = context.appColors;
        final profile = MockUserRepository.instance.profile;
        final score = MockUserRepository.instance.mobilityScore;
        final isPremium = SubscriptionRepository.instance.isPremium;

        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: responsiveScreenPadding(context),
              children: [
                SizedBox(height: 16),
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: c.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: c.border),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: c.primaryLight,
                        child: Icon(Icons.person, size: 40, color: c.primary),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Desk Warrior',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          if (isPremium) ...[
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: c.primary,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
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
                      if (score != null)
                        Text(
                          'Mobility Score: ${score.overall}/100',
                          style: TextStyle(color: c.textSecondary),
                        ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _ProfileStat(
                            label: 'Streak',
                            value: '${profile.streakDays}d',
                          ),
                          _ProfileStat(
                            label: 'Points',
                            value: '${profile.mobilityPoints}',
                          ),
                          _ProfileStat(
                            label: 'Reminders',
                            value: '${profile.reminderMinutes}m',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                _SettingsTile(
                  icon: isPremium
                      ? Icons.workspace_premium
                      : Icons.workspace_premium_outlined,
                  title: isPremium ? 'Pro subscription' : 'Upgrade to Pro',
                  subtitle: isPremium
                      ? '${SubscriptionRepository.instance.plan?.label ?? 'Trial'} · ${SubscriptionRepository.instance.trialDaysLeft}d trial left'
                      : 'AI plans, posture scan & full library',
                  onTap: () => isPremium
                      ? _showProManageSheet(context)
                      : context.push('/premium'),
                ),
                _SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Appearance',
                  subtitle: _themeLabel(AppCache.instance.themeMode),
                  onTap: () => _showAppearanceSheet(context),
                ),
                _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Reminders',
                  subtitle: 'Every ${profile.reminderMinutes} min',
                  onTap: () => context.push('/settings/reminders'),
                ),
                _SettingsTile(
                  icon: Icons.map_outlined,
                  title: '30-Day Journey',
                  subtitle: 'See your full program',
                  onTap: () => context.push('/journey'),
                ),
                _SettingsTile(
                  icon: Icons.emoji_events_outlined,
                  title: 'Achievements',
                  subtitle: 'Badges and milestones',
                  onTap: () => context.push('/achievements'),
                ),
                _SettingsTile(
                  icon: Icons.grid_view_outlined,
                  title: 'All Screens (Preview)',
                  subtitle: 'Tap to preview every UI screen',
                  onTap: () => context.push('/dev/screens'),
                ),
                _SettingsTile(
                  icon: Icons.delete_outline,
                  title: 'Clear local cache',
                  subtitle: 'Reset app data (dev only)',
                  onTap: () async {
                    await AppCache.instance.reset();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cache cleared. Restart app.')),
                      );
                      context.go('/welcome');
                    }
                  },
                ),
                _SettingsTile(
                  icon: Icons.replay,
                  title: 'Retake Assessment',
                  subtitle: 'Update your mobility score',
                  onTap: () => context.push('/onboarding/assessment'),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showProManageSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final c = ctx.appColors;
        return SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
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
                'Pro subscription',
                style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 4),
              Text(
                '${SubscriptionRepository.instance.trialDaysLeft} trial days remaining',
                style: TextStyle(color: c.textSecondary),
              ),
              SizedBox(height: 20),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.star_outline, color: c.primary),
                title: Text('View Pro benefits'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(ctx);
                  context.push('/premium');
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.cancel_outlined, color: c.primary),
                title: Text('Cancel free trial'),
                subtitle: Text('Return to free plan'),
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

  String _themeLabel(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
        ThemeMode.system => 'System',
      };

  void _showAppearanceSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final c = ctx.appColors;
        final current = AppCache.instance.themeMode;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Appearance',
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: 8),
                _ThemeOption(
                  label: 'System default',
                  icon: Icons.brightness_auto,
                  selected: current == ThemeMode.system,
                  onTap: () async {
                    await AppCache.instance.setThemeMode(ThemeMode.system);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
                _ThemeOption(
                  label: 'Light',
                  icon: Icons.light_mode_outlined,
                  selected: current == ThemeMode.light,
                  onTap: () async {
                    await AppCache.instance.setThemeMode(ThemeMode.light);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
                _ThemeOption(
                  label: 'Dark',
                  icon: Icons.dark_mode_outlined,
                  selected: current == ThemeMode.dark,
                  onTap: () async {
                    await AppCache.instance.setThemeMode(ThemeMode.dark);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
                SizedBox(height: 8),
                Text(
                  'Choose how CalmCalibrate looks on this device.',
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

class _ProfileStat extends StatelessWidget {
  _ProfileStat({required this.label, required this.value});

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
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: c.textMuted,
          ),
        ),
      ],
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
  _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: c.primaryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: c.primary),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
