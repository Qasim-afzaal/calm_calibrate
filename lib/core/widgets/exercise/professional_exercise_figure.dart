import 'dart:math' as math;

import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:flutter/material.dart';

/// Polished waist-up / full-body vector figure for workout steps.
class ProfessionalExerciseFigure extends StatelessWidget {
  const ProfessionalExerciseFigure({
    super.key,
    required this.pose,
    required this.progress,
    required this.size,
  });

  final ExercisePose pose;
  final double progress;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProfessionalExerciseFigurePainter(
        pose: pose,
        progress: progress,
        accent: context.appColors.primary,
      ),
      size: Size.square(size),
    );
  }
}

class ProfessionalExerciseFigurePainter extends CustomPainter {
  ProfessionalExerciseFigurePainter({
    required this.pose,
    required this.progress,
    required this.accent,
  });

  final ExercisePose pose;
  final double progress;
  final Color accent;

  static const _outline = Color(0xFF1E2A3A);
  static const _skin = Color(0xFFF2CDB0);
  static const _skinShadow = Color(0xFFE0B08E);
  static const _shirt = Color(0xFF3D5A80);
  static const _hair = Color(0xFF3D2B1F);
  static const _desk = Color(0xFFE8DDD0);
  static const _chair = Color(0xFFB8C0CC);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 260;
    canvas.save();
    canvas.translate(size.width * 0.5, size.height * 0.54);
    canvas.scale(scale);

