import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/presentation/widgets/feature_widgets.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_event.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SessionCompleteScreen extends StatelessWidget {
  SessionCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] session_complete loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    final workoutState = context.watch<WorkoutBloc>().state;
    final repo = MockUserRepository.instance;
    final profile = repo.profile;
    final isPremium = SubscriptionRepository.instance.isPremium;
    final showProUi = SubscriptionRepository.instance.showSubscriptionUi;
    final lastLog =
        repo.sessionLogs.isNotEmpty ? repo.sessionLogs.last : null;

    return Scaffold(
      body: SafeArea(
        child: ResponsiveContent(
          child: Padding(
            padding: m.screenPadding,
            child: Column(
              children: [
                const Spacer(),
                CelebrationPop(
                  child: Container(
                    width: m.isCompact ? 76 : 88,
                    height: m.isCompact ? 76 : 88,
                    decoration: BoxDecoration(
                      color: c.successLight,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: m.isCompact ? 40 : 48,
                      color: c.success,
                    ),
                  ),
                ),
                SizedBox(height: m.onboardingSectionGap),
              FadeSlideIn(
                child: Text(
                  'Nice work!',
                  style: m.headlineLargeStyle(Theme.of(context).textTheme),
                ),
              ),
              SizedBox(height: m.onboardingTitleGap),
              FadeSlideIn(
                delay: Duration(milliseconds: 100),
                child: Text(
                  'Your body thanks you. Keep the streak going tomorrow.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: c.textSecondary),
                ),
              ),
              SizedBox(height: m.largeSpacing),
              FadeSlideIn(
                delay: Duration(milliseconds: 180),
                child: Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        label: 'Minutes',
                        value:
                            '${lastLog?.durationMinutes ?? workoutState.session?.durationMinutes ?? 0}',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        label: 'Mobility pts',
                        value:
                            '${lastLog?.mobilityPointsEarned ?? workoutState.mobilityPointsEarned}',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        label: 'Streak',
                        value: '${profile.streakDays}d',
                      ),
                    ),
                  ],
                ),
              ),
              if (showProUi && !isPremium) ...[
                SizedBox(height: m.onboardingSectionGap),
                FadeSlideIn(
                  delay: Duration(milliseconds: 220),
                  child: ProUpsellBanner(
                    title: 'Unlock mood sounds & AI plans',
                    subtitle:
                        'Pro matches ambient audio to how you feel and builds '
                        'your full daily recovery plan.',
                  ),
                ),
              ],
              const Spacer(),
              FadeSlideIn(
                delay: Duration(milliseconds: 260),
                child: AppButton(
                  label: 'Back to Home',
                  onPressed: () {
                    context.read<WorkoutBloc>().add(const WorkoutSkipped());
                    context.go('/home');
                  },
                ),
              ),
              SizedBox(height: m.sectionGap + 4),
              AppButton(
                label: 'How do you feel?',
                variant: AppButtonVariant.outlined,
                onPressed: () => _showReliefDialog(context),
              ),
              SizedBox(height: m.onboardingBottomGap),
            ],
          ),
        ),
      ),
    ),
    );
  }

  void _showReliefDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final c = ctx.appColors;
        final sheetM = ctx.metrics;
        return Padding(
          padding: sheetM.screenPaddingAll,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How\'s your pain now?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                'This helps us personalize your next session.',
                style: TextStyle(color: c.textSecondary),
              ),
              SizedBox(height: 20),
              PainScalePicker(
                value: 2,
                onChanged: (score) {
                  context.read<WorkoutBloc>().add(WorkoutPostPainScoreSet(score));
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Thanks! We\'ll adjust your plan.'),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
