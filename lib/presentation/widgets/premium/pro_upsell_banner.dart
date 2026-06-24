import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Inline upsell after key moments (session complete, milestones).
class ProUpsellBanner extends StatelessWidget {
  ProUpsellBanner({
    super.key,
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    if (!SubscriptionFeatures.enabled) return const SizedBox.shrink();
    final c = context.appColors;
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => context.push('/premium'),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              c.navy,
              c.navy.withValues(alpha: 0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.workspace_premium_rounded,
                color: c.primary,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? l10n.upsellDefaultTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle ?? l10n.upsellDefaultSubtitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white54, size: 20),
          ],
        ),
      ),
    );
  }
}
