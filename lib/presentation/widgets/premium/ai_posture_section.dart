import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/buttons/app_button.dart';
import 'package:calm_calibrate/core/widgets/feedback/ai_coming_soon_notice.dart';
import 'package:calm_calibrate/core/widgets/score_gauge.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/presentation/blocs/ai_posture/ai_posture_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/ai_posture/ai_posture_event.dart';
import 'package:calm_calibrate/presentation/blocs/ai_posture/ai_posture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Inline AI posture scan — embeds in check-in & progress flows.
class AiPostureSection extends StatelessWidget {
  AiPostureSection({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (!AiFeatures.llmEnabled) {
      return AiComingSoonNotice(feature: 'AI posture check');
    }
    return BlocProvider(
      create: (_) => AiPostureBloc()..add(const AiPostureStarted()),
      child: _AiPostureSectionBody(compact: compact),
    );
  }
}

class _AiPostureSectionBody extends StatelessWidget {
  _AiPostureSectionBody({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return BlocBuilder<AiPostureBloc, AiPostureState>(
      builder: (context, state) {
        final bloc = context.read<AiPostureBloc>();

        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome, color: c.primary, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'AI Posture Check',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: c.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'PRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                compact
                    ? 'Quick scan based on your trouble areas today.'
                    : 'Select desk posture patterns for AI analysis.',
                style: TextStyle(
                  fontSize: 13,
                  color: c.textMuted,
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: AiPostureBloc.issueOptions.take(compact ? 4 : 6).map(
                  (issue) {
                    final selected = state.selectedIssues.contains(issue);
                    return FilterChip(
                      label: Text(issue, style: TextStyle(fontSize: 12)),
                      selected: selected,
                      onSelected: (_) =>
                          bloc.add(AiPostureIssueToggled(issue)),
                      selectedColor: c.primaryLight,
                      checkmarkColor: c.primary,
                      visualDensity: VisualDensity.compact,
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 12),
              if (state.status == AiPostureStatus.analyzing)
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              else
                AppButton(
                  label: state.result == null ? 'Analyze posture' : 'Scan again',
                  variant: AppButtonVariant.outlined,
                  onPressed: state.selectedIssues.isEmpty
                      ? null
                      : () => bloc.add(const AiPostureAnalyzeRequested()),
                ),
              if (state.result != null) ...[
                SizedBox(height: 14),
                _CompactResult(analysis: state.result!),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _CompactResult extends StatelessWidget {
  _CompactResult({required this.analysis});

  final PostureAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScoreGauge(score: analysis.score, size: 64),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                analysis.summary,
                style: TextStyle(fontSize: 13, height: 1.35),
              ),
              if (analysis.recommendations.isNotEmpty) ...[
                SizedBox(height: 6),
                Text(
                  '→ ${analysis.recommendations.first}',
                  style: TextStyle(
                    fontSize: 12,
                    color: c.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Locked teaser for free users inside existing flows.
class AiPostureLockedTeaser extends StatelessWidget {
  AiPostureLockedTeaser({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return GestureDetector(
      onTap: () => context.push('/premium'),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: c.navy.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: c.border),
        ),
        child: Row(
          children: [
            Icon(Icons.lock_outline, color: c.textMuted),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Posture Check',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Unlock Pro for desk posture analysis',
                    style: TextStyle(fontSize: 13, color: c.textMuted),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: c.textMuted),
          ],
        ),
      ),
    );
  }
}
