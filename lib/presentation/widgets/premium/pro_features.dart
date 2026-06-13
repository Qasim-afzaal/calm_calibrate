import 'package:flutter/material.dart';

/// Paywall features — single source of truth for Pro home grid.
class ProFeature {
  const ProFeature({
    required this.id,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.comingSoon = false,
  });

  final String id;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool comingSoon;
}

abstract final class ProFeatures {
  static const all = [
    ProFeature(
      id: 'programs',
      icon: Icons.fitness_center_rounded,
      title: '50+ Programs',
      subtitle: 'Full desk library',
    ),
    ProFeature(
      id: 'posture',
      icon: Icons.accessibility_new_rounded,
      title: 'AI Posture',
      subtitle: 'Scan & track',
    ),
    ProFeature(
      id: 'daily_plan',
      icon: Icons.calendar_today_rounded,
      title: 'AI Daily Plan',
      subtitle: 'Personalized',
    ),
    ProFeature(
      id: 'smart_break',
      icon: Icons.notifications_active_rounded,
      title: 'Smart Breaks',
      subtitle: 'Timed reminders',
    ),
    ProFeature(
      id: 'weekly_report',
      icon: Icons.insights_rounded,
      title: 'Weekly Report',
      subtitle: 'AI progress',
    ),
    ProFeature(
      id: 'mood_sound',
      icon: Icons.music_note_rounded,
      title: 'Mood Sounds',
      subtitle: 'Ambient audio',
    ),
    ProFeature(
      id: 'desktop',
      icon: Icons.desktop_windows_rounded,
      title: 'Desktop App',
      subtitle: 'Coming soon',
      comingSoon: true,
    ),
  ];
}
