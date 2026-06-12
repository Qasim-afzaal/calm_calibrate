import 'dart:math' as math;

import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:flutter/material.dart';

/// Animated desk-worker figure demonstrating the current exercise move.
class ExercisePoseAnimation extends StatefulWidget {
  ExercisePoseAnimation({
    super.key,
    required this.pose,
    this.active = true,
    this.size = 220,
  });

  static bool globallyEnabled = true;

  final ExercisePose pose;
  final bool active;
  final double size;

  @override
  State<ExercisePoseAnimation> createState() => _ExercisePoseAnimationState();
}

class _ExercisePoseAnimationState extends State<ExercisePoseAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _setupController();
  }

  @override
  void didUpdateWidget(ExercisePoseAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller == null) return;
    if (widget.active && !_controller!.isAnimating) {
      LoopAnimation.repeatLinear(_controller!);
    } else if (!widget.active) {
      _controller!.stop();
    }
  }

  void _setupController() {
    if (!ExercisePoseAnimation.globallyEnabled) return;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    if (widget.active) LoopAnimation.repeatLinear(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: DeskWorkerPosePainter(
            pose: widget.pose,
            progress: 0.25,
          ),
        ),
      );
    }

    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, _) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: DeskWorkerPosePainter(
              pose: widget.pose,
              progress: _controller!.value,
            ),
          ),
        );
      },
    );
  }
}

class DeskWorkerPosePainter extends CustomPainter {
  DeskWorkerPosePainter({
    required this.pose,
    required this.progress,
  });

  final ExercisePose pose;
  final double progress;

