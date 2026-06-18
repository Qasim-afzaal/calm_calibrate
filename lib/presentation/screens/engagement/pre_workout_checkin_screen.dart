import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/widgets/premium/mood_sound_picker.dart';
import 'package:calm_calibrate/presentation/widgets/premium/pro_lock_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreWorkoutCheckInScreen extends StatefulWidget {
  const PreWorkoutCheckInScreen({
    super.key,
    required this.sessionId,
  });

  final String sessionId;

  @override
  State<PreWorkoutCheckInScreen> createState() =>
      _PreWorkoutCheckInScreenState();
}

class _PreWorkoutCheckInScreenState extends State<PreWorkoutCheckInScreen> {
  int _painScore = 3;
  bool _accessChecked = false;

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] pre_workout loaded'); // auth-check-debug
    WidgetsBinding.instance.addPostFrameCallback((_) => _verifyAccess());
  }

  Future<void> _verifyAccess() async {
    if (_accessChecked) return;
    _accessChecked = true;

    final sub = SubscriptionRepository.instance;
    if (sub.isPremium) return;

    final sessions = MockSessionRepository.instance;
    if (sessions.isPremiumProgram(widget.sessionId)) {
      if (!mounted) return;
      await showProLockSheet(
        context,
        feature: 'Premium program',
        benefit: 'This desk program is part of the Pro library. '
            '50+ targeted sessions for neck, back, hips & more.',
      );
      if (mounted) context.pop();
      return;
    }

    final profile = MockUserRepository.instance.profile;
    final today = sessions.getTodaySessions(profile);
    final index = today.indexWhere((s) => s.id == widget.sessionId);
    if (index > 0) {
      if (!mounted) return;
      await showProLockSheet(
        context,
        feature: 'Extra daily sessions',
        benefit: 'Free plan includes 1 session per day. '
            'Pro unlocks your full AI plan: morning, midday & evening.',
      );
      if (mounted) context.pop();
    }
  }

  void _startSession({required bool skipCheckIn}) {
    if (!skipCheckIn) {
      EngagementRepository.instance.recordCheckIn(painScore: _painScore);
    }
    context.push('/workout/${widget.sessionId}');
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    final session =
        MockSessionRepository.instance.getSessionById(widget.sessionId);
    final hPad = m.horizontalPadding;
    final tight = m.isVeryCompact;

    return Scaffold(
      backgroundColor: c.background,
      body: Stack(
        children: [
          const _CheckInBackdrop(),
          SafeArea(
            child: ResponsiveContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(hPad - 8, 2, hPad, 0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.close_rounded, color: c.textSecondary),
                          onPressed: () => context.pop(),
                        ),
                        const Spacer(),
                        _SessionChip(session: session),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(hPad, tight ? 4 : 10, hPad, 0),
                    child: _ScreenHeader(session: session),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPad),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _CheckInPanel(
                            child: _PainSection(
                              painScore: _painScore,
                              compact: tight,
                              onChanged: (v) => setState(() => _painScore = v),
                            ),
                          ),
                          SizedBox(height: tight ? 10 : 14),
                          _CheckInPanel(
                            child: MoodSoundPicker(
                              painScore: _painScore,
                              compact: true,
                              hideTeaser: true,
                              iconRow: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(hPad, 0, hPad, m.sectionGap),
                    child: Column(
                      children: [
                        AppButton(
                          label: 'Start session',
                          onPressed: () => _startSession(skipCheckIn: false),
                        ),
                        SizedBox(height: tight ? 8 : 10),
                        AppButton(
                          label: 'Skip check-in',
                          variant: AppButtonVariant.outlined,
                          onPressed: () => _startSession(skipCheckIn: true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckInBackdrop extends StatelessWidget {
  const _CheckInBackdrop();

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final h = MediaQuery.sizeOf(context).height;
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -60,
            right: -30,
            child: _GlowOrb(
              size: 200,
              color: c.primary.withValues(alpha: 0.12),
            ),
          ),
          Positioned(
            top: h * 0.35,
            left: -50,
            child: _GlowOrb(
              size: 160,
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

class _SessionChip extends StatelessWidget {
  const _SessionChip({required this.session});

  final ExerciseSession? session;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final minutes = session?.durationMinutes ?? 3;
    final icon = session?.icon ?? Icons.self_improvement_rounded;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: c.primaryLight.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: c.primary.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: c.primary),
          const SizedBox(width: 6),
          Text(
            '$minutes min',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: c.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader({required this.session});

  final ExerciseSession? session;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    final title = session?.title ?? 'Desk break';
    final subtitle = session?.subtitle ?? 'Quick mobility reset';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Before we start',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: c.textMuted,
            letterSpacing: 0.2,
          ),
        ),
        SizedBox(height: m.isVeryCompact ? 4 : 6),
        Text(
          title,
          style: TextStyle(
            fontSize: m.isVeryCompact ? 26 : 30,
            fontWeight: FontWeight.w800,
            color: c.textPrimary,
            letterSpacing: -0.6,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: c.textSecondary,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}

class _CheckInPanel extends StatelessWidget {
  const _CheckInPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            c.surface,
            c.primaryLight.withValues(alpha: 0.35),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: c.primary.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: c.cardShadow,
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _PainSection extends StatelessWidget {
  const _PainSection({
    required this.painScore,
    required this.compact,
    required this.onChanged,
  });

  final int painScore;
  final bool compact;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.accessibility_new_rounded, size: 18, color: c.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'How does your body feel?',
                style: TextStyle(
                  fontSize: compact ? 15 : 16,
                  fontWeight: FontWeight.w800,
                  color: c.textPrimary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: compact ? 12 : 16),
        PainScalePicker(
          value: painScore,
          onChanged: onChanged,
          lowLabel: 'Great',
          highLabel: 'Sore',
          showConnector: true,
        ),
      ],
    );
  }
}
