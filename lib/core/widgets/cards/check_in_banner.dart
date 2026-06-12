import 'package:calm_calibrate/core/animations/breathe_animation.dart';
import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Daily body check-in prompt.
class CheckInBanner extends StatelessWidget {
  CheckInBanner({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return ScaleTap(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: c.primaryLight,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(color: c.primary.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            BreatheAnimation(
              child: Icon(Icons.favorite_border, color: c.primary),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Daily check-in — how\'s your body today?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: c.primary),
          ],
        ),
      ),
    );
  }
}
