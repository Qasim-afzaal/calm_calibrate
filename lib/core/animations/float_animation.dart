import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:calm_calibrate/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// Subtle vertical float — desk hero illustrations, break prompts.
class FloatAnimation extends StatefulWidget {
  const FloatAnimation({
    super.key,
    required this.child,
    this.distance = 8,
    this.duration = AppDurations.float,
    this.enabled = true,
  });

  static bool globallyEnabled = true;

  final Widget child;
  final double distance;
  final Duration duration;
  final bool enabled;

  @override
  State<FloatAnimation> createState() => _FloatAnimationState();
}

class _FloatAnimationState extends State<FloatAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _offset;

  @override
  void initState() {
    super.initState();
    if (!widget.enabled || !FloatAnimation.globallyEnabled) return;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    LoopAnimation.repeatSmooth(_controller!);
    _offset = Tween<double>(begin: -widget.distance, end: widget.distance)
        .animate(
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
    if (!widget.enabled ||
        !FloatAnimation.globallyEnabled ||
        _offset == null) {
      return widget.child;
    }
    return AnimatedBuilder(
      animation: _offset!,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _offset!.value),
        child: child,
      ),
      child: widget.child,
    );
  }
}
