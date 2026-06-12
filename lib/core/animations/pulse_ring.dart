import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:flutter/material.dart';

/// Expanding ring pulse — workout timer, smart break urgency.
class PulseRing extends StatefulWidget {
  PulseRing({
    super.key,
    required this.child,
    this.color,
    this.active = true,
    this.enabled = true,
  });

  static bool globallyEnabled = true;

  final Widget child;
  final Color? color;
  final bool active;
  final bool enabled;

  @override
  State<PulseRing> createState() => _PulseRingState();
}

class _PulseRingState extends State<PulseRing>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    if (!widget.enabled || !PulseRing.globallyEnabled) return;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );
    if (widget.active) LoopAnimation.repeatSmooth(_controller!);
  }

  @override
  void didUpdateWidget(PulseRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    final c = _controller;
    if (c == null) return;
    if (widget.active && !c.isAnimating) {
      LoopAnimation.repeatSmooth(c);
    } else if (!widget.active) {
      c.stop();
      c.value = 0;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled ||
        !PulseRing.globallyEnabled ||
        _controller == null) {
      return widget.child;
    }

    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    final c = _controller!;

    return AnimatedBuilder(
      animation: c,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (widget.active)
              Container(
                width: 120 + c.value * 36,
                height: 120 + c.value * 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color.withValues(
                      alpha: 0.35 * (1 - c.value).clamp(0.0, 1.0),
                    ),
                    width: 2,
                  ),
                ),
              ),
            child!,
          ],
        );
      },
      child: widget.child,
    );
  }
}
