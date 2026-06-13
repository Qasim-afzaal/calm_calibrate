import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/presentation/widgets/premium/pro_lock_sheet.dart';
import 'package:calm_calibrate/data/models/workout_mood.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/services/mood_sound_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Mood chips + Pro soundscape preview — locked for free users.
class MoodSoundPicker extends StatefulWidget {
  MoodSoundPicker({
    super.key,
    this.painScore,
    this.compact = false,
  });

  final int? painScore;
  final bool compact;

  @override
  State<MoodSoundPicker> createState() => _MoodSoundPickerState();
}

class _MoodSoundPickerState extends State<MoodSoundPicker> {
  final _service = MoodSoundService.instance;

  @override
  void initState() {
    super.initState();
    _maybeSuggestMood();
  }

  void _maybeSuggestMood() {
    if (_service.selectedMood != null || widget.painScore == null) return;
    if (!SubscriptionRepository.instance.isPremium) return;
    _service.selectMood(_service.moodForPainScore(widget.painScore!));
  }

  Future<void> _onMoodTap(WorkoutMood mood) async {
    if (!SubscriptionRepository.instance.isPremium) {
      await showProLockSheet(
        context,
        feature: 'Mood soundscapes',
        benefit:
            'Pro picks ambient audio for how you feel — stressed, tired, sore, '
            'or focused. ${mood.emoji} ${mood.label} → "${mood.soundscape}".',
      );
      return;
    }
    await _service.selectMood(mood);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isPremium = SubscriptionRepository.instance.isPremium;
    final selected = _service.selectedMood;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.music_note_rounded, color: c.primary, size: 18),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'How are you feeling?',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
            if (!isPremium)
              GestureDetector(
                onTap: () => context.push('/premium'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: c.primaryLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock, size: 11, color: c.primary),
                      SizedBox(width: 3),
                      Text(
                        'PRO',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: c.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (!widget.compact) ...[
          SizedBox(height: 4),
          Text(
            isPremium
                ? 'We\'ll play a matching soundscape during your session'
                : 'Pro unlocks mood-matched ambient audio',
            style: TextStyle(fontSize: 13, color: c.textSecondary),
          ),
        ],
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: WorkoutMood.values.map((mood) {
            final isSelected = selected == mood;
            return FilterChip(
              label: Text('${mood.emoji} ${mood.label}'),
              selected: isSelected && isPremium,
              onSelected: (_) => _onMoodTap(mood),
              selectedColor: c.primaryLight,
              checkmarkColor: c.primary,
              side: BorderSide(
                color: isSelected && isPremium
                    ? c.primary
                    : c.border,
              ),
            );
          }).toList(),
        ),
        if (isPremium && selected != null) ...[
          SizedBox(height: 12),
          _SoundscapePreview(mood: selected),
        ] else if (!isPremium) ...[
          SizedBox(height: 12),
          MoodSoundLockedTeaser(),
        ],
      ],
    );
  }
}

class _SoundscapePreview extends StatelessWidget {
  _SoundscapePreview({required this.mood});

  final WorkoutMood mood;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.navy.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Icon(Icons.graphic_eq_rounded, color: c.primary, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mood.soundscape,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                Text(
                  mood.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: c.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MoodSoundLockedTeaser extends StatelessWidget {
  MoodSoundLockedTeaser({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return GestureDetector(
      onTap: () => showProLockSheet(
        context,
        feature: 'Mood soundscapes',
        benefit:
            'Pick how you feel and Pro plays the right ambient audio — '
            'rain for tired days, breath work when stressed, zen when calm.',
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.border),
        ),
        child: Row(
          children: [
            Icon(Icons.headphones_outlined, color: c.textMuted),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Pro: soundscapes matched to your mood',
                style: TextStyle(fontSize: 13, color: c.textSecondary),
              ),
            ),
            Icon(Icons.lock_outline, size: 18, color: c.textMuted),
          ],
        ),
      ),
    );
  }
}
