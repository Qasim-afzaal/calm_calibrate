import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/calculators/weekly_progress_calculator.dart';
import 'package:flutter/material.dart';

abstract class SessionRepository {
  List<ExerciseSession> getTodaySessions(UserProfile profile);
  List<ExerciseSession> getPremiumPrograms();
  ExerciseSession? getSessionById(String id);
  WeeklyProgress getWeeklyProgress(UserProfile profile);
  void markCompleted(String sessionId);
  bool isPremiumProgram(String id);
}

class CachedSessionRepository implements SessionRepository {
  CachedSessionRepository._();
  static final CachedSessionRepository instance = CachedSessionRepository._();

  final _cache = AppCache.instance;

  static final _sessions = <ExerciseSession>[
    ExerciseSession(
      id: 'morning_reset',
      title: 'Morning Reset',
      subtitle: 'Wake up your spine',
      durationMinutes: 3,
      focusAreas: [PainArea.neck, PainArea.shoulders],
      icon: Icons.wb_twilight_rounded,
      steps: [
        ExerciseStep(
          name: 'Neck Rolls',
          durationSeconds: 30,
          instruction: 'Slowly roll your neck in a circle. Breathe deeply.',
          pose: ExercisePose.neckRoll,
          tip: 'Move slowly. No jerking.',
        ),
        ExerciseStep(
          name: 'Shoulder Shrugs',
          durationSeconds: 30,
          instruction: 'Lift shoulders to ears, hold 3 sec, release.',
          pose: ExercisePose.shoulderShrug,
          tip: 'Hold at the top for 3 seconds.',
        ),
        ExerciseStep(
          name: 'Seated Twist',
          durationSeconds: 45,
          instruction: 'Twist gently left and right. Keep hips facing forward.',
          pose: ExercisePose.seatedTwist,
          tip: 'Keep hips still. Twist from the waist.',
        ),
        ExerciseStep(
          name: 'Chest Opener',
          durationSeconds: 45,
          instruction: 'Clasp hands behind back. Open chest gently.',
          pose: ExercisePose.chestOpener,
          tip: 'Squeeze shoulder blades together.',
        ),
      ],
    ),
    ExerciseSession(
      id: 'midday_break',
      title: 'Midday Desk Break',
      subtitle: 'Combat afternoon stiffness',
      durationMinutes: 5,
      focusAreas: [PainArea.lowerBack, PainArea.hips],
      icon: Icons.wb_sunny_rounded,
      steps: [
        ExerciseStep(
          name: 'Neck Side Release',
          durationSeconds: 45,
          instruction: 'Tilt ear toward shoulder. Hold each side 20 sec.',
          pose: ExercisePose.neckSideRelease,
          tip: 'Keep opposite shoulder relaxed.',
        ),
        ExerciseStep(
          name: 'Seated Cat Cow',
          durationSeconds: 45,
          instruction: 'Arch and round your back slowly with breath.',
          pose: ExercisePose.seatedCatCow,
          tip: 'Sync movement with your breath.',
        ),
        ExerciseStep(
          name: 'Hip Flexor Stretch',
          durationSeconds: 60,
          instruction: 'Stand, step one foot back. Lean forward gently.',
          pose: ExercisePose.hipFlexorStretch,
          tip: 'Keep front knee over ankle.',
        ),
        ExerciseStep(
          name: 'Standing Back Extension',
          durationSeconds: 45,
          instruction: 'Hands on lower back. Lean back slightly.',
          pose: ExercisePose.standingBackExtension,
          tip: 'Small range. No forcing.',
        ),
      ],
    ),
    ExerciseSession(
      id: 'evening_recovery',
      title: 'Evening Deep Recovery',
      subtitle: 'Release the day\'s tension',
      durationMinutes: 12,
      focusAreas: [PainArea.upperBack, PainArea.lowerBack, PainArea.hips],
      icon: Icons.nightlight_round,
      steps: [
        ExerciseStep(
          name: 'Thoracic Extension',
          durationSeconds: 60,
          instruction: 'Hands behind head. Arch upper back over chair.',
          pose: ExercisePose.thoracicExtension,
          tip: 'Lead with your chest, not your neck.',
        ),
        ExerciseStep(
          name: 'Figure 4 Stretch',
          durationSeconds: 60,
          instruction: 'Ankle on opposite knee. Lean forward gently.',
          pose: ExercisePose.figure4Stretch,
          tip: 'Flex foot to protect the knee.',
        ),
        ExerciseStep(
          name: 'Child\'s Pose (Chair)',
          durationSeconds: 90,
          instruction: 'Sit back, fold forward over knees. Breathe.',
          pose: ExercisePose.childPoseChair,
          tip: 'Let your neck hang heavy.',
        ),
        ExerciseStep(
          name: 'Deep Breathing',
          durationSeconds: 60,
          instruction: '4 counts in, 6 counts out. Relax shoulders.',
          pose: ExercisePose.deepBreathing,
          tip: 'Longer exhale calms the nervous system.',
        ),
      ],
    ),
  ];

