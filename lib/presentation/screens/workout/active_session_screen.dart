import 'package:calm_calibrate/core/constants/screen_metrics.dart';
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
  const ActiveSessionScreen({super.key, required this.sessionId});

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
          backgroundColor: c.background,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close_rounded, color: c.textSecondary),
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
              child: Text(
                'Skip',
                style: TextStyle(
                  color: c.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (context, state) {
            final step = state.currentStep;
            if (step == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final bloc = context.read<WorkoutBloc>();
            final soundscape = MoodSoundService.instance.activeSoundscapeLabel();
            final sm = context.metrics;
            final totalSteps = state.session!.steps.length;
            final stepProgress = state.currentStepIndex / totalSteps;
            final stageColor = Color.lerp(c.primaryLight, c.surface, 0.35)!;

            return ResponsiveContent(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sm.horizontalPadding),
                child: Column(
                  children: [
                    if (soundscape != null) ...[
                      _SoundscapeBanner(label: soundscape),
                      const SizedBox(height: 12),
                    ],
                    _StepProgressHeader(
                      current: state.currentStepIndex + 1,
                      total: totalSteps,
                      progress: state.progress,
                      stepProgress: stepProgress,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              c.primaryLight.withValues(alpha: 0.55),
                              c.primaryLight.withValues(alpha: 0.25),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: c.primary.withValues(alpha: 0.12),
                          ),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final poseSize = sm.workoutPoseSize.clamp(
                              160.0,
                              constraints.maxHeight * 0.58,
                            );
                            return SingleChildScrollView(
                              padding: EdgeInsets.symmetric(
                                vertical: sm.sectionGap + 4,
                                horizontal: sm.sectionGap + 4,
                              ),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      step.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: sm.isCompact ? 20 : 22,
                                        fontWeight: FontWeight.w800,
                                        color: c.textPrimary,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    SizedBox(height: sm.sectionGap + 4),
                                    ExercisePoseAnimation(
                                      key: ValueKey(
                                        '${state.currentStepIndex}-${step.pose.name}',
                                      ),
                                      pose: step.pose,
                                      active: state.status == WorkoutStatus.active,
                                      size: poseSize,
                                      stageColor: stageColor,
                                      borderRadius: poseSize * 0.18,
                                    ),
                                    SizedBox(height: sm.sectionGap + 6),
                                    Text(
                                      step.instruction,
                                      textAlign: TextAlign.center,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: sm.isCompact ? 14 : 16,
                                        color: c.textSecondary,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: sm.onboardingSectionGap),
                    _TimerDisplay(
                      time: _formatTime(state.secondsRemaining),
                      active: state.status == WorkoutStatus.active,
                      fontSize: sm.timerFontSize,
                    ),
                    SizedBox(height: sm.onboardingSectionGap),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            label: 'Previous',
                            variant: AppButtonVariant.outlined,
                            onPressed: state.currentStepIndex > 0
                                ? () => bloc.add(const WorkoutPreviousStepRequested())
                                : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: AppButton(
                            label: 'Next',
                            variant: AppButtonVariant.outlined,
                            onPressed: () => bloc.add(const WorkoutNextStepRequested()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _TipCard(
                      tip: step.tip ??
                          'Tip: Breathe out as you stretch. Never force pain.',
                    ),
                    SizedBox(height: sm.onboardingBottomGap),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SoundscapeBanner extends StatelessWidget {
  const _SoundscapeBanner({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: c.primaryLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(Icons.graphic_eq_rounded, color: c.primary, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Playing: $label',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: c.primary,
              ),
            ),
          ),
          if (SubscriptionRepository.instance.isPremium)
            Icon(Icons.headphones_rounded, size: 16, color: c.primary),
        ],
      ),
    );
  }
}

class _StepProgressHeader extends StatelessWidget {
  const _StepProgressHeader({
    required this.current,
    required this.total,
    required this.progress,
    required this.stepProgress,
  });

  final int current;
  final int total;
  final double progress;
  final double stepProgress;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Column(
      children: [
        Row(
          children: List.generate(total, (index) {
            final filled = index < current;
            final isCurrent = index == current - 1;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: index < total - 1 ? 6 : 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: isCurrent ? 6 : 4,
                  decoration: BoxDecoration(
                    color: filled
                        ? c.primary
                        : c.border,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        Text(
          'Step $current of $total',
          style: TextStyle(
            fontSize: 13,
            color: c.textMuted,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

class _TimerDisplay extends StatelessWidget {
  const _TimerDisplay({
    required this.time,
    required this.active,
    required this.fontSize,
  });

  final String time;
  final bool active;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return PulseRing(
      active: active,
      color: c.primary.withValues(alpha: 0.35),
      child: Container(
        width: 108,
        height: 108,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: c.surface,
          border: Border.all(color: c.primary.withValues(alpha: 0.22), width: 2),
          boxShadow: [
            BoxShadow(
              color: c.primary.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            color: c.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({required this.tip});

  final String tip;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: c.warning.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.warning.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_rounded, size: 20, color: c.warning),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 14,
                color: c.textSecondary,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
