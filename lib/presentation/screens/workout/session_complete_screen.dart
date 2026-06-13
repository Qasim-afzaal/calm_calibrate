import 'package:calm_calibrate/core/constants/app_spacing.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
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
    final c = context.appColors;
    final workoutState = context.watch<WorkoutBloc>().state;
    final repo = MockUserRepository.instance;
    final profile = repo.profile;
    final isPremium = SubscriptionRepository.instance.isPremium;
    final lastLog =
        repo.sessionLogs.isNotEmpty ? repo.sessionLogs.last : null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          child: Column(
            children: [
              Spacer(),
              CelebrationPop(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: c.successLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 48,
                    color: c.success,
                  ),
                ),
              ),
              SizedBox(height: 24),
              FadeSlideIn(
                child: Text(
                  'Nice work!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 8),
              FadeSlideIn(
                delay: Duration(milliseconds: 100),
                child: Text(
                  'Your body thanks you. Keep the streak going tomorrow.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: c.textSecondary),
                ),
              ),
              SizedBox(height: 40),
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
              if (!isPremium) ...[
                SizedBox(height: 24),
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
              Spacer(),
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
              SizedBox(height: 12),
              AppButton(
                label: 'How do you feel?',
                variant: AppButtonVariant.outlined,
                onPressed: () => _showReliefDialog(context),
              ),
              SizedBox(height: 24),
            ],
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
        return Padding(
          padding: EdgeInsets.all(24),
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
