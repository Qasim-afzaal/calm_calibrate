import 'package:calm_calibrate/core/animations/breathe_animation.dart';
import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Navy smart-break CTA with subtle bolt pulse.
class SmartBreakCard extends StatelessWidget {
  SmartBreakCard({
    super.key,
    required this.minutesUntilBreak,
    this.onTap,
    this.isPremium = false,
    this.aiHint,
  });

  final int minutesUntilBreak;
  final VoidCallback? onTap;
  final bool isPremium;
  final String? aiHint;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return ScaleTap(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: c.navy,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: c.navy.withValues(alpha: 0.25),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BreatheAnimation(
                  minScale: 0.9,
                  maxScale: 1.0,
                  duration: Duration(milliseconds: 2000),
                  child: Icon(Icons.bolt, color: c.primary, size: 20),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Smart Break',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (isPremium)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: c.primary.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'PRO',
                      style: TextStyle(
                        color: c.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                else
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock, size: 10, color: Colors.white54),
                        SizedBox(width: 3),
                        Text(
                          'PRO',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Next break in ~$minutesUntilBreak min',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width < 340 ? 18 : 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              isPremium
                  ? (aiHint ?? 'AI-timed based on your posture & sitting pattern')
                  : 'Based on your sitting pattern',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
