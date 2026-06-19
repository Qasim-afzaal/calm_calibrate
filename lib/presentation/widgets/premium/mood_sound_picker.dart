import 'package:calm_calibrate/core/animations/scale_tap.dart';
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
    this.hideTeaser = false,
    this.iconRow = false,
  });

  final int? painScore;
  final bool compact;
  /// Hides the Pro soundscape teaser row (e.g. tight check-in layout).
  final bool hideTeaser;
  /// Five equal icon columns — compact check-in layout.
  final bool iconRow;

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
            'Pro picks ambient audio for how you feel: stressed, tired, sore, '
            'or focused. ${mood.label} → "${mood.soundscape}".',
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
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: widget.compact ? 14 : 15,
                ),
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
                : 'Pro unlocks mood matched ambient audio',
            style: TextStyle(fontSize: 13, color: c.textSecondary),
          ),
        ],
        SizedBox(height: widget.iconRow ? 14 : (widget.compact ? 8 : 12)),
        if (widget.iconRow)
          _MoodIconRow(
            selected: selected,
            isPremium: isPremium,
            compact: widget.compact,
            onTap: _onMoodTap,
          )
        else
          Wrap(
          spacing: widget.compact ? 6 : 8,
          runSpacing: widget.compact ? 6 : 8,
          children: WorkoutMood.values.map((mood) {
            final isSelected = selected == mood;
            return ScaleTap(
              onTap: () => _onMoodTap(mood),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: widget.compact ? 9 : 12,
                  vertical: widget.compact ? 6 : 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected && isPremium
                      ? c.primaryLight
                      : c.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected && isPremium
                        ? c.primary.withValues(alpha: 0.45)
                        : c.border,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      mood.icon,
                      size: widget.compact ? 14 : 16,
                      color: isSelected && isPremium ? c.primary : c.textMuted,
                    ),
                    SizedBox(width: widget.compact ? 4 : 6),
                    Text(
                      mood.label,
                      style: TextStyle(
                        fontSize: widget.compact ? 12 : 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected && isPremium
                            ? c.primary
                            : c.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        if (isPremium && selected != null && !widget.iconRow) ...[
          SizedBox(height: widget.compact ? 8 : 12),
          _SoundscapePreview(mood: selected),
        ] else if (!isPremium && !widget.hideTeaser) ...[
          SizedBox(height: widget.compact ? 8 : 12),
          MoodSoundLockedTeaser(),
        ],
      ],
    );
  }
}

class _MoodIconRow extends StatelessWidget {
  const _MoodIconRow({
    required this.selected,
    required this.isPremium,
    required this.compact,
    required this.onTap,
  });

  final WorkoutMood? selected;
  final bool isPremium;
  final bool compact;
  final Future<void> Function(WorkoutMood mood) onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final size = compact ? 42.0 : 48.0;
    final iconSize = compact ? 18.0 : 20.0;

    return Row(
      children: WorkoutMood.values.map((mood) {
        final isSelected = selected == mood;
        final active = isSelected && isPremium;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: ScaleTap(
              onTap: () => onTap(mood),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size,
                    height: size,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: active ? c.primary : c.surface,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: active
                            ? c.primary
                            : c.border,
                        width: active ? 2 : 1,
                      ),
                      boxShadow: active
                          ? [
                              BoxShadow(
                                color: c.primary.withValues(alpha: 0.28),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      mood.icon,
                      size: iconSize,
                      color: active ? Colors.white : c.textSecondary,
                    ),
                  ),
                  SizedBox(height: compact ? 5 : 6),
                  Text(
                    mood.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: compact ? 9 : 10,
                      fontWeight: FontWeight.w600,
                      color: active ? c.primary : c.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
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
            'Pick how you feel and Pro plays the right ambient audio: '
            'rain for tired days, breath work when stressed, zen when calm.',
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: c.primaryLight.withValues(alpha: 0.35),
          border: Border.all(color: c.primary.withValues(alpha: 0.15)),
        ),
        child: Row(
          children: [
            Icon(Icons.headphones_rounded, size: 18, color: c.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Pro: soundscapes matched to your mood',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: c.textSecondary,
                ),
              ),
            ),
            Icon(Icons.lock_rounded, size: 15, color: c.textMuted),
          ],
        ),
      ),
    );
  }
}