  static final _premiumSessions = <ExerciseSession>[
    ExerciseSession(
      id: 'neck_relief',
      title: 'Neck Relief',
      subtitle: 'Forward head posture fix',
      durationMinutes: 4,
      focusAreas: [PainArea.neck],
      icon: Icons.accessibility_new_rounded,
      steps: [
        ExerciseStep(
          name: 'Chin Tucks',
          durationSeconds: 40,
          instruction: 'Gently draw chin back, hold 5 sec, release.',
          pose: ExercisePose.neckRoll,
        ),
        ExerciseStep(
          name: 'Neck Side Release',
          durationSeconds: 45,
          instruction: 'Ear to shoulder each side. No forcing.',
          pose: ExercisePose.neckSideRelease,
        ),
        ExerciseStep(
          name: 'Upper Trap Release',
          durationSeconds: 40,
          instruction: 'Shoulder rolls backward slowly.',
          pose: ExercisePose.shoulderShrug,
        ),
      ],
    ),
    ExerciseSession(
      id: 'back_saver',
      title: 'Back Saver',
      subtitle: 'Lower back decompression',
      durationMinutes: 5,
      focusAreas: [PainArea.lowerBack],
      icon: Icons.chair_rounded,
      steps: [
        ExerciseStep(
          name: 'Seated Cat Cow',
          durationSeconds: 45,
          instruction: 'Arch and round with breath.',
          pose: ExercisePose.seatedCatCow,
        ),
        ExerciseStep(
          name: 'Seated Twist',
          durationSeconds: 45,
          instruction: 'Twist left and right gently.',
          pose: ExercisePose.seatedTwist,
        ),
        ExerciseStep(
          name: 'Standing Extension',
          durationSeconds: 45,
          instruction: 'Hands on lower back, lean back slightly.',
          pose: ExercisePose.standingBackExtension,
        ),
      ],
    ),
    ExerciseSession(
      id: 'upper_back_relief',
      title: 'Upper Back Relief',
      subtitle: 'Thoracic & trap release',
      durationMinutes: 5,
      focusAreas: [PainArea.upperBack, PainArea.shoulders],
      icon: Icons.vertical_align_top_rounded,
      steps: [
        ExerciseStep(
          name: 'Thoracic Extension',
          durationSeconds: 50,
          instruction: 'Hands behind head. Arch upper back over chair.',
          pose: ExercisePose.thoracicExtension,
          tip: 'Lead with your chest, not your neck.',
        ),
        ExerciseStep(
          name: 'Standing Back Extension',
          durationSeconds: 45,
          instruction: 'Hands on lower back. Lean back slightly.',
          pose: ExercisePose.standingBackExtension,
        ),
        ExerciseStep(
          name: 'Chest Opener',
          durationSeconds: 45,
          instruction: 'Clasp hands behind back. Open chest gently.',
          pose: ExercisePose.chestOpener,
        ),
      ],
    ),
    ExerciseSession(
      id: 'hip_opener',
      title: 'Hip Opener',
      subtitle: 'Tight hip flexors',
      durationMinutes: 6,
      focusAreas: [PainArea.hips],
      icon: Icons.directions_walk_rounded,
      steps: [
        ExerciseStep(
          name: 'Hip Flexor Stretch',
          durationSeconds: 60,
          instruction: 'Lunge position, gentle forward lean.',
          pose: ExercisePose.hipFlexorStretch,
        ),
        ExerciseStep(
          name: 'Figure 4 Stretch',
          durationSeconds: 60,
          instruction: 'Ankle on knee, lean forward.',
          pose: ExercisePose.figure4Stretch,
        ),
      ],
    ),
    ExerciseSession(
      id: 'eye_reset',
      title: 'Eye Reset',
      subtitle: 'Screen strain relief',
      durationMinutes: 2,
      focusAreas: [PainArea.neck],
      icon: Icons.visibility_outlined,
      steps: [
        ExerciseStep(
          name: '20 20 20 Rule',
          durationSeconds: 30,
          instruction: 'Look 20 feet away for 20 seconds.',
          pose: ExercisePose.deskStretch,
        ),
        ExerciseStep(
          name: 'Neck Rolls',
          durationSeconds: 30,
          instruction: 'Gentle neck circles.',
          pose: ExercisePose.neckRoll,
        ),
        ExerciseStep(
          name: 'Palming',
          durationSeconds: 30,
          instruction: 'Cover eyes with palms, breathe deeply.',
          pose: ExercisePose.deepBreathing,
        ),
      ],
    ),
    ExerciseSession(
      id: 'shoulder_melt',
      title: 'Shoulder Melt',
      subtitle: 'Upper trap release',
      durationMinutes: 4,
      focusAreas: [PainArea.shoulders],
      icon: Icons.spa_outlined,
      steps: [
        ExerciseStep(
          name: 'Shoulder Shrugs',
          durationSeconds: 40,
          instruction: 'Lift, hold, release slowly.',
          pose: ExercisePose.shoulderShrug,
        ),
        ExerciseStep(
          name: 'Chest Opener',
          durationSeconds: 45,
          instruction: 'Clasp hands behind back.',
          pose: ExercisePose.chestOpener,
        ),
        ExerciseStep(
          name: 'Thoracic Extension',
          durationSeconds: 45,
          instruction: 'Arch upper back over chair.',
          pose: ExercisePose.thoracicExtension,
        ),
      ],
    ),
  ];

