import 'package:calm_calibrate/core/branding/app_logo.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:flutter/material.dart';

/// Clean fallback when Lottie assets are unavailable (no puppet vector art).
class ExercisePoseFallback extends StatelessWidget {
  const ExercisePoseFallback({
    super.key,
    required this.pose,
    required this.size,
    this.active = true,
  });

  final ExercisePose pose;
  final double size;
  final bool active;

  static IconData iconFor(ExercisePose pose) {
    return switch (pose) {
      ExercisePose.neckRoll || ExercisePose.neckSideRelease => Icons.face_retouching_natural_outlined,
      ExercisePose.shoulderShrug ||
      ExercisePose.chestOpener ||
      ExercisePose.thoracicExtension => Icons.accessibility_new_outlined,
      ExercisePose.seatedTwist || ExercisePose.seatedCatCow => Icons.sync_alt_rounded,
      ExercisePose.hipFlexorStretch || ExercisePose.figure4Stretch => Icons.directions_walk_outlined,
      ExercisePose.standingBackExtension => Icons.vertical_align_top_outlined,
      ExercisePose.childPoseChair => Icons.self_improvement_outlined,
      ExercisePose.deepBreathing => Icons.air_outlined,
      ExercisePose.deskStretch => Icons.visibility_outlined,
      _ => Icons.fitness_center_outlined,
    };
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final icon = iconFor(pose);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.94, end: active ? 1.0 : 0.94),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size * 0.52,
            height: size * 0.52,
            decoration: BoxDecoration(
              color: c.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: size * 0.26, color: c.primary),
          ),
          SizedBox(height: size * 0.06),
          Text(
            _poseLabel(pose),
            style: TextStyle(
              fontSize: size * 0.07,
              fontWeight: FontWeight.w600,
              color: c.textSecondary,
            ),
          ),
          SizedBox(height: size * 0.04),
          AppLogo(size: size * 0.14, iconOnly: true),
        ],
      ),
    );
  }

  static String _poseLabel(ExercisePose pose) {
    return switch (pose) {
      ExercisePose.neckRoll => 'Neck mobility',
      ExercisePose.neckSideRelease => 'Neck release',
      ExercisePose.shoulderShrug => 'Shoulder reset',
      ExercisePose.seatedTwist => 'Spine twist',
      ExercisePose.chestOpener => 'Chest opener',
      ExercisePose.seatedCatCow => 'Spine flow',
      ExercisePose.hipFlexorStretch => 'Hip stretch',
      ExercisePose.standingBackExtension => 'Back extension',
      ExercisePose.thoracicExtension => 'Upper back',
      ExercisePose.figure4Stretch => 'Hip opener',
      ExercisePose.childPoseChair => 'Forward fold',
      ExercisePose.deepBreathing => 'Breath work',
      ExercisePose.deskStretch => 'Eye rest',
    };
  }
}
