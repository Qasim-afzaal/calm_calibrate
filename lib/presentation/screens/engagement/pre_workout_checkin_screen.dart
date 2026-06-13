import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/presentation/widgets/premium/mood_sound_picker.dart';
import 'package:calm_calibrate/presentation/widgets/premium/pro_lock_sheet.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreWorkoutCheckInScreen extends StatefulWidget {
  PreWorkoutCheckInScreen({
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
        benefit: 'This desk program is part of the Pro library — '
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
            'Pro unlocks your full AI plan — morning, midday & evening.',
      );
      if (mounted) context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: c.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 48,
                  color: c.primary,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Before we start',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 8),
              Text(
                'Rate your pain right now (1 = great, 5 = bad)',
                textAlign: TextAlign.center,
                style: TextStyle(color: c.textSecondary),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (i) {
                  final score = i + 1;
                  final selected = _painScore == score;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () => setState(() => _painScore = score),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: selected
                            ? c.primary
                            : c.surface,
                        child: Text(
                          '$score',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: selected
                                ? Colors.white
                                : c.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 28),
              MoodSoundPicker(painScore: _painScore, compact: true),
              Spacer(flex: 2),
              PrimaryButton(
                label: 'Start session',
                onPressed: () {
                  EngagementRepository.instance.recordCheckIn(
                    painScore: _painScore,
                  );
                  context.push('/workout/${widget.sessionId}');
                },
              ),
              SizedBox(height: 12),
              PrimaryButton(
                label: 'Skip check-in',
                variant: PrimaryButtonVariant.outlined,
                onPressed: () =>
                    context.push('/workout/${widget.sessionId}'),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
