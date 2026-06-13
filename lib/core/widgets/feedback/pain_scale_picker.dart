import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// 1–5 pain scale — check-in, pre/post workout.
class PainScalePicker extends StatelessWidget {
  PainScalePicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.lowLabel = 'Great',
    this.highLabel = 'Bad',
  });

  final int value;
  final ValueChanged<int> onChanged;
  final String lowLabel;
  final String highLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (i) {
        final score = i + 1;
        final selected = value == score;
        return ScaleTap(
          onTap: () => onChanged(score),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: selected ? c.primary : c.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? c.primary : c.border,
                    width: selected ? 2 : 1,
                  ),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: c.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    '$score',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : c.textPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                score == 1
                    ? lowLabel
                    : score == 5
                        ? highLabel
                        : '',
                style: TextStyle(fontSize: 11, color: c.textMuted),
              ),
            ],
          ),
        );
      }),
    );
  }
}
