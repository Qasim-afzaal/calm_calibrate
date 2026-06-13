import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Clean trial indicator — matches navy/orange paywall theme.
class PaywallTrialStatus extends StatelessWidget {
  PaywallTrialStatus({
    super.key,
    required this.daysLeft,
    this.totalDays = 7,
  });

  final int daysLeft;
  final int totalDays;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final used = (totalDays - daysLeft).clamp(0, totalDays);
    final progress = used / totalDays;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            height: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 3,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    color: c.primary,
                  ),
                ),
                Text(
                  'PRO',
                  style: TextStyle(
                    color: c.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free trial active',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '$daysLeft of $totalDays days remaining',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          _DayDots(used: used, total: totalDays),
        ],
      ),
    );
  }
}

class _DayDots extends StatelessWidget {
  _DayDots({required this.used, required this.total});

  final int used;
  final int total;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        final filled = i < used;
        return Container(
          width: 6,
          height: 6,
          margin: EdgeInsets.only(left: 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled
                ? c.primary
                : Colors.white.withValues(alpha: 0.2),
          ),
        );
      }),
    );
  }
}
