import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/data/services/mood_sound_service.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_event.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ActiveSessionScreen extends StatefulWidget {
  ActiveSessionScreen({super.key, required this.sessionId});

  final String sessionId;

  @override
  State<ActiveSessionScreen> createState() => _ActiveSessionScreenState();
}

class _ActiveSessionScreenState extends State<ActiveSessionScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] active_session loaded'); // auth-check-debug

    context
        .read<WorkoutBloc>()
        .add(WorkoutSessionLoadRequested(widget.sessionId));
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(1, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return BlocListener<WorkoutBloc, WorkoutState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == WorkoutStatus.completed) {
          context.go('/workout/${widget.sessionId}/complete');
        }
      },
      child: Scaffold(
        backgroundColor: c.background,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              context.read<WorkoutBloc>().add(const WorkoutSkipped());
              context.pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<WorkoutBloc>().add(const WorkoutSkipped());
                context.pop();
              },
              child: Text('Skip'),
            ),
          ],
        ),
        body: BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (context, state) {
            final step = state.currentStep;
            if (step == null) {
              return Center(child: CircularProgressIndicator());
            }

            final bloc = context.read<WorkoutBloc>();
            final soundscape = MoodSoundService.instance.activeSoundscapeLabel();

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  if (soundscape != null) ...[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: c.primaryLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.graphic_eq_rounded,
                            color: c.primary,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Playing: $soundscape',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: c.primary,
                              ),
                            ),
                          ),
                          if (SubscriptionRepository.instance.isPremium)
                            Icon(
                              Icons.headphones_rounded,
                              size: 16,
                              color: c.primary,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: state.progress,
                      minHeight: 4,
                      backgroundColor: c.border,
                      color: c.primary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Step ${state.currentStepIndex + 1} of ${state.session!.steps.length}',
                    style: TextStyle(
                      fontSize: 13,
                      color: c.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: c.primaryLight,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ExercisePoseAnimation(
                            pose: step.pose,
                            active: state.status == WorkoutStatus.active,
                            size: 210,
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              step.instruction,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: c.textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    step.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  PulseRing(
                    active: state.status == WorkoutStatus.active,
                    child: Text(
                      _formatTime(state.secondsRemaining),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: c.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: 'Previous',
                          variant: AppButtonVariant.outlined,
                          onPressed: state.currentStepIndex > 0
                              ? () => bloc
                                  .add(const WorkoutPreviousStepRequested())
                              : null,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: AppButton(
                          label: state.status == WorkoutStatus.paused
                              ? 'Resume'
                              : 'Pause',
                          onPressed: () {
                            if (state.status == WorkoutStatus.paused) {
                              bloc.add(const WorkoutResumed());
                            } else {
                              bloc.add(const WorkoutPaused());
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: AppButton(
                          label: 'Next',
                          onPressed: () =>
                              bloc.add(const WorkoutNextStepRequested()),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: c.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: c.border),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: 18,
                          color: c.warning,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            step.tip ??
                                'Tip: Breathe out as you stretch. Never force pain.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