    final rig = _rigForPose(progress);
    _drawScene(canvas, rig);
    canvas.restore();
  }

  _Rig _rigForPose(double t) {
    final wave = LoopAnimation.sineWave(t);
    final pulse = LoopAnimation.pulse(t);

    switch (pose) {
      case ExercisePose.neckRoll:
        final roll = t * 2 * math.pi;
        return _Rig.profile(
          headAngle: math.sin(roll) * 0.65,
          headShiftY: math.cos(roll) * 3,
        );
      case ExercisePose.neckSideRelease:
        return _Rig.profile(headAngle: wave * 0.7);
      case ExercisePose.shoulderShrug:
        return _Rig.front(shoulderLift: 3 + pulse * 11);
      case ExercisePose.seatedTwist:
        return _Rig.front(torsoTurn: wave * 0.35, headTurn: wave * 0.1);
      case ExercisePose.chestOpener:
        return _Rig.front(armBack: 0.4 + pulse * 0.75, chestLift: pulse * 6);
      case ExercisePose.seatedCatCow:
        return _Rig.profile(spineCurve: wave * 0.48);
      case ExercisePose.hipFlexorStretch:
        return _Rig.standing(lunge: 0.3 + pulse * 0.38);
      case ExercisePose.standingBackExtension:
        return _Rig.standing(backArch: pulse * 0.35);
      case ExercisePose.thoracicExtension:
        return _Rig.profile(
          spineCurve: 0.2 + pulse * 0.38,
          armUp: 0.4 + pulse * 0.7,
          headAngle: -0.08 - pulse * 0.1,
        );
      case ExercisePose.figure4Stretch:
        return _Rig.front(legCross: 0.3 + pulse * 0.5, leanForward: pulse * 14);
      case ExercisePose.childPoseChair:
        return _Rig.folded(fold: 0.5 + pulse * 0.2);
      case ExercisePose.deepBreathing:
        return _Rig.front(breathScale: 1 + pulse * 0.05);
      case ExercisePose.deskStretch:
        return _Rig.front(armReach: wave * 16);
    }
  }

  void _drawScene(Canvas canvas, _Rig rig) {
    canvas.drawOval(
      Rect.fromCenter(center: Offset(0, 52), width: 96, height: 10),
      Paint()..color = Colors.black.withValues(alpha: 0.04),
    );

    switch (rig.mode) {
      case _Mode.profile:
        _drawChairProfile(canvas);
        _drawDesk(canvas);
        canvas.save();
        canvas.clipRect(Rect.fromLTWH(-80, -120, 160, 200));
        _drawProfileUpperBody(canvas, rig);
        canvas.restore();
      case _Mode.front:
        _drawChairFront(canvas);
        _drawDesk(canvas);
        canvas.save();
        canvas.clipRect(Rect.fromLTWH(-80, -120, 160, 200));
        _drawFrontUpperBody(canvas, rig);
        canvas.restore();
      case _Mode.standing:
        _drawStandingBody(canvas, rig);
      case _Mode.folded:
        _drawChairFront(canvas);
        _drawFoldedBody(canvas, rig);
    }
  }

  void _drawDesk(Canvas canvas) {
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-78, 8, 156, 12),
        const Radius.circular(5),
      ),
      fill: _desk,
    );
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-16, -24, 32, 26),
        const Radius.circular(3),
      ),
      fill: const Color(0xFF2A3A52),
      strokeWidth: 1.2,
    );
  }

  void _drawChairProfile(Canvas canvas) {
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-30, 18, 56, 10),
        const Radius.circular(4),
      ),
      fill: _chair,
    );
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-32, -28, 10, 48),
        const Radius.circular(4),
      ),
      fill: _chair.withValues(alpha: 0.85),
    );
  }

  void _drawChairFront(Canvas canvas) {
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-34, 18, 68, 10),
        const Radius.circular(4),
      ),
      fill: _chair,
    );
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-38, -30, 12, 52),
        const Radius.circular(4),
      ),
      fill: _chair.withValues(alpha: 0.85),
    );
  }

  void _drawProfileUpperBody(Canvas canvas, _Rig rig) {
    final shoulder = Offset(4, -8);
    final chest = Offset(-2 + rig.spineCurve * 12, -36 - rig.spineCurve * 10);
    final neckBase = Offset(chest.dx + 2, chest.dy + 6);

    _drawTorsoProfile(canvas, shoulder, chest, rig.spineCurve);

    if (rig.armUp > 0) {
      _drawSegment(canvas, chest, Offset(-8, -52 - rig.armUp * 12), 7, _shirt);
      _drawSegment(
        canvas,
        Offset(-8, -52 - rig.armUp * 12),
        Offset(-4, -38 - rig.armUp * 16),
        6,
        _skin,
      );
    } else {
      _drawSegment(canvas, Offset(8, -14), Offset(36, 4), 6, _skin);
      _drawSegment(canvas, Offset(36, 4), Offset(52, 8), 5, _skin);
    }

    _drawNeckProfile(canvas, neckBase, rig.headAngle);
    _drawHeadProfile(
      canvas,
      Offset(
        neckBase.dx + math.sin(rig.headAngle) * 6,
        neckBase.dy - 16 + rig.headShiftY,
      ),
      rig.headAngle,
    );
  }

  void _drawFrontUpperBody(Canvas canvas, _Rig rig) {
    final breath = rig.breathScale;
    final shoulderY = -10 - rig.shoulderLift;

    canvas.save();
    canvas.translate(0, -rig.leanForward * 0.2);
    canvas.rotate(rig.torsoTurn);

    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(0, shoulderY - 14),
          width: 44 * breath,
          height: 42 * breath,
        ),
        const Radius.circular(14),
      ),
      fill: _shirt,
    );

    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(0, shoulderY - 1),
          width: 50,
          height: 12 + rig.shoulderLift * 0.3,
        ),
        const Radius.circular(6),
      ),
      fill: _shirt.withValues(alpha: 0.9),
    );

    if (rig.armBack > 0) {
      for (final side in [-1.0, 1.0]) {
        _drawSegment(
          canvas,
          Offset(22 * side, shoulderY),
          Offset(28 * side, shoulderY + 12 + rig.armBack * 10),
          6,
          _skin,
        );
        _drawSegment(
          canvas,
          Offset(28 * side, shoulderY + 12 + rig.armBack * 10),
          Offset(20 * side, shoulderY + 24 + rig.armBack * 14),
          5,
          _skinShadow,
        );
      }
    } else {
      _drawSegment(
        canvas,
        Offset(-22, shoulderY),
        Offset(-38 - rig.armReach, 2),
        6,
        _skin,
      );
      _drawSegment(
        canvas,
        Offset(-38 - rig.armReach, 2),
        Offset(-48 - rig.armReach, 8),
        5,
        _skinShadow,
      );
      _drawSegment(canvas, Offset(22, shoulderY), Offset(38, 0), 6, _skin);
      _drawSegment(canvas, Offset(38, 0), Offset(48, 8), 5, _skinShadow);
    }

    canvas.restore();

    _drawNeckFront(canvas, Offset(0, shoulderY - 16), rig.headTurn * 0.15);
    canvas.save();
    canvas.translate(rig.headTurn * 6, shoulderY - 30 - rig.chestLift);
    canvas.rotate(rig.headTurn * 0.2);
    _drawHeadFront(canvas, 13 * breath);
    canvas.restore();
  }

  void _drawStandingBody(Canvas canvas, _Rig rig) {
    canvas.save();
    canvas.translate(-4, 16);

    final lunge = rig.lunge;
    _drawSegment(canvas, Offset(8, 0), Offset(4, -30 - lunge * 12), 11, _outline);
    _drawSegment(canvas, Offset(4, -30 - lunge * 12), Offset(6, -54 - lunge * 16), 10, _outline);
    _drawSegment(canvas, Offset(-10, 0), Offset(-16, -24 - lunge * 8), 11, _outline);
    _drawSegment(canvas, Offset(-16, -24 - lunge * 8), Offset(-12, -44 - lunge * 12), 10, _outline);

    final hip = Offset(-8, -44 - lunge * 12);
    canvas.save();
    canvas.translate(hip.dx, hip.dy);
    canvas.rotate(rig.backArch);

    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0, -22), width: 38, height: 44),
        const Radius.circular(12),
      ),
      fill: _shirt,
    );

    _drawSegment(canvas, const Offset(-16, -26), const Offset(-20, -8), 6, _skin);
    _drawSegment(canvas, const Offset(16, -26), const Offset(20, -8), 6, _skin);

    _drawNeckProfile(canvas, const Offset(0, -42), rig.backArch * 0.4);
    _drawHeadProfile(
      canvas,
      Offset(4, -58 + rig.backArch * 4),
      rig.backArch * 0.35,
    );

    canvas.restore();
    canvas.restore();
  }

  void _drawFoldedBody(Canvas canvas, _Rig rig) {
    final fold = rig.fold;
    canvas.save();
    canvas.translate(0, 12);
    canvas.rotate(0.95 * fold);

    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0, -4), width: 46, height: 40),
        const Radius.circular(12),
      ),
      fill: _shirt,
    );

    _drawSegment(canvas, const Offset(-18, 4), const Offset(-26, 18), 6, _skin);
    _drawSegment(canvas, const Offset(18, 4), const Offset(8, 20), 6, _skin);

    canvas.restore();

    canvas.save();
    canvas.translate(22 * fold, 14);
    canvas.rotate(0.45 * fold);
    _drawHeadProfile(canvas, Offset.zero, 0.12);
    canvas.restore();
  }

  void _drawTorsoProfile(
    Canvas canvas,
    Offset shoulder,
    Offset chest,
    double curve,
  ) {
    final path = Path()
      ..moveTo(shoulder.dx - 6, shoulder.dy + 4)
      ..quadraticBezierTo(
        shoulder.dx - 10 + curve * 14,
        shoulder.dy - 18,
        chest.dx - 4,
        chest.dy,
      )
      ..lineTo(chest.dx + 12, chest.dy + 2)
      ..quadraticBezierTo(
        shoulder.dx + 12 + curve * 10,
        shoulder.dy - 16,
        shoulder.dx + 10,
        shoulder.dy + 4,
      )
      ..close();
    _fillStrokePath(canvas, path, fill: _shirt);
  }

  void _drawNeckProfile(Canvas canvas, Offset base, double angle) {
    canvas.save();
    canvas.translate(base.dx, base.dy);
    canvas.rotate(angle);
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0, -6), width: 10, height: 14),
        const Radius.circular(4),
      ),
      fill: _skinShadow,
      strokeWidth: 1.4,
    );
    canvas.restore();
  }

  void _drawNeckFront(Canvas canvas, Offset base, double angle) {
    canvas.save();
    canvas.translate(base.dx, base.dy);
    canvas.rotate(angle);
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: 12, height: 14),
        const Radius.circular(4),
      ),
      fill: _skinShadow,
      strokeWidth: 1.4,
    );
    canvas.restore();
  }

  void _drawHeadProfile(Canvas canvas, Offset center, double tilt) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(tilt);

    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: 28, height: 32),
        const Radius.circular(14),
      ),
      fill: _skin,
    );

    canvas.drawPath(
      Path()
        ..moveTo(-7, -6)
        ..quadraticBezierTo(0, -16, 9, -9)
        ..lineTo(7, -3)
        ..quadraticBezierTo(0, -10, -5, -1)
        ..close(),
      Paint()..color = _hair,
    );

    canvas.drawOval(
      Rect.fromCenter(center: const Offset(-8, 1), width: 5, height: 8),
      Paint()..color = _skinShadow,
    );
    canvas.drawCircle(const Offset(3, -1), 1.6, Paint()..color = _outline);

    canvas.restore();
  }

  void _drawHeadFront(Canvas canvas, double radius) {
    _fillStroke(
      canvas,
      RRect.fromRectAndRadius(
        Rect.fromCircle(center: Offset.zero, radius: radius),
        Radius.circular(radius),
      ),
      fill: _skin,
    );
    canvas.drawArc(
      Rect.fromCircle(center: const Offset(0, -1), radius: radius + 1),
      math.pi,
      math.pi,
      true,
      Paint()..color = _hair,
    );
    canvas.drawCircle(const Offset(-4, 1), 1.5, Paint()..color = _outline);
    canvas.drawCircle(const Offset(4, 1), 1.5, Paint()..color = _outline);
  }

  void _drawSegment(
    Canvas canvas,
    Offset a,
    Offset b,
    double radius,
    Color color,
  ) {
    final angle = math.atan2(b.dy - a.dy, b.dx - a.dx);
    final n = Offset(-math.sin(angle), math.cos(angle)) * radius;
    final path = Path()
      ..moveTo(a.dx + n.dx, a.dy + n.dy)
      ..lineTo(b.dx + n.dx, b.dy + n.dy)
      ..arcToPoint(Offset(b.dx - n.dx, b.dy - n.dy), radius: Radius.circular(radius))
      ..lineTo(a.dx - n.dx, a.dy - n.dy)
      ..arcToPoint(Offset(a.dx + n.dx, a.dy + n.dy), radius: Radius.circular(radius))
      ..close();
    _fillStrokePath(canvas, path, fill: color, strokeWidth: 1.4);
    canvas.drawCircle(b, radius * 0.55, Paint()..color = color);
  }

  void _fillStroke(
    Canvas canvas,
    RRect rrect, {
    required Color fill,
    double strokeWidth = 1.6,
  }) {
    canvas.drawRRect(rrect, Paint()..color = fill);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = _outline.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );
  }

  void _fillStrokePath(
    Canvas canvas,
    Path path, {
    required Color fill,
    double strokeWidth = 1.6,
  }) {
    canvas.drawPath(path, Paint()..color = fill);
    canvas.drawPath(
      path,
      Paint()
        ..color = _outline.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(ProfessionalExerciseFigurePainter oldDelegate) =>
      oldDelegate.pose != pose ||
      oldDelegate.progress != progress ||
      oldDelegate.accent != accent;
}

enum _Mode { profile, front, standing, folded }

class _Rig {
  const _Rig({
    required this.mode,
    this.headAngle = 0,
    this.headShiftY = 0,
    this.headTurn = 0,
    this.torsoTurn = 0,
    this.shoulderLift = 0,
    this.spineCurve = 0,
    this.armUp = 0,
    this.armBack = 0,
    this.chestLift = 0,
    this.leanForward = 0,
    this.legCross = 0,
    this.lunge = 0,
    this.backArch = 0,
    this.fold = 0.5,
    this.breathScale = 1,
    this.armReach = 0,
  });

  factory _Rig.profile({
    double headAngle = 0,
    double headShiftY = 0,
    double spineCurve = 0,
    double armUp = 0,
  }) {
    return _Rig(
      mode: _Mode.profile,
      headAngle: headAngle,
      headShiftY: headShiftY,
      spineCurve: spineCurve,
      armUp: armUp,
    );
  }

  factory _Rig.front({
    double headTurn = 0,
    double torsoTurn = 0,
    double shoulderLift = 0,
    double armBack = 0,
    double chestLift = 0,
    double leanForward = 0,
    double legCross = 0,
    double breathScale = 1,
    double armReach = 0,
  }) {
    return _Rig(
      mode: _Mode.front,
      headTurn: headTurn,
      torsoTurn: torsoTurn,
      shoulderLift: shoulderLift,
      armBack: armBack,
      chestLift: chestLift,
      leanForward: leanForward,
      legCross: legCross,
      breathScale: breathScale,
      armReach: armReach,
    );
  }

  factory _Rig.standing({double lunge = 0, double backArch = 0}) {
    return _Rig(mode: _Mode.standing, lunge: lunge, backArch: backArch);
  }

  factory _Rig.folded({double fold = 0.5}) {
    return _Rig(mode: _Mode.folded, fold: fold);
  }

  final _Mode mode;
  final double headAngle;
  final double headShiftY;
  final double headTurn;
  final double torsoTurn;
  final double shoulderLift;
  final double spineCurve;
  final double armUp;
  final double armBack;
  final double chestLift;
  final double leanForward;
  final double legCross;
  final double lunge;
  final double backArch;
  final double fold;
  final double breathScale;
  final double armReach;
}
