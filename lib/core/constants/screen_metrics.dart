import 'package:flutter/material.dart';

/// Breakpoints and scaled sizes for phones, small devices, and tablets.
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
  bool get isTablet => width >= 600;
  bool get isLargeScreen => width >= 900;

  double get horizontalPadding => isCompactWidth ? 16.0 : 24.0;

  /// Max content width — keeps layouts readable on iPad / landscape.
  double get contentMaxWidth {
    if (isLargeScreen) return 720;
    if (isTablet) return 560;
    return width;
  }

  /// Horizontal inset for lists — centers content on wide screens.
  double get effectiveHorizontalInset {
    if (!isTablet) return horizontalPadding;
    final inset = (width - contentMaxWidth) / 2;
    return inset < horizontalPadding ? horizontalPadding : inset;
  }

  EdgeInsets get screenPadding =>
      EdgeInsets.symmetric(horizontal: effectiveHorizontalInset);

  EdgeInsets get screenPaddingAll =>
      EdgeInsets.all(effectiveHorizontalInset);

  double get sectionGap => isCompact ? 8.0 : 12.0;
  double get stackSpacing => isCompact ? 16.0 : 20.0;
  double get blockSpacing => isVeryCompact ? 20.0 : (isCompact ? 24.0 : 32.0);
  double get largeSpacing => isVeryCompact ? 24.0 : (isCompact ? 32.0 : 40.0);

  double get headlineSize => isVeryCompact ? 20.0 : (isCompact ? 22.0 : 24.0);
  double get headlineLargeSize =>
      isVeryCompact ? 26.0 : (isCompact ? 28.0 : 32.0);

  TextStyle? headlineStyle(TextTheme theme) =>
      theme.headlineMedium?.copyWith(fontSize: headlineSize, height: 1.15);

  TextStyle? headlineLargeStyle(TextTheme theme) =>
      theme.headlineLarge?.copyWith(fontSize: headlineLargeSize, height: 1.15);

  /// Onboarding title / section vertical rhythm.
  double get onboardingTitleGap => isCompact ? 12.0 : 16.0;
  double get onboardingSectionGap =>
      isVeryCompact ? 16.0 : (isCompact ? 20.0 : 24.0);
  double get onboardingBottomGap => isCompact ? 16.0 : 24.0;

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

  double get chartHeight => isVeryCompact ? 160.0 : (isCompactHeight ? 180.0 : 200.0);

  double get heroIconOuter => isVeryCompact ? 96.0 : (isCompact ? 108.0 : 120.0);
  double get heroIconInner => isVeryCompact ? 44.0 : (isCompact ? 50.0 : 56.0);

  double get workoutPoseSize =>
      isVeryCompact ? 170.0 : (isCompactHeight ? 190.0 : 210.0);
  double get timerFontSize =>
      isVeryCompact ? 40.0 : (isCompact ? 44.0 : 48.0);
}

extension ScreenMetricsContext on BuildContext {
  ScreenMetrics get metrics => ScreenMetrics.of(this);
}
