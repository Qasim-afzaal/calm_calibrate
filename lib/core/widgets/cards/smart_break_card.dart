import 'package:calm_calibrate/core/animations/breathe_animation.dart';
import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Navy smart-break CTA with subtle bolt pulse.
class SmartBreakCard extends StatelessWidget {
  const SmartBreakCard({
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [c.navy, c.navyLight],
          ),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: c.navy.withValues(alpha: 0.28),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -28,
              right: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: c.primary.withValues(alpha: 0.1),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BreatheAnimation(
                      minScale: 0.92,
                      maxScale: 1.0,
                      duration: const Duration(milliseconds: 2000),
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: c.primary.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.bolt_rounded, color: c.primary, size: 18),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Smart Break',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    _ProChip(isPremium: isPremium),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  'Next break in ~$minutesUntilBreak min',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).width < 340 ? 20 : 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  isPremium
                      ? (aiHint ?? 'Timed from your posture & sitting pattern')
                      : 'Based on your sitting pattern',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProChip extends StatelessWidget {
  const _ProChip({required this.isPremium});

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isPremium
            ? c.primary.withValues(alpha: 0.22)
            : Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isPremium
              ? c.primary.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isPremium) ...[
            Icon(Icons.lock_rounded, size: 11, color: Colors.white54),
            const SizedBox(width: 3),
          ],
          Text(
            'PRO',
            style: TextStyle(
              color: isPremium ? c.primary : Colors.white54,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
