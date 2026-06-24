import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/config/ai_features.dart';
import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/feedback/ai_coming_soon_notice.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/services/ai_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Inline AI weekly insight — embeds in Progress tab.
class AiWeeklyInsightSection extends StatefulWidget {
  AiWeeklyInsightSection({
    super.key,
    required this.profile,
    required this.totalSessions,
    required this.totalMinutes,
    required this.averageRelief,
    required this.mobilityScore,
  });

  final UserProfile profile;
  final int totalSessions;
  final int totalMinutes;
  final double averageRelief;
  final int mobilityScore;

  @override
  State<AiWeeklyInsightSection> createState() => _AiWeeklyInsightSectionState();
}

class _AiWeeklyInsightSectionState extends State<AiWeeklyInsightSection> {
  String? _insight;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    if (AiFeatures.llmEnabled) {
      _load();
    } else {
      _loading = false;
    }
  }

  Future<void> _load() async {
    final insight = await AiService.instance.generateWeeklyInsight(
      profile: widget.profile,
      sessionCount: widget.totalSessions,
      totalMinutes: widget.totalMinutes,
      avgRelief: widget.averageRelief,
      mobilityScore: widget.mobilityScore,
    );
    if (mounted) {
      setState(() {
        _insight = insight;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!AiFeatures.llmEnabled) {
      return AiComingSoonNotice(feature: l10n.aiWeeklyInsightTitle);
    }
    final c = context.appColors;
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: c.primaryLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.primary.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: c.primary, size: 20),
              SizedBox(width: 8),
              Text(
                l10n.aiWeeklyInsightTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: c.primary,
                ),
              ),
              SizedBox(width: 6),
              _ProBadge(),
            ],
          ),
          SizedBox(height: 10),
          if (_loading)
            Center(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            Text(_insight ?? '', style: TextStyle(height: 1.5)),
        ],
      ),
    );
  }
}

class AiWeeklyInsightLockedTeaser extends StatelessWidget {
  AiWeeklyInsightLockedTeaser({super.key});

  @override
  Widget build(BuildContext context) {
    if (!SubscriptionFeatures.enabled) return const SizedBox.shrink();
    final c = context.appColors;
    final l10n = context.l10n;
    return ScaleTap(
      onTap: () => context.push('/premium'),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 56),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: c.navy.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.border),
        ),
        child: Row(
          children: [
            Icon(Icons.insights_outlined, color: c.textMuted),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                l10n.unlockAiWeeklyInsights,
                style: TextStyle(color: c.textSecondary, height: 1.35),
              ),
            ),
            Icon(Icons.lock_outline, color: c.textMuted),
          ],
        ),
      ),
    );
  }
}

class _ProBadge extends StatelessWidget {
  _ProBadge();

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final l10n = context.l10n;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: c.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        l10n.proBadge,
        style: TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
