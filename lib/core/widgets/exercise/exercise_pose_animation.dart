import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/exercise/exercise_animation_catalog.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Animated exercise guide — plays the pose-matched GIF loop.
class ExercisePoseAnimation extends StatelessWidget {
  const ExercisePoseAnimation({
    super.key,
    required this.pose,
    this.active = true,
    this.size = 220,
    this.stageColor,
    this.borderRadius,
  });

  static bool globallyEnabled = true;

  final ExercisePose pose;
  final bool active;
  final double size;
  /// Blends GIF white backgrounds into the stage (use card background color).
  final Color? stageColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (!ExercisePoseAnimation.globallyEnabled) {
      return SizedBox(width: size, height: size);
    }

    final asset = ExerciseAnimationCatalog.assetFor(pose);
    if (asset == null) {
      return _MissingAnimationView(
        pose: pose,
        size: size,
        stageColor: stageColor,
        borderRadius: borderRadius,
      );
    }

    final radius = borderRadius ?? size * 0.16;
    final stage = stageColor;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedOpacity(
        opacity: active ? 1 : 0.55,
        duration: const Duration(milliseconds: 300),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: stage != null
                ? RadialGradient(
                    colors: [
                      stage,
                      stage.withValues(alpha: 0.92),
                    ],
                  )
                : null,
            boxShadow: stage != null
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Padding(
              padding: EdgeInsets.all(size * 0.045),
              child: _ExerciseImage(
                asset: asset,
                size: size,
                stageColor: stage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ExerciseImage extends StatelessWidget {
  const _ExerciseImage({
    required this.asset,
    required this.size,
    this.stageColor,
  });

  final String asset;
  final double size;
  final Color? stageColor;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
      gaplessPlayback: true,
      filterQuality: FilterQuality.medium,
    );

    if (stageColor == null) return image;

    return ColorFiltered(
      colorFilter: ColorFilter.mode(stageColor!, BlendMode.multiply),
      child: image,
    );
  }
}

/// Shown when a pose has no GIF yet — locked for free users, placeholder for Pro.
class _MissingAnimationView extends StatelessWidget {
  const _MissingAnimationView({
    required this.pose,
    required this.size,
    this.stageColor,
    this.borderRadius,
  });

  final ExercisePose pose;
  final double size;
  final Color? stageColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isPremium = SubscriptionRepository.instance.isPremium;
    final radius = borderRadius ?? size * 0.16;

    if (!isPremium) {
      return SizedBox(
        width: size,
        height: size,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push('/premium'),
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              decoration: BoxDecoration(
                color: stageColor ?? c.surface,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: c.border),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_rounded, size: size * 0.18, color: c.textMuted),
                  SizedBox(height: size * 0.04),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: c.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'PRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size * 0.045,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: size * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size * 0.1),
                    child: Text(
                      'Animated guide — Pro only',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size * 0.055,
                        fontWeight: FontWeight.w600,
                        color: c.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.85,
            child: _ExerciseImage(
              asset: ExerciseAnimationCatalog.placeholderAsset,
              size: size * 0.75,
              stageColor: stageColor,
            ),
          ),
          SizedBox(height: size * 0.03),
          Text(
            'Animation coming soon',
            style: TextStyle(
              fontSize: size * 0.05,
              fontWeight: FontWeight.w600,
              color: c.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

/// Backward-compatible aliases (vector painter removed from UI).
typedef DeskWorkerPosePainter = Object;
typedef HumanExercisePainter = Object;