  static const _skin = Color(0xFFE8B896);
  static const _skinShadow = Color(0xFFD4A07A);
  static const _shirt = Color(0xFF4A6FA5);
  static const _pants = Color(0xFF2D3F5C);
  static const _desk = Color(0xFFD4C4B0);
  static const _chair = Color(0xFF8E99A8);
  static const _hair = Color(0xFF3D2B1F);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.56);
    final scale = size.width / 220;
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(scale);

    final layout = _layoutForPose(progress);

    _drawDesk(canvas, layout);
    _drawChair(canvas, layout);

    switch (layout.mode) {
      case _FigureMode.profileSeated:
        _drawProfileSeated(canvas, layout);
      case _FigureMode.frontSeated:
        _drawFrontSeated(canvas, layout);
      case _FigureMode.standing:
        _drawStanding(canvas, layout);
      case _FigureMode.folded:
        _drawFolded(canvas, layout);
    }

    _drawMotionGuide(canvas, layout);
    canvas.restore();
  }

  _FigureLayout _layoutForPose(double t) {
    final phase = t;
    final wave = LoopAnimation.sineWave(phase);
    final pulse = LoopAnimation.pulse(phase);

    switch (pose) {
      case ExercisePose.neckRoll:
        final roll = phase * 2 * math.pi;
        final headAngle = math.sin(roll) * 0.55 + math.sin(roll * 2) * 0.25;
        return _FigureLayout.profileSeated(
          headAngle: headAngle,
          hint: 'Chin down → roll ear to ear',
          guide: _MotionGuide.neckCircle,
        );

      case ExercisePose.neckSideRelease:
        return _FigureLayout.profileSeated(
          headAngle: wave * 0.72,
          hint: 'Tilt ear toward each shoulder',
          guide: _MotionGuide.neckTilt,
          tiltSide: wave,
        );

      case ExercisePose.shoulderShrug:
        return _FigureLayout.frontSeated(
          shoulderLift: 6 + pulse * 12,
          hint: 'Lift shoulders to ears, hold, release',
          guide: _MotionGuide.shoulderUp,
        );

      case ExercisePose.seatedTwist:
        return _FigureLayout.frontSeated(
          torsoTurn: wave * 0.42,
          headTurn: wave * 0.18,
          armReach: wave * 22,
          hint: 'Twist from waist, hips stay forward',
          guide: _MotionGuide.twist,
          twistDir: wave > 0 ? 1.0 : -1.0,
        );

      case ExercisePose.chestOpener:
        return _FigureLayout.frontSeated(
          armBack: 0.4 + pulse * 0.9,
          chestLift: pulse * 10,
          hint: 'Clasp hands behind back, open chest',
          guide: _MotionGuide.chestOpen,
        );

      case ExercisePose.seatedCatCow:
        return _FigureLayout.profileSeated(
          spineCurve: wave * 0.55,
          hint: 'Arch and round spine with your breath',
          guide: wave >= 0 ? _MotionGuide.spineArch : _MotionGuide.spineRound,
        );

      case ExercisePose.hipFlexorStretch:
        return _FigureLayout.standing(
          lunge: 0.35 + pulse * 0.45,
          hint: 'Step back, gentle forward lean',
          guide: _MotionGuide.lunge,
        );

      case ExercisePose.standingBackExtension:
        return _FigureLayout.standing(
          backArch: pulse * 0.42,
          hint: 'Hands on lower back, lean back gently',
          guide: _MotionGuide.backArch,
        );

      case ExercisePose.thoracicExtension:
        return _FigureLayout.profileSeated(
          spineCurve: 0.25 + pulse * 0.45,
          armUp: 0.5 + pulse * 0.8,
          headAngle: -0.12 - pulse * 0.15,
          hint: 'Hands behind head, arch upper back',
          guide: _MotionGuide.thoracicArch,
        );

      case ExercisePose.figure4Stretch:
        return _FigureLayout.frontSeated(
          legCross: 0.4 + pulse * 0.6,
          leanForward: pulse * 18,
          hint: 'Ankle on opposite knee, lean in',
          guide: _MotionGuide.figure4,
        );

      case ExercisePose.childPoseChair:
        return _FigureLayout.folded(
          fold: 0.55 + pulse * 0.25,
          hint: 'Fold forward over knees, relax neck',
          guide: _MotionGuide.fold,
        );

      case ExercisePose.deepBreathing:
        return _FigureLayout.frontSeated(
          breathScale: 1 + pulse * 0.08,
          shoulderLift: pulse * 3,
          hint: 'Breathe in 4 · out 6',
          guide: _MotionGuide.breathe,
        );

      case ExercisePose.deskStretch:
        return _FigureLayout.frontSeated(
          armReach: wave * 24,
          hint: 'Follow the movement shown',
          guide: _MotionGuide.reach,
        );
    }
  }

  // ── Environment ───────────────────────────────────────────────────

  void _drawDesk(Canvas canvas, _FigureLayout layout) {
    final deskY = layout.deskY;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-82, deskY, 164, 11),
        Radius.circular(4),
      ),
      Paint()..color = _desk,
    );
    for (final x in [-66.0, 56.0]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, deskY + 8, 9, 38),
          Radius.circular(2),
        ),
        Paint()..color = _desk.withValues(alpha: 0.9),
      );
    }
    // Monitor
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-18, deskY - 36, 36, 28),
        Radius.circular(3),
      ),
      Paint()..color = Color(0xFF2A3A52),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-10, deskY - 8, 20, 8),
        Radius.circular(2),
      ),
      Paint()..color = Color(0xFF3D4F68),
    );
  }

  void _drawChair(Canvas canvas, _FigureLayout layout) {
    final seatY = layout.seatY;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-36, seatY, 72, 9),
        Radius.circular(5),
      ),
      Paint()..color = _chair,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-38, seatY - 48, 10, 56),
        Radius.circular(4),
      ),
      Paint()..color = _chair.withValues(alpha: 0.85),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-40, seatY - 52, 14, 50),
        Radius.circular(5),
      ),
      Paint()..color = _chair.withValues(alpha: 0.55),
    );
  }

  // ── Profile seated (best for neck / spine) ────────────────────────

  void _drawProfileSeated(Canvas canvas, _FigureLayout layout) {
    // Facing right toward monitor — clear neck & head position
    final pivot = Offset(18, -18); // base of neck
    final facing = 1.0; // right

    // Legs (profile)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 4, 34, 14),
        Radius.circular(6),
      ),
      Paint()..color = _pants,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-8, 16, 16, 30),
        Radius.circular(6),
      ),
      Paint()..color = _pants.withValues(alpha: 0.95),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(14, 16, 16, 30),
        Radius.circular(6),
      ),
      Paint()..color = _pants,
    );

    // Torso profile
    final spinePaint = Paint()..color = _shirt;
    final torsoPath = Path()
      ..moveTo(-6, 0)
      ..lineTo(-10, -38 - layout.spineCurve * 14)
      ..lineTo(28, -40 - layout.spineCurve * 14)
      ..lineTo(32, 0)
      ..close();
    canvas.drawPath(torsoPath, spinePaint);

    // Spine highlight for cat-cow
    if (layout.spineCurve.abs() > 0.08) {
      final curve = Paint()
        ..color = AppColorTokens.light.primary.withValues(alpha: 0.45)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      final spine = Path()
        ..moveTo(10, -4)
        ..quadraticBezierTo(
          10 + layout.spineCurve * 22,
          -22,
          12,
          -36 - layout.spineCurve * 10,
        );
      canvas.drawPath(spine, curve);
    }

    // Arm on desk
    _drawLimb(
      canvas,
      from: Offset(20, -20),
      mid: Offset(38, -6 + layout.deskY + 18),
      to: Offset(52, layout.deskY + 2),
      color: _skin,
    );
    // Arm behind head (thoracic extension)
    if (layout.armUp > 0) {
      _drawLimb(
        canvas,
        from: Offset(14, -34 - layout.spineCurve * 10),
        mid: Offset(-4, -52 - layout.armUp * 16),
        to: Offset(-14, -44 - layout.armUp * 20),
        color: _skin,
      );
    } else {
      _drawLimb(
        canvas,
        from: Offset(10, -18),
        mid: Offset(24, -8),
        to: Offset(34, layout.deskY - 2),
        color: _skin,
      );
    }

    // Neck + head (rotates from pivot — actual neck roll)
    canvas.save();
    canvas.translate(pivot.dx, pivot.dy);
    canvas.rotate(layout.headAngle * facing);

    // Neck
    final neckPath = Path()
      ..moveTo(-4, 0)
      ..lineTo(-6, -14)
      ..lineTo(6, -14)
      ..lineTo(4, 0)
      ..close();
    canvas.drawPath(neckPath, Paint()..color = _skinShadow);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-2, -16, 4, 4),
        Radius.circular(2),
      ),
      Paint()..color = _skin.withValues(alpha: 0.6),
    );

    // Head profile (ellipse — reads as real side view)
    canvas.save();
    canvas.translate(0, -26);
    _drawHeadProfile(canvas, facing: facing, tilt: layout.headAngle);
    canvas.restore();

    canvas.restore();

    // Shoulders
    canvas.drawLine(
      Offset(0, -16),
      Offset(30, -20 - layout.spineCurve * 8),
      Paint()
        ..color = _shirt.withValues(alpha: 0.8)
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );
  }

  // ── Front seated ──────────────────────────────────────────────────

  void _drawFrontSeated(Canvas canvas, _FigureLayout layout) {
    final breath = layout.breathScale;
    final shoulderY = -22 - layout.shoulderLift;

    // Legs
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-26, 10, 20, 34),
        Radius.circular(7),
      ),
      Paint()..color = _pants,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(6, 10, 20, 34),
        Radius.circular(7),
      ),
      Paint()..color = _pants,
    );

    if (layout.legCross > 0) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(-10, 14, 38 * layout.legCross, 11),
          Radius.circular(5),
        ),
        Paint()..color = _pants.withValues(alpha: 0.9),
      );
    }

    // Torso
    canvas.save();
    canvas.translate(0, -6 - layout.leanForward * 0.3);
    canvas.rotate(layout.torsoTurn);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(0, shoulderY - 14),
          width: 46 * breath,
          height: 48 * breath,
        ),
        Radius.circular(11),
      ),
      Paint()..color = _shirt,
    );

    // Shoulders bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(0, shoulderY),
          width: 52,
          height: 10 + layout.shoulderLift * 0.4,
        ),
        Radius.circular(5),
      ),
      Paint()..color = _shirt.withValues(alpha: 0.85),
    );

    _drawFrontArms(canvas, layout, shoulderY: shoulderY);
    canvas.restore();

    // Neck
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(layout.headTurn * 8, shoulderY - 26),
          width: 12,
          height: 16,
        ),
        Radius.circular(4),
      ),
      Paint()..color = _skinShadow,
    );

    // Head
    canvas.save();
    canvas.translate(layout.headTurn * 10, shoulderY - 38 - layout.chestLift);
    canvas.rotate(layout.headTurn * 0.35);
    _drawHeadFront(canvas, radius: 17 * breath);
    canvas.restore();
  }

  void _drawFrontArms(Canvas canvas, _FigureLayout layout, {required double shoulderY}) {
    if (layout.armBack > 0) {
      _drawLimb(
        canvas,
        from: Offset(-20, shoulderY - 4),
        mid: Offset(-30, shoulderY + 10 + layout.armBack * 10),
        to: Offset(-22, shoulderY + 22 + layout.armBack * 14),
        color: _skin,
      );
      _drawLimb(
        canvas,
        from: Offset(20, shoulderY - 4),
        mid: Offset(30, shoulderY + 10 + layout.armBack * 10),
        to: Offset(22, shoulderY + 22 + layout.armBack * 14),
        color: _skin,
      );
      return;
    }

    final reach = layout.armReach;
    _drawLimb(
      canvas,
      from: Offset(-20, shoulderY),
      mid: Offset(-34 - reach, shoulderY + 8),
      to: Offset(-42 - reach, layout.deskY + 2),
      color: _skin,
    );
    _drawLimb(
      canvas,
      from: Offset(20, shoulderY),
      mid: Offset(34 + reach * 0.3, shoulderY + 4),
      to: Offset(40, layout.deskY + 2),
      color: _skin,
    );
  }

  // ── Standing ──────────────────────────────────────────────────────

  void _drawStanding(Canvas canvas, _FigureLayout layout) {
    canvas.save();
    canvas.translate(-10, 8);

    final lunge = layout.lunge;
    final frontLen = 46 + lunge * 18;

    // Back leg
    _drawLimb(
      canvas,
      from: Offset(8, 0),
      mid: Offset(2, -frontLen * 0.45),
      to: Offset(6, -frontLen),
      color: _pants,
      width: 14,
    );
    // Front leg bent
    _drawLimb(
      canvas,
      from: Offset(-6, 0),
      mid: Offset(-14, -frontLen * 0.55),
      to: Offset(-8, -frontLen * 0.85),
      color: _pants,
      width: 14,
    );

    canvas.save();
    canvas.translate(-4, -frontLen * 0.82);
    canvas.rotate(layout.backArch);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(0, -22), width: 40, height: 46),
        Radius.circular(10),
      ),
      Paint()..color = _shirt,
    );
    _drawLimb(
      canvas,
      from: Offset(-16, -28),
      mid: Offset(-24, -14),
      to: Offset(-18, 2),
      color: _skin,
    );
    _drawLimb(
      canvas,
      from: Offset(16, -28),
      mid: Offset(22, -12),
      to: Offset(16, 2),
      color: _skin,
    );

    canvas.save();
    canvas.translate(0, -48);
    canvas.rotate(layout.backArch * 0.6);
    _drawHeadProfile(canvas, facing: 1, tilt: layout.backArch * 0.3);
    canvas.restore();

    canvas.restore();
    canvas.restore();
  }

  // ── Folded ────────────────────────────────────────────────────────

  void _drawFolded(Canvas canvas, _FigureLayout layout) {
    final fold = layout.fold;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-28, 8, 22, 34),
        Radius.circular(7),
      ),
      Paint()..color = _pants,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(6, 8, 22, 34),
        Radius.circular(7),
      ),
      Paint()..color = _pants,
    );

    canvas.save();
    canvas.translate(0, 4);
    canvas.rotate(1.05 * fold);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(0, -8), width: 48, height: 42),
        Radius.circular(10),
      ),
      Paint()..color = _shirt,
    );
    _drawLimb(
      canvas,
      from: Offset(-18, 2),
      mid: Offset(-28, 18),
      to: Offset(-20, 30),
      color: _skin,
    );
    _drawLimb(
      canvas,
      from: Offset(18, 2),
      mid: Offset(8, 20),
      to: Offset(4, 32),
      color: _skin,
    );
    canvas.restore();

    canvas.save();
    canvas.translate(26 * fold, 8);
    canvas.rotate(0.55 * fold);
    _drawHeadProfile(canvas, facing: 1, tilt: 0.2);
    canvas.restore();
  }

  // ── Head drawing ──────────────────────────────────────────────────

  void _drawHeadProfile(Canvas canvas, {required double facing, double tilt = 0}) {
    canvas.save();
    canvas.rotate(tilt * 0.3);

    // Skull profile — oval reads clearly as side of head
    final headRect = Rect.fromCenter(
      center: Offset(4 * facing, 0),
      width: 30,
      height: 34,
    );
    canvas.drawOval(headRect, Paint()..color = _skin);

    // Hair
    canvas.drawPath(
      Path()
        ..moveTo(-10, -6)
        ..quadraticBezierTo(0, -20, 14, -12)
        ..lineTo(12, -4)
        ..quadraticBezierTo(0, -10, -8, -2)
        ..close(),
      Paint()..color = _hair,
    );

    // Ear — makes tilt direction obvious
    canvas.drawOval(
      Rect.fromCenter(center: Offset(-10, 2), width: 7, height: 10),
      Paint()..color = _skinShadow,
    );

    // Nose
    canvas.drawPath(
      Path()
        ..moveTo(14, 0)
        ..lineTo(20, 4)
        ..lineTo(14, 6)
        ..close(),
      Paint()..color = _skinShadow,
    );

    // Eye
    canvas.drawCircle(
      Offset(6, -2),
      2.2,
      Paint()..color = Color(0xFF4A3728),
    );

    canvas.restore();
  }

  void _drawHeadFront(Canvas canvas, {double radius = 17}) {
    canvas.drawCircle(Offset.zero, radius, Paint()..color = _skin);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, -2), radius: radius + 1),
      math.pi,
      math.pi,
      true,
      Paint()..color = _hair,
    );
    canvas.drawCircle(Offset(-5, 0), 2.2, Paint()..color = Color(0xFF4A3728));
    canvas.drawCircle(Offset(5, 0), 2.2, Paint()..color = Color(0xFF4A3728));
    // Ears for side-tilt readability
    canvas.drawOval(
      Rect.fromCenter(center: Offset(-radius, 0), width: 6, height: 9),
      Paint()..color = _skinShadow,
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(radius, 0), width: 6, height: 9),
      Paint()..color = _skinShadow,
    );
  }

  void _drawLimb(
    Canvas canvas, {
    required Offset from,
    required Offset mid,
    required Offset to,
    required Color color,
    double width = 9,
  }) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(from.dx, from.dy)
      ..quadraticBezierTo(mid.dx, mid.dy, to.dx, to.dy);
    canvas.drawPath(path, paint);

    canvas.drawCircle(to, width * 0.45, Paint()..color = color);
  }

  // ── Motion guides (show actual movement path) ─────────────────────

  void _drawMotionGuide(Canvas canvas, _FigureLayout layout) {
    final paint = Paint()
      ..color = AppColorTokens.light.primary.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;

    switch (layout.guide) {
      case _MotionGuide.neckCircle:
        canvas.drawArc(
          Rect.fromCenter(center: Offset(30, -42), width: 44, height: 44),
          -0.4,
          2.4,
          false,
          paint,
        );
        _drawArrowHead(canvas, Offset(48, -30), 0.6, paint);
      case _MotionGuide.neckTilt:
        final dir = layout.tiltSide.clamp(-1.0, 1.0);
        canvas.drawLine(
          Offset(30, -52),
          Offset(30 + dir * 16, -36),
          paint,
        );
        _drawArrowHead(canvas, Offset(30 + dir * 16, -36), dir * 0.8, paint);
      case _MotionGuide.shoulderUp:
        for (final x in [-14.0, 14.0]) {
          canvas.drawLine(Offset(x, -30), Offset(x, -46), paint);
          _drawArrowHead(canvas, Offset(x, -46), -math.pi / 2, paint);
        }
      case _MotionGuide.twist:
        canvas.drawArc(
          Rect.fromCenter(center: Offset(0, -20), width: 50, height: 30),
          layout.twistDir > 0 ? -0.3 : 2.5,
          layout.twistDir * 0.8,
          false,
          paint,
        );
      case _MotionGuide.chestOpen:
        canvas.drawLine(Offset(-20, -10), Offset(-20, -34), paint);
        canvas.drawLine(Offset(20, -10), Offset(20, -34), paint);
      case _MotionGuide.spineArch:
      case _MotionGuide.thoracicArch:
        final path = Path()
          ..moveTo(14, -8)
          ..quadraticBezierTo(0, -36, 14, -52);
        canvas.drawPath(path, paint);
      case _MotionGuide.spineRound:
        final path = Path()
          ..moveTo(14, -8)
          ..quadraticBezierTo(28, -24, 14, -38);
        canvas.drawPath(path, paint);
      case _MotionGuide.lunge:
        canvas.drawLine(Offset(-20, 8), Offset(-20, -30), paint);
        _drawArrowHead(canvas, Offset(-20, -30), -math.pi / 2, paint);
      case _MotionGuide.backArch:
        canvas.drawArc(
          Rect.fromCenter(center: Offset(-4, -38), width: 36, height: 36),
          math.pi * 0.15,
          math.pi * 0.35,
          false,
          paint,
        );
      case _MotionGuide.figure4:
        canvas.drawLine(Offset(-4, 18), Offset(16, 10), paint);
      case _MotionGuide.fold:
        canvas.drawLine(Offset(20, -8), Offset(36, 16), paint);
        _drawArrowHead(canvas, Offset(36, 16), 0.5, paint);
      case _MotionGuide.breathe:
        canvas.drawCircle(
          Offset(0, -28),
          28,
          paint..strokeWidth = 1.8,
        );
      case _MotionGuide.reach:
        canvas.drawLine(Offset(30, -16), Offset(54, -8), paint);
        _drawArrowHead(canvas, Offset(54, -8), 0.2, paint);
      case _MotionGuide.none:
        break;
    }
  }

  void _drawArrowHead(Canvas canvas, Offset tip, double angle, Paint paint) {
    final path = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        tip.dx - 8 * math.cos(angle - 0.5),
        tip.dy - 8 * math.sin(angle - 0.5),
      )
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        tip.dx - 8 * math.cos(angle + 0.5),
        tip.dy - 8 * math.sin(angle + 0.5),
      );
    canvas.drawPath(path, paint..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(DeskWorkerPosePainter oldDelegate) =>
      oldDelegate.pose != pose || oldDelegate.progress != progress;
}

