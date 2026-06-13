import 'dart:math' as math;

import 'package:calm_calibrate/core/animations/breathe_animation.dart';
import 'package:calm_calibrate/core/animations/float_animation.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Animated desk-wellness hero — slouch → stretch loop for paywall.
class PaywallHero extends StatefulWidget {
  PaywallHero({super.key});

  static bool globallyEnabled = true;

  @override
  State<PaywallHero> createState() => _PaywallHeroState();
}

class _PaywallHeroState extends State<PaywallHero>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    if (!PaywallHero.globallyEnabled) return;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3600),
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final progress = _controller?.value ?? 0.35;

    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Relief particles rising
          if (PaywallHero.globallyEnabled && _controller != null)
            ...List.generate(6, (i) {
              final phase = (progress + i * 0.15) % 1.0;
              final x = -80.0 + i * 32.0;
              return Positioned(
                left: MediaQuery.sizeOf(context).width / 2 + x - 24,
                bottom: 40 + phase * 90,
                child: Opacity(
                  opacity: (1 - phase).clamp(0.0, 0.7),
                  child: Icon(
                    i.isEven ? Icons.spa_outlined : Icons.bolt,
                    size: 14,
                    color: c.primary.withValues(alpha: 0.6),
                  ),
                ),
              );
            }),
          FloatAnimation(
            distance: 6,
            child: BreatheAnimation(
              minScale: 0.96,
              maxScale: 1.0,
              duration: Duration(milliseconds: 2800),
              child: CustomPaint(
                size: Size(220, 140),
                painter: _DeskStretchPainter(progress: progress),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeskStretchPainter extends CustomPainter {
  _DeskStretchPainter({required this.progress});

  final double progress;

  // 0→0.5 slouch, 0.5→1 stretch upright
  double get _relief {
    if (progress < 0.5) return progress * 2;
    return 1 - (progress - 0.5) * 2;
  }

  double get _stretch {
    if (progress < 0.5) return (progress - 0.5) * 2;
    return (progress - 0.5) * 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final deskY = size.height * 0.72;

    // Desk
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, deskY), width: 160, height: 8),
        Radius.circular(3),
      ),
      Paint()..color = Color(0xFF4A5A72),
    );
    // Monitor
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, deskY - 36),
          width: 56,
          height: 40,
        ),
        Radius.circular(4),
      ),
      Paint()..color = Color(0xFF2A3A52),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, deskY - 12), width: 20, height: 6),
        Radius.circular(2),
      ),
      Paint()..color = Color(0xFF3D4F68),
    );

    // Chair
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 28, deskY - 4, 56, 6),
        Radius.circular(3),
      ),
      Paint()..color = Color(0xFF5C6B7E),
    );

    final slouch = Curves.easeInOut.transform(_relief.clamp(0.0, 1.0));
    final stretch = Curves.easeInOut.transform(_stretch.clamp(0.0, 1.0));
    final spineAngle = slouch * 0.35 - stretch * 0.08;
    final armRaise = stretch * 28;

    canvas.save();
    canvas.translate(cx, deskY - 20);

    // Torso
    canvas.save();
    canvas.rotate(spineAngle);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(0, -28 - stretch * 6),
          width: 36,
          height: 44,
        ),
        Radius.circular(8),
      ),
      Paint()..color = Color(0xFF4A6FA5),
    );

    // Arms — rise on stretch (desk worker relief pose)
    final armPaint = Paint()
      ..color = Color(0xFFE8B896)
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(-14, -32),
      Offset(-22 - armRaise * 0.3, -48 - armRaise),
      armPaint,
    );
    canvas.drawLine(
      Offset(14, -32),
      Offset(22 + armRaise * 0.3, -48 - armRaise),
      armPaint,
    );
    canvas.restore();

    // Head
    canvas.save();
    canvas.translate(0, -58 - stretch * 8);
    canvas.rotate(spineAngle * 0.6);
    canvas.drawCircle(
      Offset.zero,
      14,
      Paint()..color = Color(0xFFE8B896),
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, -2), radius: 15),
      math.pi,
      math.pi,
      true,
      Paint()..color = Color(0xFF3D2B1F),
    );
    canvas.restore();

    canvas.restore();

    // Relief glow when stretching
    if (stretch > 0.1) {
      canvas.drawCircle(
        Offset(cx, deskY - 70),
        30 + stretch * 20,
        Paint()
          ..color = AppColorTokens.light.primary.withValues(alpha: 0.12 * stretch)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 12),
      );
    }
  }

  @override
  bool shouldRepaint(_DeskStretchPainter old) => old.progress != progress;
}
