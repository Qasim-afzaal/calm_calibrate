import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:flutter/material.dart';

class BodyPainMap extends StatelessWidget {
  const BodyPainMap({
    super.key,
    required this.selectedAreas,
    required this.onAreaToggled,
  });

  final Set<PainArea> selectedAreas;
  final ValueChanged<PainArea> onAreaToggled;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(w, h),
              painter: _BodyOutlinePainter(colors: c),
            ),
            ..._hotspots(c, w, h),
          ],
        );
      },
    );
  }

  List<Widget> _hotspots(AppColorTokens c, double w, double h) {
    final spots = <PainArea, Offset>{
      PainArea.neck: Offset(0.5, 0.14),
      PainArea.shoulders: Offset(0.5, 0.22),
      PainArea.upperBack: Offset(0.5, 0.32),
      PainArea.lowerBack: Offset(0.5, 0.44),
      PainArea.hips: Offset(0.5, 0.54),
    };

    return spots.entries.map((entry) {
      final selected = selectedAreas.contains(entry.key);
      final left = entry.value.dx * w - 28;
      final top = entry.value.dy * h - 28;

      return Positioned(
        left: left,
        top: top,
        child: GestureDetector(
          onTap: () => onAreaToggled(entry.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected
                  ? c.painHotspot.withValues(alpha: 0.25)
                  : Colors.transparent,
              border: Border.all(
                color: selected ? c.painHotspot : c.border,
                width: selected ? 2.5 : 1.5,
              ),
            ),
            child: Center(
              child: Container(
                width: selected ? 14 : 10,
                height: selected ? 14 : 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? c.painHotspot
                      : c.textMuted.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}

class _BodyOutlinePainter extends CustomPainter {
  _BodyOutlinePainter({required this.colors});

  final AppColorTokens colors;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final cx = size.width / 2;
    final headR = size.width * 0.08;
    final headCenter = Offset(cx, size.height * 0.08);

    canvas.drawCircle(headCenter, headR, paint);

    final bodyPath = Path()
      ..moveTo(cx - size.width * 0.18, size.height * 0.16)
      ..lineTo(cx - size.width * 0.22, size.height * 0.38)
      ..lineTo(cx - size.width * 0.16, size.height * 0.62)
      ..lineTo(cx - size.width * 0.12, size.height * 0.88)
      ..lineTo(cx + size.width * 0.12, size.height * 0.88)
      ..lineTo(cx + size.width * 0.16, size.height * 0.62)
      ..lineTo(cx + size.width * 0.22, size.height * 0.38)
      ..lineTo(cx + size.width * 0.18, size.height * 0.16)
      ..close();

    canvas.drawPath(bodyPath, paint);

    canvas.drawLine(
      Offset(cx - size.width * 0.22, size.height * 0.28),
      Offset(cx - size.width * 0.38, size.height * 0.48),
      paint,
    );
    canvas.drawLine(
      Offset(cx + size.width * 0.22, size.height * 0.28),
      Offset(cx + size.width * 0.38, size.height * 0.48),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _BodyOutlinePainter oldDelegate) =>
      oldDelegate.colors != colors;
}
