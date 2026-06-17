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
    this.showEdgeLabels = true,
    this.showConnector = false,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final String lowLabel;
  final String highLabel;
  final bool showEdgeLabels;
  final bool showConnector;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;

    Widget circleCell(int score) {
      final selected = value == score;
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ScaleTap(
            onTap: () => onChanged(score),
            child: AspectRatio(
              aspectRatio: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
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
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    '$score',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: selected ? Colors.white : c.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    final circles = Row(
      children: List.generate(5, (i) => circleCell(i + 1)),
    );

    if (!showConnector) {
      return Row(
        children: List.generate(5, (i) {
          final score = i + 1;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ScaleTap(
                onTap: () => onChanged(score),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: _circle(context, score),
                    ),
                    if (showEdgeLabels) ...[
                      const SizedBox(height: 4),
                      _edgeLabel(context, score),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      );
    }

    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final cellW = constraints.maxWidth / 5;
            final diameter = cellW - 6;
            final trackLeft = cellW / 2;
            final trackRight = cellW / 2;
            final trackWidth = constraints.maxWidth - trackLeft - trackRight;
            final fillWidth = trackWidth * ((value - 1) / 4);

            return SizedBox(
              height: diameter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: trackLeft,
                    right: trackRight,
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: c.border,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Positioned(
                    left: trackLeft,
                    width: fillWidth,
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [c.scoreHigh, c.primary],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  circles,
                ],
              ),
            );
          },
        ),
        if (showEdgeLabels)
          Row(
            children: List.generate(5, (i) {
              final score = i + 1;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: _edgeLabel(context, score),
                  ),
                ),
              );
            }),
          ),
      ],
    );
  }

  Widget _circle(BuildContext context, int score) {
    final c = context.appColors;
    final selected = value == score;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          '$score',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: selected ? Colors.white : c.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _edgeLabel(BuildContext context, int score) {
    final c = context.appColors;
    return Text(
      score == 1
          ? lowLabel
          : score == 5
              ? highLabel
              : '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11, color: c.textMuted),
    );
  }
}
