import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:flutter/material.dart';

/// Horizontal screen padding — 16px on narrow phones, 24px otherwise.
/// On tablets, inset grows so content stays centered up to [ScreenMetrics.contentMaxWidth].
class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    required this.child,
    this.vertical = 0,
  });

  final Widget child;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    final side = context.metrics.effectiveHorizontalInset;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: side, vertical: vertical),
      child: child,
    );
  }
}

/// Centers content and caps width on tablets / large phones in landscape.
class ResponsiveContent extends StatelessWidget {
  const ResponsiveContent({
    super.key,
    required this.child,
    this.alignment = Alignment.topCenter,
  });

  final Widget child;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final maxW = context.metrics.contentMaxWidth;
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxW),
        child: child,
      ),
    );
  }
}

/// ListView / scroll padding matching [ResponsivePadding].
EdgeInsets responsiveScreenPadding(BuildContext context) {
  final m = context.metrics;
  return EdgeInsets.symmetric(horizontal: m.effectiveHorizontalInset);
}

/// Full-bleed scroll padding (horizontal + vertical).
EdgeInsets responsiveScreenPaddingAll(BuildContext context) {
  final m = context.metrics;
  final side = m.effectiveHorizontalInset;
  return EdgeInsets.all(side);
}

/// SafeArea + horizontal padding + optional scroll, used by form-style screens.
///
/// Set [fillViewport] when the child uses [Spacer] or [Expanded] in a [Column].
/// Do not use [fillViewport] when content may exceed the screen height.
class ResponsiveScrollBody extends StatelessWidget {
  const ResponsiveScrollBody({
    super.key,
    required this.child,
    this.bottomPadding,
    this.fillViewport = false,
  });

  final Widget child;
  final double? bottomPadding;

  /// Gives the scroll child a fixed viewport height so flex children can layout.
  final bool fillViewport;

  @override
  Widget build(BuildContext context) {
    final m = context.metrics;
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final viewportHeight = constraints.maxHeight;
          final bottom = bottomPadding ?? m.onboardingBottomGap;

          Widget body = ResponsiveContent(child: child);
          if (fillViewport) {
            body = SizedBox(height: viewportHeight, child: body);
          }

          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              m.effectiveHorizontalInset,
              0,
              m.effectiveHorizontalInset,
              bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewportHeight),
              child: body,
            ),
          );
        },
      ),
    );
  }
}
