import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:calm_calibrate/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// Slow inhale/exhale scale — used for wellness icons, logos, rest states.
class BreatheAnimation extends StatefulWidget {
  const BreatheAnimation({
    super.key,
    required this.child,
    this.minScale = 0.94,
    this.maxScale = 1.0,
    this.duration = AppDurations.breathe,
    this.enabled = true,
  });

  /// Set to false in widget tests to avoid infinite animation controllers.
  static bool globallyEnabled = true;

  final Widget child;
  final double minScale;
  final double maxScale;
  final Duration duration;
  final bool enabled;

  @override
  State<BreatheAnimation> createState() => _BreatheAnimationState();
}

class _BreatheAnimationState extends State<BreatheAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _scale;

  @override
  void initState() {
    super.initState();
    if (!widget.enabled || !BreatheAnimation.globallyEnabled) return;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    LoopAnimation.repeatSmooth(_controller!);
    _scale = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled || !BreatheAnimation.globallyEnabled) {
      return widget.child;
    }
    return ScaleTransition(scale: _scale!, child: widget.child);
  }
}