enum _FigureMode { profileSeated, frontSeated, standing, folded }

enum _MotionGuide {
  none,
  neckCircle,
  neckTilt,
  shoulderUp,
  twist,
  chestOpen,
  spineArch,
  spineRound,
  thoracicArch,
  lunge,
  backArch,
  figure4,
  fold,
  breathe,
  reach,
}

class _FigureLayout {
  _FigureLayout({
    required this.mode,
    this.headAngle = 0,
    this.headTurn = 0,
    this.torsoTurn = 0,
    this.shoulderLift = 0,
    this.armReach = 0,
    this.armBack = 0,
    this.armUp = 0,
    this.spineCurve = 0,
    this.chestLift = 0,
    this.leanForward = 0,
    this.legCross = 0,
    this.lunge = 0,
    this.backArch = 0,
    this.fold = 0.5,
    this.breathScale = 1,
    this.tiltSide = 1,
    this.twistDir = 1,
    this.hint = '',
    this.guide = _MotionGuide.none,
    this.deskY = -4,
    this.seatY = 28,
  });

  factory _FigureLayout.profileSeated({
    double headAngle = 0,
    double spineCurve = 0,
    double armUp = 0,
    String hint = '',
    _MotionGuide guide = _MotionGuide.none,
    double tiltSide = 1,
  }) {
    return _FigureLayout(
      mode: _FigureMode.profileSeated,
      headAngle: headAngle,
      spineCurve: spineCurve,
      armUp: armUp,
      hint: hint,
      guide: guide,
      tiltSide: tiltSide,
    );
  }

