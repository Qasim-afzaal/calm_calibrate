import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// One step in the 30-day journey timeline.
class JourneyTimelineTile extends StatelessWidget {
  JourneyTimelineTile({
    super.key,
    required this.day,
    required this.title,
    required this.action,
    required this.isPast,
    required this.isCurrent,
    required this.isLast,
    this.milestone,
    this.onTap,
  });

  final int day;
  final String title;
  final String action;
  final bool isPast;
  final bool isCurrent;
  final bool isLast;
  final String? milestone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isCurrent
                      ? c.primary
                      : isPast
                          ? c.successLight
                          : c.border,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isPast
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: c.success,
                        )
                      : Text(
                          '$day',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: isCurrent
                                ? Colors.white
                                : c.textMuted,
                          ),
                        ),
                ),
              ),
              if (!isLast)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 2,
                  height: 28,
                  color: isPast ? c.success : c.border,
                ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: ScaleTap(
              onTap: isCurrent || isPast ? onTap : null,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isCurrent ? c.primaryLight : c.surface,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  border: Border.all(
                    color: isCurrent ? c.primary : c.border,
                    width: isCurrent ? 1.5 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: isCurrent
                                  ? c.primary
                                  : c.textPrimary,
                            ),
                          ),
                        ),
                        if (milestone != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.emoji_events_outlined,
                              size: 16,
                              color: c.primary,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      action,
                      style: TextStyle(
                        fontSize: 13,
                        color: c.textMuted,
                      ),
                    ),
                    if (milestone != null) ...[
                      SizedBox(height: 6),
                      Text(
                        milestone!,
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
            ),
          ),
        ],
      ),
    );
  }
}
