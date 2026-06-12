import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Reusable session / program row — home, sessions library.
class SessionCard extends StatelessWidget {
  SessionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.durationMinutes,
    required this.onTap,
    this.isCompleted = false,
    this.isLocked = false,
  });

  final String icon;
  final String title;
  final String subtitle;
  final int durationMinutes;
  final VoidCallback onTap;
  final bool isCompleted;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return ScaleTap(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: c.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: c.border),
            ),
            child: Row(
              children: [
                Text(icon, style: TextStyle(fontSize: 28)),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: isLocked
                              ? c.textMuted
                              : c.textPrimary,
                        ),
                      ),
                      Text(
                        '$durationMinutes min · $subtitle',
                        style: TextStyle(
                          fontSize: 13,
                          color: c.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  isLocked
                      ? Icons.lock_rounded
                      : isCompleted
                          ? Icons.check_circle
                          : Icons.play_circle_fill,
                  color: isLocked
                      ? c.textMuted
                      : isCompleted
                          ? c.success
                          : c.primary,
                ),
              ],
            ),
          ),
          if (isLocked)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
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
            ),
        ],
      ),
    );
  }
}
