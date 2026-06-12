import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Shared helpers for seamless infinite motion.
abstract final class LoopAnimation {
  /// Ping-pong loop — no snap when the cycle restarts.
  static void repeatSmooth(AnimationController controller) {
    controller.repeat(reverse: true);
  }

  /// Continuous 0→1 loop — safe when output uses sin/cos(2π·t).
  static void repeatLinear(AnimationController controller) {
    controller.repeat();
  }

  /// Maps controller value to a sine wave in [-1, 1].
  static double sineWave(double t) => math.sin(t * 2 * math.pi);

  /// Maps controller value to a smooth pulse in [0, 1].
  static double pulse(double t) => (sineWave(t) + 1) / 2;
}
