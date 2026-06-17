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

  final IconData icon;
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
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 60),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: c.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SessionIcon(
              icon: icon,
              muted: isLocked,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 1.25,
                      color: isLocked ? c.textMuted : c.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$durationMinutes min · $subtitle',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      color: c.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            if (isLocked) ...[
              const SizedBox(width: 6),
              _ProBadge(),
            ],
            const SizedBox(width: 8),
            Icon(
              isLocked
                  ? Icons.lock_rounded
                  : isCompleted
                      ? Icons.check_circle
                      : Icons.play_circle_fill,
              size: 22,
              color: isLocked
                  ? c.textMuted
                  : isCompleted
                      ? c.success
                      : c.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionIcon extends StatelessWidget {
  const _SessionIcon({
    required this.icon,
    required this.muted,
  });

  final IconData icon;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: muted ? c.border.withValues(alpha: 0.35) : c.primaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 18,
        color: muted ? c.textMuted : c.primary,
      ),
    );
  }
}

class _ProBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
    );
  }
}
