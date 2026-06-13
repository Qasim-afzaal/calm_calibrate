/// How the user feels before a session — drives Pro soundscapes.
enum WorkoutMood {
  stressed(
    label: 'Stressed',
    emoji: '😤',
    soundscape: 'Deep breath ambient',
    description: 'Slow exhale tones to calm your nervous system',
  ),
  tired(
    label: 'Tired',
    emoji: '😴',
    soundscape: 'Soft rain',
    description: 'Gentle rainfall to ease mental fatigue',
  ),
  sore(
    label: 'Sore',
    emoji: '🤕',
    soundscape: 'Warm low tones',
    description: 'Soothing frequencies for tight muscles',
  ),
  focused(
    label: 'Focused',
    emoji: '🎯',
    soundscape: 'Minimal focus pad',
    description: 'Light rhythm to stay present during stretches',
  ),
  calm(
    label: 'Calm',
    emoji: '😌',
    soundscape: 'Desk zen',
    description: 'Quiet office-friendly background',
  );

  const WorkoutMood({
    required this.label,
    required this.emoji,
    required this.soundscape,
    required this.description,
  });

  final String label;
  final String emoji;
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
