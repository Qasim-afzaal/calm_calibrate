import 'package:calm_calibrate/data/models/exercise.dart';

/// Maps each [ExercisePose] to a bundled GIF under [assets/exercises/].
///
/// Poses listed in [_files] have a named animation asset. Any pose not in the
/// map is treated as Pro-only until its GIF is added.
abstract final class ExerciseAnimationCatalog {
  static const _base = 'assets/exercises';

  static const placeholderAsset = '$_base/pose_placeholder.gif';

  /// True when a dedicated GIF exists for [pose].
  static bool hasAnimation(ExercisePose pose) => _files.containsKey(pose);

  /// Poses without a GIF are locked for free users.
  static bool isProOnly(ExercisePose pose) => !hasAnimation(pose);

  static String? assetFor(ExercisePose pose) {
    final file = _files[pose];
    if (file == null) return null;
    return '$_base/$file';
  }

  /// Filenames mirror the source pack in `exercise-gifs-only/`.
  static const _files = <ExercisePose, String>{
    ExercisePose.neckRoll: 'neck_roll.gif',
    ExercisePose.neckSideRelease: 'neck_side_release.gif',
    ExercisePose.shoulderShrug: 'shoulder_shrug.gif',
    ExercisePose.seatedTwist: 'seated_twist.gif',
    ExercisePose.chestOpener: 'chest_opener.gif',
    ExercisePose.seatedCatCow: 'seated_cat_cow.gif',
    ExercisePose.hipFlexorStretch: 'hip_flexor_stretch.gif',
    ExercisePose.standingBackExtension: 'standing_back_extension.gif',
    ExercisePose.thoracicExtension: 'thoracic_extension.gif',
    ExercisePose.figure4Stretch: 'figure_4_stretch.gif',
    ExercisePose.childPoseChair: 'child_pose_chair.gif',
    ExercisePose.deepBreathing: 'deep_breathing.gif',
    ExercisePose.deskStretch: 'desk_stretch.gif',
  };
}
