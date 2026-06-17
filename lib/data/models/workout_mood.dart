import 'package:flutter/material.dart';

/// How the user feels before a session — drives Pro soundscapes.
enum WorkoutMood {
  stressed(
    label: 'Stressed',
    icon: Icons.thunderstorm_outlined,
    soundscape: 'Deep breath ambient',
    description: 'Slow exhale tones to calm your nervous system',
  ),
  tired(
    label: 'Tired',
    icon: Icons.bedtime_outlined,
    soundscape: 'Soft rain',
    description: 'Gentle rainfall to ease mental fatigue',
  ),
  sore(
    label: 'Sore',
    icon: Icons.healing_outlined,
    soundscape: 'Warm low tones',
    description: 'Soothing frequencies for tight muscles',
  ),
  focused(
    label: 'Focused',
    icon: Icons.center_focus_strong_outlined,
    soundscape: 'Minimal focus pad',
    description: 'Light rhythm to stay present during stretches',
  ),
  calm(
    label: 'Calm',
    icon: Icons.self_improvement_outlined,
    soundscape: 'Desk zen',
    description: 'Quiet background for the office',
  );

  const WorkoutMood({
    required this.label,
    required this.icon,
    required this.soundscape,
    required this.description,
  });

  final String label;
  final IconData icon;
  final String soundscape;
  final String description;

  static WorkoutMood? fromKey(String? key) {
    if (key == null) return null;
    for (final mood in values) {
      if (mood.name == key) return mood;
    }
    return null;
  }
}