  factory _FigureLayout.frontSeated({
    double headTurn = 0,
    double torsoTurn = 0,
    double shoulderLift = 0,
    double armReach = 0,
    double armBack = 0,
    double spineCurve = 0,
    double chestLift = 0,
    double leanForward = 0,
    double legCross = 0,
    double breathScale = 1,
    String hint = '',
    _MotionGuide guide = _MotionGuide.none,
    double twistDir = 1,
  }) {
    return _FigureLayout(
      mode: _FigureMode.frontSeated,
      headTurn: headTurn,
      torsoTurn: torsoTurn,
      shoulderLift: shoulderLift,
      armReach: armReach,
      armBack: armBack,
      spineCurve: spineCurve,
      chestLift: chestLift,
      leanForward: leanForward,
      legCross: legCross,
      breathScale: breathScale,
      hint: hint,
      guide: guide,
      twistDir: twistDir,
    );
  }

  factory _FigureLayout.standing({
    double lunge = 0,
    double backArch = 0,
    String hint = '',
    _MotionGuide guide = _MotionGuide.none,
  }) {
    return _FigureLayout(
      mode: _FigureMode.standing,
      lunge: lunge,
      backArch: backArch,
      hint: hint,
      guide: guide,
      deskY: 20,
      seatY: 40,
    );
  }

  factory _FigureLayout.folded({
    double fold = 0.5,
    String hint = '',
    _MotionGuide guide = _MotionGuide.none,
  }) {
    return _FigureLayout(
      mode: _FigureMode.folded,
      fold: fold,
      hint: hint,
      guide: guide,
    );
  }

  final _FigureMode mode;
  final double headAngle;
  final double headTurn;
  final double torsoTurn;
  final double shoulderLift;
  final double armReach;
  final double armBack;
  final double armUp;
  final double spineCurve;
  final double chestLift;
  final double leanForward;
  final double legCross;
  final double lunge;
  final double backArch;
  final double fold;
  final double breathScale;
  final double tiltSide;
  final double twistDir;
  final String hint;
  final _MotionGuide guide;
  final double deskY;
  final double seatY;
}
