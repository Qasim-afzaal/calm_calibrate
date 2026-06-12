import 'package:calm_calibrate/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// Gentle fade + upward slide — default entrance for screens and list items.
class FadeSlideIn extends StatefulWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppDurations.normal,
    this.offsetY = 24,
    this.curve = Curves.easeOutCubic,
    this.enabled = true,
  });

  static bool globallyEnabled = true;

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offsetY;
  final Curve curve;
  final bool enabled;

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fade;
  Animation<Offset>? _slide;

  bool get _active =>
      widget.enabled && FadeSlideIn.globallyEnabled;

  @override
  void initState() {
    super.initState();
    if (!_active) return;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _controller!, curve: widget.curve);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.offsetY / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller!, curve: widget.curve));

    Future<void>.delayed(widget.delay, () {
      if (mounted) _controller?.forward();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_active || _fade == null || _slide == null) {
      return widget.child;
    }
    return FadeTransition(
      opacity: _fade!,
      child: SlideTransition(position: _slide!, child: widget.child),
    );
  }
}
