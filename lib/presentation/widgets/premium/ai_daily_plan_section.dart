import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/buttons/app_button.dart';
import 'package:calm_calibrate/core/widgets/feedback/ai_coming_soon_notice.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/presentation/blocs/ai_plan/ai_plan_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/ai_plan/ai_plan_event.dart';
import 'package:calm_calibrate/presentation/blocs/ai_plan/ai_plan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AiDailyPlanSection extends StatefulWidget {
  const AiDailyPlanSection({super.key, this.autoGenerate = true});

  final bool autoGenerate;

  @override
  State<AiDailyPlanSection> createState() => _AiDailyPlanSectionState();
}

class _AiDailyPlanSectionState extends State<AiDailyPlanSection> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!AiFeatures.llmEnabled) {
      return AiComingSoonNotice(feature: l10n.todaysAiPlan);
    }
    return BlocProvider(
      create: (_) => AiPlanBloc()
        ..add(AiPlanStarted(autoGenerate: widget.autoGenerate)),
      child: const _AiDailyPlanBody(),
    );
  }
}

class _AiDailyPlanBody extends StatelessWidget {
  const _AiDailyPlanBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiPlanBloc, AiPlanState>(
      builder: (context, state) {
        final bloc = context.read<AiPlanBloc>();
        final l10n = context.l10n;

        if (state.status == AiPlanStatus.generating && state.plan == null) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }

        if (state.plan == null) {
          return AppButton(
            label: l10n.generateAiPlanToday,
            icon: Icons.auto_awesome,
            onPressed: () => bloc.add(const AiPlanGenerateRequested()),
          );
        }

        return _PlanContent(plan: state.plan!, l10n: l10n);
      },
    );
  }
}

class _PlanContent extends StatelessWidget {
  const _PlanContent({required this.plan, required this.l10n});

  final AiDailyPlan plan;
  final dynamic l10n;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: c.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.flag_rounded, size: 16, color: c.primary),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.aiFocus(plan.focus),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: c.primary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        _Slot(
          icon: Icons.wb_twilight_rounded,
          label: l10n.planSlotMorning,
          text: plan.morning,
          sessionId: 'morning_reset',
        ),
        SizedBox(height: 8),
        _Slot(
          icon: Icons.wb_sunny_rounded,
          label: l10n.planSlotMidday,
          text: plan.midday,
          sessionId: 'midday_break',
        ),
        SizedBox(height: 8),
        _Slot(
          icon: Icons.nightlight_round,
          label: l10n.planSlotEvening,
          text: plan.evening,
          sessionId: 'evening_recovery',
        ),
        if (plan.coachNote.isNotEmpty) ...[
          SizedBox(height: 10),
          Text(
            plan.coachNote,
            style: TextStyle(
              fontSize: 12,
              color: c.textMuted,
              fontStyle: FontStyle.italic,
              height: 1.35,
            ),
          ),
        ],
      ],
    );
  }
}

class _Slot extends StatelessWidget {
  const _Slot({
    required this.icon,
    required this.label,
    required this.text,
    required this.sessionId,
  });

  final IconData icon;
  final String label;
  final String text;
  final String sessionId;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Material(
      color: c.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => context.push('/pre-workout/$sessionId'),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: c.border),
          ),
          child: Row(
            children: [
              Icon(icon, size: 22, color: c.primary),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: c.textMuted,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.play_circle_fill,
                color: c.primary,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AiDailyPlanLockedTeaser extends StatelessWidget {
  const AiDailyPlanLockedTeaser({super.key});

  @override
  Widget build(BuildContext context) {
    if (!SubscriptionFeatures.enabled) return const SizedBox.shrink();
    final c = context.appColors;
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => context.push('/premium'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.border),
        ),
        child: Row(
          children: [
            Icon(Icons.psychology_outlined, size: 18, color: c.textMuted),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                l10n.aiDailyPlanLockedTeaser,
                style: TextStyle(fontSize: 12, color: c.textSecondary),
              ),
            ),
            Icon(Icons.lock_outline, size: 16, color: c.textMuted),
          ],
        ),
      ),
    );
  }
}
