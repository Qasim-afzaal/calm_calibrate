import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Dev/preview screen — tap any route to preview the full UI flow.
class ScreenCatalogScreen extends StatelessWidget {
  ScreenCatalogScreen({super.key});

  static final _screens = [
    _ScreenEntry('Splash', '/splash'),
    _ScreenEntry('Welcome', '/welcome'),
    _ScreenEntry('Pain Selector', '/onboarding/pain'),
    _ScreenEntry('Work Pattern', '/onboarding/work-pattern'),
    _ScreenEntry('Goals & Reminders', '/onboarding/goals'),
    _ScreenEntry('Notifications', '/onboarding/notifications'),
    _ScreenEntry('Assessment Scan', '/onboarding/assessment'),
    _ScreenEntry('Mobility Score', '/onboarding/score'),
    _ScreenEntry('Personalized Plan', '/onboarding/plan'),
    _ScreenEntry('Home Dashboard', '/home'),
    _ScreenEntry('Daily Check-in', '/check-in'),
    _ScreenEntry('Pre-workout Check-in', '/pre-workout/midday_break'),
    _ScreenEntry('Active Session', '/workout/midday_break'),
    _ScreenEntry('Session Complete', '/workout/midday_break/complete'),
    _ScreenEntry('Smart Break Prompt', '/smart-break'),
    _ScreenEntry('Weekly Recap', '/weekly-recap'),
    _ScreenEntry('Re-engagement', '/re-engage'),
    _ScreenEntry('Milestone Day 3', '/milestone/3'),
    _ScreenEntry('Milestone Day 7', '/milestone/7'),
    _ScreenEntry('Milestone Day 30', '/milestone/30'),
    _ScreenEntry('Progress', '/progress'),
    _ScreenEntry('Sessions Library', '/sessions'),
    _ScreenEntry('30-Day Journey Map', '/journey'),
    _ScreenEntry('Achievements', '/achievements'),
    _ScreenEntry('Reminders Settings', '/settings/reminders'),
    _ScreenEntry('Profile', '/profile'),
    _ScreenEntry('Premium Paywall', '/premium'),
  ];

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final repo = EngagementRepository.instance;

    return Scaffold(
      appBar: AppBar(title: Text('All Screens')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: c.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Simulate journey day',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [1, 3, 7, 14, 30].map((d) {
                    return ActionChip(
                      label: Text('Day $d'),
                      onPressed: () => repo.simulateDay(d),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          ..._screens.map(
            (s) => ListTile(
              title: Text(s.name),
              subtitle: Text(s.route, style: TextStyle(fontSize: 12)),
              trailing: Icon(Icons.chevron_right),
              onTap: () => context.push(s.route),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenEntry {
  _ScreenEntry(this.name, this.route);
  final String name;
  final String route;
}