  List<ExerciseSession> get allPrograms => [..._sessions, ..._premiumSessions];

  @override
  bool isPremiumProgram(String id) =>
      _premiumSessions.any((s) => s.id == id);

  @override
  List<ExerciseSession> getPremiumPrograms() => List.unmodifiable(_premiumSessions);

  @override
  List<ExerciseSession> getTodaySessions(UserProfile profile) {
    return _sessions
        .map(
          (s) {
            final tailored = _tailorForProfile(s, profile);
            AppLogger.debug(
              'sessions',
              'today ${tailored.id} lead=${tailored.steps.firstOrNull?.pose.name}',
            );
            return tailored.copyWith(
              isCompleted: _cache.isSessionCompletedToday(s.id),
            );
          },
        )
        .toList();
  }

  /// Reorders steps so the user's pain areas lead each daily session.
  ExerciseSession _tailorForProfile(ExerciseSession session, UserProfile profile) {
    if (profile.painAreas.isEmpty) return session;

    final prioritized = _prioritizeSteps(session.steps, profile.painAreas);
    if (prioritized == session.steps) return session;

    return ExerciseSession(
      id: session.id,
      title: session.title,
      subtitle: _subtitleForSteps(prioritized, session.subtitle),
      durationMinutes: session.durationMinutes,
      focusAreas: session.focusAreas,
      steps: prioritized,
      isCompleted: session.isCompleted,
      icon: session.icon,
    );
  }

  static String _subtitleForSteps(List<ExerciseStep> steps, String fallback) {
    final lead = steps.firstOrNull;
    if (lead == null) return fallback;
    return lead.name;
  }

  static List<ExerciseStep> _prioritizeSteps(
    List<ExerciseStep> steps,
    Set<PainArea> areas,
  ) {
    final matching = <ExerciseStep>[];
    final rest = <ExerciseStep>[];
    for (final step in steps) {
      if (_poseTargetsAnyArea(step.pose, areas)) {
        matching.add(step);
      } else {
        rest.add(step);
      }
    }
    if (matching.isEmpty) return steps;
    return [...matching, ...rest];
  }

  static bool _poseTargetsAnyArea(ExercisePose pose, Set<PainArea> areas) {
    return _posePainAreas[pose]?.any(areas.contains) ?? false;
  }

  static bool stepTargetsArea(ExerciseStep step, PainArea area) {
    return _posePainAreas[step.pose]?.contains(area) ?? false;
  }

  static bool sessionMatchesArea(ExerciseSession session, PainArea area) {
    return session.focusAreas.contains(area) ||
        session.steps.any((step) => stepTargetsArea(step, area));
  }

  static const _posePainAreas = {
    ExercisePose.neckRoll: {PainArea.neck},
    ExercisePose.neckSideRelease: {PainArea.neck},
    ExercisePose.shoulderShrug: {PainArea.shoulders, PainArea.neck},
    ExercisePose.seatedTwist: {PainArea.lowerBack, PainArea.upperBack},
    ExercisePose.chestOpener: {PainArea.shoulders, PainArea.upperBack},
    ExercisePose.seatedCatCow: {PainArea.lowerBack, PainArea.upperBack},
    ExercisePose.hipFlexorStretch: {PainArea.hips, PainArea.lowerBack},
    ExercisePose.standingBackExtension: {PainArea.lowerBack, PainArea.upperBack},
    ExercisePose.thoracicExtension: {PainArea.upperBack, PainArea.shoulders},
    ExercisePose.figure4Stretch: {PainArea.hips},
    ExercisePose.childPoseChair: {
      PainArea.lowerBack,
      PainArea.upperBack,
      PainArea.hips,
    },
    ExercisePose.deepBreathing: <PainArea>{},
    ExercisePose.deskStretch: {PainArea.neck},
  };

  @override
  ExerciseSession? getSessionById(String id) {
    for (final s in allPrograms) {
      if (s.id == id) return s;
    }
    return null;
  }

  @override
  void markCompleted(String sessionId) {
    _cache.completeSession(sessionId: sessionId);
  }

  @override
  WeeklyProgress getWeeklyProgress(UserProfile profile) {
    return WeeklyProgressCalculator(
      logs: _cache.sessionLogs,
      mobilityScore: _cache.mobilityScore?.overall,
      programStartDate: _cache.state.programStartDate,
      sessions: allPrograms,
      profile: profile,
    ).calculate();
  }
}

/// Backward-compatible alias.
typedef MockSessionRepository = CachedSessionRepository;
