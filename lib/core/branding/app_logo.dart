import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:flutter/material.dart';

/// Splash / app-icon logo: orange tile + meditation icon.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 80,
    this.iconSize = 44,
    this.backgroundColor = AppLogo.primaryOrange,
    this.iconColor = Colors.white,
    this.borderRadius,
    this.iconOnly = false,
  });

  static const primaryOrange = Color(0xFFE85D3B);

  /// Tile size in logical pixels.
  final double size;

  /// Meditation icon size (defaults to ~55% of [size]).
  final double iconSize;

  final Color backgroundColor;
  final Color iconColor;

  /// When null, uses [AppRadius.md] scaled to [size].
  final double? borderRadius;

  /// Transparent background; icon only (Android adaptive foreground).
  final bool iconOnly;

  double get _radius =>
      borderRadius ?? AppRadius.md * (size / 80).clamp(0.0, size / 2);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      Icons.self_improvement,
      color: iconColor,
      size: iconSize,
    );

    if (iconOnly) {
      return SizedBox(width: size, height: size, child: Center(child: icon));
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Center(child: icon),
    );
  }
}
