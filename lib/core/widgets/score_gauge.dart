import 'dart:math' as math;

import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

class ScoreGauge extends StatelessWidget {
  const ScoreGauge({
    super.key,
    required this.score,
    this.maxScore = 100,
    this.size = 200,
  });

  final int score;
  final int maxScore;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final progress = (score / maxScore).clamp(0.0, 1.0);
    final scoreFontSize = size * 0.19;
    final maxFontSize = size * 0.12;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _GaugePainter(progress: progress, colors: c, size: size),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$score',
                style: TextStyle(
                  fontSize: scoreFontSize,
                  fontWeight: FontWeight.w800,
                  color: c.textPrimary,
                  height: 1,
                ),
              ),
              Text(
                '/ $maxScore',
                style: TextStyle(
                  fontSize: maxFontSize,
                  color: c.textMuted,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.progress,
    required this.colors,
    required this.size,
  });

  final double progress;
  final AppColorTokens colors;
  final double size;

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);
    final stroke = size * 0.07;
    final inset = size * 0.06;
    final radius = canvasSize.width / 2 - inset;
    final startAngle = math.pi * 0.75;
    final sweepAngle = math.pi * 1.5;

    final bgPaint = Paint()
      ..color = colors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    final fgPaint = Paint()
      ..shader = SweepGradient(
        colors: [colors.scoreLow, colors.scoreMid, colors.scoreHigh],
        stops: const [0.0, 0.5, 1.0],
        startAngle: startAngle,
        endAngle: startAngle + sweepAngle,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      bgPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.colors != colors;
  }
}
