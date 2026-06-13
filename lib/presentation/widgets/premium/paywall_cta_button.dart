import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/constants/app_radius.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Pulsing CTA — draws attention without being aggressive.
class PaywallCtaButton extends StatefulWidget {
  PaywallCtaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.height = 52,
  });

  @override
  State<PaywallCtaButton> createState() => _PaywallCtaButtonState();

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
}

class _PaywallCtaButtonState extends State<PaywallCtaButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );
    LoopAnimation.repeatSmooth(_pulse!);
  }

  @override
  void dispose() {
    _pulse?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final enabled = widget.onPressed != null && !widget.isLoading;
    final fontSize = widget.height <= 48 ? 15.0 : 17.0;

    return AnimatedBuilder(
      animation: _pulse!,
      builder: (context, child) {
        final glow = 0.15 + _pulse!.value * 0.2;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: enabled
                ? [
                    BoxShadow(
                      color: c.primary.withValues(alpha: glow),
                      blurRadius: 16 + _pulse!.value * 8,
                      spreadRadius: _pulse!.value * 2,
                    ),
                  ]
                : null,
          ),
          child: child,
        );
      },
      child: ScaleTap(
        onTap: enabled ? widget.onPressed : null,
        child: Container(
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: enabled
                  ? [c.primary, c.primary.withValues(alpha: 0.85)]
                  : [c.primary.withValues(alpha: 0.4), c.primary.withValues(alpha: 0.3)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Center(
            child: widget.isLoading
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
