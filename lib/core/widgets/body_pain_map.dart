import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/theme/app_typography.dart';
import 'package:calm_calibrate/core/widgets/body_back_anatomy_data.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

/// Back-view body map with named region labels linked to each body part.
///
/// Muscle paths adapted from [body-muscles](https://github.com/vulovix/body-muscles) (Apache-2.0).
class BodyPainMap extends StatefulWidget {
  const BodyPainMap({
    super.key,
    required this.selectedAreas,
    required this.onAreaToggled,
  });

  final Set<PainArea> selectedAreas;
  final ValueChanged<PainArea> onAreaToggled;

  @override
  State<BodyPainMap> createState() => _BodyPainMapState();
}

class _BodyPainMapState extends State<BodyPainMap> {
  final _parsed = <BodyMuscleRegion, Path>{};
  Size? _lastSize;

  Path _pathFor(BodyMuscleRegion muscle, Size size) {
    if (_lastSize != size) {
      _parsed.clear();
      _lastSize = size;
    }
    final cached = _parsed[muscle];
    if (cached != null) return cached;

    final path = parseSvgPathData(muscle.pathData);
    final transformed = path.transform(_matrixFor(size).storage);
    _parsed[muscle] = transformed;
    return transformed;
  }

  Matrix4 _matrixFor(Size size) {
    final vb = BodyBackAnatomyData.viewBox;
    final scale = _fitScale(size);
    final offsetX = (size.width - vb.width * scale) / 2;
    final offsetY = (size.height - vb.height * scale) / 2;
    return Matrix4.identity()
      ..translateByDouble(offsetX, offsetY, 0, 1)
      ..scaleByDouble(scale, scale, 1, 1)
      ..translateByDouble(-vb.x, -vb.y, 0, 1);
  }

  Offset _viewBoxToScreen(Offset point, Size size) {
    final vb = BodyBackAnatomyData.viewBox;
    final scale = _fitScale(size);
    final offsetX = (size.width - vb.width * scale) / 2;
    final offsetY = (size.height - vb.height * scale) / 2;
    return Offset(
      offsetX + (point.dx - vb.x) * scale,
      offsetY + (point.dy - vb.y) * scale,
    );
  }

  double _fitScale(Size size) {
    final vb = BodyBackAnatomyData.viewBox;
    final scaleX = size.width / vb.width;
    final scaleY = size.height / vb.height;
    return scaleX < scaleY ? scaleX : scaleY;
  }

  void _handleTap(Offset local, Size size) {
    for (final layout in BodyBackAnatomyData.regionLabels.reversed) {
      final labelPos = _viewBoxToScreen(layout.labelPoint, size);
      const w = 92.0;
      const h = 34.0;
      final rect = Rect.fromCenter(
        center: labelPos,
        width: w,
        height: h,
      );
      if (rect.inflate(8).contains(local)) {
        widget.onAreaToggled(layout.area);
        return;
      }
    }

    for (final muscle in BodyBackAnatomyData.muscles.reversed) {
      final area = muscle.painArea;
      if (area == null) continue;
      if (_pathFor(muscle, size).contains(local)) {
        widget.onAreaToggled(area);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        final colors = context.appColors;
        final compact = size.width < 300;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapUp: (details) => _handleTap(details.localPosition, size),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: size,
                painter: _AnatomyBodyPainter(
                  colors: colors,
                  selectedAreas: widget.selectedAreas,
                  pathFor: _pathFor,
                ),
              ),
              CustomPaint(
                size: size,
                painter: _RegionLinkPainter(
                  colors: colors,
                  selectedAreas: widget.selectedAreas,
                  viewBoxToScreen: (p) => _viewBoxToScreen(p, size),
                ),
              ),
              ...BodyBackAnatomyData.regionLabels.map((layout) {
                final pos = _viewBoxToScreen(layout.labelPoint, size);
                final selected = widget.selectedAreas.contains(layout.area);
                return Positioned(
                  left: pos.dx,
                  top: pos.dy,
                  child: Transform.translate(
                    offset: Offset(compact ? -40 : -46, -17),
                    child: _BodyRegionLabel(
                      label: layout.area.label,
                      selected: selected,
                      compact: compact,
                      onTap: () => widget.onAreaToggled(layout.area),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _BodyRegionLabel extends StatelessWidget {
  const _BodyRegionLabel({
    required this.label,
    required this.selected,
    required this.compact,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return ScaleTap(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 10,
          vertical: compact ? 5 : 6,
        ),
        decoration: BoxDecoration(
          color: selected ? c.primaryLight : c.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? c.primary : c.border,
            width: selected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: c.cardShadow,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected) ...[
              Icon(Icons.check_circle, size: 14, color: c.primary),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: AppTypography.style(
                fontSize: compact ? 11 : 12,
                fontWeight: FontWeight.w600,
                color: selected ? c.primary : c.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegionLinkPainter extends CustomPainter {
  _RegionLinkPainter({
    required this.colors,
    required this.selectedAreas,
    required this.viewBoxToScreen,
  });

  final AppColorTokens colors;
  final Set<PainArea> selectedAreas;
  final Offset Function(Offset viewBoxPoint) viewBoxToScreen;

  @override
  void paint(Canvas canvas, Size size) {
    for (final layout in BodyBackAnatomyData.regionLabels) {
      final selected = selectedAreas.contains(layout.area);
      final body = viewBoxToScreen(layout.bodyPoint);
      final label = viewBoxToScreen(layout.labelPoint);

      final paint = Paint()
        ..color = selected
            ? colors.primary.withValues(alpha: 0.7)
            : colors.border
        ..strokeWidth = selected ? 1.5 : 1
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(label, body, paint);

      canvas.drawCircle(
        body,
        selected ? 4 : 3,
        Paint()
          ..color = selected ? colors.primary : colors.textMuted
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RegionLinkPainter oldDelegate) =>
      oldDelegate.selectedAreas != selectedAreas;
}

class _AnatomyBodyPainter extends CustomPainter {
  _AnatomyBodyPainter({
    required this.colors,
    required this.selectedAreas,
    required this.pathFor,
  });

  final AppColorTokens colors;
  final Set<PainArea> selectedAreas;
  final Path Function(BodyMuscleRegion muscle, Size size) pathFor;

  @override
  void paint(Canvas canvas, Size size) {
    final baseFill = colors.navy.withValues(alpha: 0.07);
    final baseStroke = colors.navy.withValues(alpha: 0.22);
    final tappableFill = colors.primaryLight.withValues(alpha: 0.55);
    final selectedFill = colors.painHotspot.withValues(alpha: 0.72);
    final selectedStroke = colors.painHotspot;

    for (final muscle in BodyBackAnatomyData.muscles) {
      final path = pathFor(muscle, size);
      final area = muscle.painArea;
      final selected = area != null && selectedAreas.contains(area);

      final fill = switch ((area, selected)) {
        (null, _) => baseFill,
        (_, true) => selectedFill,
        (_, false) => tappableFill,
      };
      final stroke = selected ? selectedStroke : baseStroke;
      final strokeWidth =
          (selected ? 1.2 : 0.6) * (size.shortestSide / 360).clamp(0.75, 1.2);

      canvas.drawPath(
        path,
        Paint()
          ..color = fill
          ..style = PaintingStyle.fill,
      );
      canvas.drawPath(
        path,
        Paint()
          ..color = stroke
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeJoin = StrokeJoin.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _AnatomyBodyPainter oldDelegate) =>
      oldDelegate.colors != colors ||
      oldDelegate.selectedAreas != selectedAreas;
}
