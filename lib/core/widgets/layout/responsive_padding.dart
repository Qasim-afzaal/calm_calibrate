import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:flutter/material.dart';

/// Horizontal screen padding — 16px on narrow phones, 24px otherwise.
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
    final h = context.metrics.horizontalPadding;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: vertical),
      child: child,
    );
  }
}

/// ListView / scroll padding matching [ResponsivePadding].
EdgeInsets responsiveScreenPadding(BuildContext context) {
  final h = context.metrics.horizontalPadding;
  return EdgeInsets.symmetric(horizontal: h);
}
