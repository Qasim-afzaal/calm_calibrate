import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { filled, outlined, navy }

/// Primary action button with press animation.
class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = AppButtonVariant.filled,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonVariant variant;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final enabled = onPressed != null && !isLoading;

    return ScaleTap(
      enabled: enabled,
      onTap: onPressed,
      child: _buildButton(context, enabled),
    );
  }

  Widget _buildButton(BuildContext context, bool enabled) {
    final c = context.appColors;
    final child = _content();

    switch (variant) {
      case AppButtonVariant.outlined:
        return OutlinedButton(
          onPressed: enabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 56),
            side: BorderSide(color: c.border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
          ),
          child: child,
        );
      case AppButtonVariant.navy:
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: c.navy,
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
          ),
          child: child,
        );
      case AppButtonVariant.filled:
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          child: child,
        );
    }
  }

  Widget _content() {
    if (isLoading) {
      return SizedBox(
        height: 22,
        width: 22,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(label),
            ),
          ),
        ],
      );
    }
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(label),
    );
  }
}

/// Backward-compatible aliases.
typedef PrimaryButton = AppButton;
typedef PrimaryButtonVariant = AppButtonVariant;
