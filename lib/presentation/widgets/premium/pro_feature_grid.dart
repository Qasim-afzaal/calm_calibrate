import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/presentation/widgets/premium/pro_features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Responsive 2-column grid — every paywall feature in one place.
class ProFeatureGrid extends StatelessWidget {
  ProFeatureGrid({super.key});

  void _open(BuildContext context, ProFeature feature) {
    if (feature.comingSoon) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Desktop companion coming soon!')),
      );
      return;
    }

    switch (feature.id) {
      case 'programs':
        context.go('/sessions');
      case 'posture':
        context.push('/check-in');
      case 'daily_plan':
        // AI plan is shown below on home — gentle scroll hint
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your AI plan is below in Today\'s Sessions'),
            duration: Duration(seconds: 2),
          ),
        );
      case 'smart_break':
        context.push('/smart-break');
      case 'weekly_report':
        context.push('/weekly-recap');
      case 'mood_sound':
        context.push('/pre-workout/morning_reset');
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 400 ? 3 : 2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - (columns - 1) * 10) / columns;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ProFeatures.all.map((feature) {
            return SizedBox(
              width: itemWidth,
              child: _ProFeatureTile(
                feature: feature,
                onTap: () => _open(context, feature),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _ProFeatureTile extends StatelessWidget {
  _ProFeatureTile({required this.feature, required this.onTap});

  final ProFeature feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final disabled = feature.comingSoon;

    return Material(
      color: c.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: disabled ? c.border : c.primary.withValues(alpha: 0.25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    feature.icon,
                    size: 20,
                    color: disabled ? c.textMuted : c.primary,
                  ),
                  Spacer(),
                  if (disabled)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: c.border,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Soon', style: TextStyle(fontSize: 9)),
                    )
                  else
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: c.textMuted,
                    ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                feature.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 2),
              Text(
                feature.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: c.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
