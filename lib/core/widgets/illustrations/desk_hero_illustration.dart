import 'package:calm_calibrate/core/animations/float_animation.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Welcome / onboarding hero — floating desk worker motif.
class DeskHeroIllustration extends StatelessWidget {
  DeskHeroIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: c.primaryLight,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 40,
            child: Container(
              width: 140,
              height: 8,
              decoration: BoxDecoration(
                color: c.navy.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            child: Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                color: c.navy.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          FloatAnimation(
            child: Icon(
              Icons.self_improvement,
              size: 100,
              color: c.primary,
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: c.cardShadow,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.accessibility_new, size: 16, color: c.primary),
                  SizedBox(width: 6),
                  Text(
                    'Desk-friendly',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: c.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
