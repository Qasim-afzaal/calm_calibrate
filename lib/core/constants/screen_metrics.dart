import 'package:flutter/material.dart';

/// Breakpoints and scaled sizes for small phones (SE, mini) vs standard.
class ScreenMetrics {
  ScreenMetrics(this.context);

  final BuildContext context;

  factory ScreenMetrics.of(BuildContext context) => ScreenMetrics(context);

  Size get size => MediaQuery.sizeOf(context);
  double get height => size.height;
  double get width => size.width;

  bool get isCompactHeight => height < 700;
  bool get isCompactWidth => width < 360;
  bool get isCompact => isCompactHeight || isCompactWidth;
  bool get isVeryCompact => height < 640;

  double get horizontalPadding => isCompactWidth ? 16.0 : 24.0;

  /// Paywall exercise carousel height.
  double get paywallSlideHeight {
    if (isVeryCompact) return 112;
    if (isCompactHeight) return 132;
    return 156;
  }

  double get paywallPoseSize {
    if (isVeryCompact) return 72;
    if (isCompactHeight) return 86;
    return 96;
  }

  /// Pro feature carousel card area.
  double get paywallFeatureCardHeight {
    if (isVeryCompact) return 76;
    if (isCompactHeight) return 88;
    return 96;
  }

  double get paywallCtaHeight => isCompact ? 48.0 : 52.0;

  double get sectionGap => isCompact ? 8.0 : 12.0;
  double get headlineSize => isVeryCompact ? 20.0 : (isCompact ? 22.0 : 24.0);
}

extension ScreenMetricsContext on BuildContext {
  ScreenMetrics get metrics => ScreenMetrics.of(this);
}
