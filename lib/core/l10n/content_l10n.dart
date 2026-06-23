import 'package:calm_calibrate/core/l10n/model_labels.dart';
import 'package:calm_calibrate/data/models/engagement_journey.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/workout_mood.dart';
import 'package:calm_calibrate/l10n/app_localizations.dart';

String homeGreeting(AppLocalizations l10n) {
  final hour = DateTime.now().hour;
  if (hour < 12) return l10n.greetingMorning;
  if (hour < 17) return l10n.greetingAfternoon;
  return l10n.greetingEvening;
}

String localizedSessionTitle(AppLocalizations l10n, String id) =>
    switch (id) {
      'morning_reset' => l10n.sessionMorningResetTitle,
      'midday_break' => l10n.sessionMiddayBreakTitle,
      'evening_recovery' => l10n.sessionEveningRecoveryTitle,
      'neck_relief' => l10n.sessionNeckReliefTitle,
      'back_saver' => l10n.sessionBackSaverTitle,
      'upper_back_relief' => l10n.sessionUpperBackReliefTitle,
      'hip_opener' => l10n.sessionHipOpenerTitle,
      'eye_reset' => l10n.sessionEyeResetTitle,
      'shoulder_melt' => l10n.sessionShoulderMeltTitle,
      _ => id,
    };

String localizedSessionSubtitle(AppLocalizations l10n, String id) =>
    switch (id) {
      'morning_reset' => l10n.sessionMorningResetSubtitle,
      'midday_break' => l10n.sessionMiddayBreakSubtitle,
      'evening_recovery' => l10n.sessionEveningRecoverySubtitle,
      'neck_relief' => l10n.sessionNeckReliefSubtitle,
      'back_saver' => l10n.sessionBackSaverSubtitle,
      'upper_back_relief' => l10n.sessionUpperBackReliefSubtitle,
      'hip_opener' => l10n.sessionHipOpenerSubtitle,
      'eye_reset' => l10n.sessionEyeResetSubtitle,
      'shoulder_melt' => l10n.sessionShoulderMeltSubtitle,
      _ => '',
    };

String localizedStepName(AppLocalizations l10n, ExercisePose pose) =>
    switch (pose) {
      ExercisePose.neckRoll => l10n.stepNeckRollsName,
      ExercisePose.shoulderShrug => l10n.stepShoulderShrugsName,
      ExercisePose.seatedTwist => l10n.stepSeatedTwistName,
      ExercisePose.chestOpener => l10n.stepChestOpenerName,
      ExercisePose.neckSideRelease => l10n.stepNeckSideReleaseName,
      ExercisePose.seatedCatCow => l10n.stepSeatedCatCowName,
      ExercisePose.hipFlexorStretch => l10n.stepHipFlexorStretchName,
      ExercisePose.standingBackExtension => l10n.stepStandingBackExtensionName,
      ExercisePose.thoracicExtension => l10n.stepThoracicExtensionName,
      ExercisePose.figure4Stretch => l10n.stepFigure4StretchName,
      ExercisePose.childPoseChair => l10n.stepChildsPoseChairName,
      ExercisePose.deepBreathing => l10n.stepDeepBreathingName,
      ExercisePose.deskStretch => l10n.stepDeskStretchName,
    };

String localizedStepInstruction(AppLocalizations l10n, ExercisePose pose) =>
    switch (pose) {
      ExercisePose.neckRoll => l10n.stepNeckRollsInstruction,
      ExercisePose.shoulderShrug => l10n.stepShoulderShrugsInstruction,
      ExercisePose.seatedTwist => l10n.stepSeatedTwistInstruction,
      ExercisePose.chestOpener => l10n.stepChestOpenerInstruction,
      ExercisePose.neckSideRelease => l10n.stepNeckSideReleaseInstruction,
      ExercisePose.seatedCatCow => l10n.stepSeatedCatCowInstruction,
      ExercisePose.hipFlexorStretch => l10n.stepHipFlexorStretchInstruction,
      ExercisePose.standingBackExtension =>
        l10n.stepStandingBackExtensionInstruction,
      ExercisePose.thoracicExtension => l10n.stepThoracicExtensionInstruction,
      ExercisePose.figure4Stretch => l10n.stepFigure4StretchInstruction,
      ExercisePose.childPoseChair => l10n.stepChildsPoseChairInstruction,
      ExercisePose.deepBreathing => l10n.stepDeepBreathingInstruction,
      ExercisePose.deskStretch => l10n.stepDeskStretchInstruction,
    };

String? localizedStepTip(AppLocalizations l10n, ExercisePose pose) =>
    switch (pose) {
      ExercisePose.neckRoll => l10n.stepNeckRollsTip,
      ExercisePose.shoulderShrug => l10n.stepShoulderShrugsTip,
      ExercisePose.seatedTwist => l10n.stepSeatedTwistTip,
      ExercisePose.chestOpener => l10n.stepChestOpenerTip,
      ExercisePose.neckSideRelease => l10n.stepNeckSideReleaseTip,
      ExercisePose.seatedCatCow => l10n.stepSeatedCatCowTip,
      ExercisePose.hipFlexorStretch => l10n.stepHipFlexorStretchTip,
      ExercisePose.standingBackExtension => l10n.stepStandingBackExtensionTip,
      ExercisePose.thoracicExtension => l10n.stepThoracicExtensionTip,
      ExercisePose.figure4Stretch => l10n.stepFigure4StretchTip,
      ExercisePose.childPoseChair => l10n.stepChildsPoseChairTip,
      ExercisePose.deepBreathing => l10n.stepDeepBreathingTip,
      ExercisePose.deskStretch => l10n.stepDeskStretchTip,
    };

ExerciseSession localizeSession(AppLocalizations l10n, ExerciseSession session) {
  return ExerciseSession(
    id: session.id,
    title: localizedSessionTitle(l10n, session.id),
    subtitle: localizedSessionSubtitle(l10n, session.id),
    durationMinutes: session.durationMinutes,
    focusAreas: session.focusAreas,
    icon: session.icon,
    steps: session.steps
        .map((s) => localizeStep(l10n, s))
        .toList(growable: false),
    isCompleted: session.isCompleted,
  );
}

ExerciseStep localizeStep(AppLocalizations l10n, ExerciseStep step) {
  return ExerciseStep(
    name: localizedStepName(l10n, step.pose),
    durationSeconds: step.durationSeconds,
    instruction: localizedStepInstruction(l10n, step.pose),
    pose: step.pose,
    tip: localizedStepTip(l10n, step.pose),
  );
}

LocalizedJourneyDay localizeJourneyDay(AppLocalizations l10n, JourneyDay day) {
  return LocalizedJourneyDay(
    day: day.day,
    title: _journeyTitle(l10n, day.day) ??
        (JourneyPlan.forDay(day.day) == null
            ? l10n.journeyDayDefaultTitle
            : day.title),
    goal: _journeyGoal(l10n, day.day) ??
        (JourneyPlan.forDay(day.day) == null
            ? l10n.journeyDayDefaultGoal
            : day.goal),
    action: _journeyAction(l10n, day.day) ??
        (JourneyPlan.forDay(day.day) == null
            ? l10n.journeyDayDefaultAction
            : day.action),
    milestone: day.milestone == null
        ? null
        : (_journeyMilestone(l10n, day.day) ?? day.milestone),
    screen: day.screen,
  );
}

class LocalizedJourneyDay {
  const LocalizedJourneyDay({
    required this.day,
    required this.title,
    required this.goal,
    required this.action,
    required this.screen,
    this.milestone,
  });

  final int day;
  final String title;
  final String goal;
  final String action;
  final String screen;
  final String? milestone;
}

String? _journeyTitle(AppLocalizations l10n, int day) => switch (day) {
      1 => l10n.journeyDay1Title,
      2 => l10n.journeyDay2Title,
      3 => l10n.journeyDay3Title,
      4 => l10n.journeyDay4Title,
      5 => l10n.journeyDay5Title,
      6 => l10n.journeyDay6Title,
      7 => l10n.journeyDay7Title,
      8 => l10n.journeyDay8Title,
      10 => l10n.journeyDay10Title,
      14 => l10n.journeyDay14Title,
      15 => l10n.journeyDay15Title,
      21 => l10n.journeyDay21Title,
      30 => l10n.journeyDay30Title,
      _ => null,
    };

String? _journeyGoal(AppLocalizations l10n, int day) => switch (day) {
      1 => l10n.journeyDay1Goal,
      2 => l10n.journeyDay2Goal,
      3 => l10n.journeyDay3Goal,
      4 => l10n.journeyDay4Goal,
      5 => l10n.journeyDay5Goal,
      6 => l10n.journeyDay6Goal,
      7 => l10n.journeyDay7Goal,
      8 => l10n.journeyDay8Goal,
      10 => l10n.journeyDay10Goal,
      14 => l10n.journeyDay14Goal,
      15 => l10n.journeyDay15Goal,
      21 => l10n.journeyDay21Goal,
      30 => l10n.journeyDay30Goal,
      _ => null,
    };

String? _journeyAction(AppLocalizations l10n, int day) => switch (day) {
      1 => l10n.journeyDay1Action,
      2 => l10n.journeyDay2Action,
      3 => l10n.journeyDay3Action,
      4 => l10n.journeyDay4Action,
      5 => l10n.journeyDay5Action,
      6 => l10n.journeyDay6Action,
      7 => l10n.journeyDay7Action,
      8 => l10n.journeyDay8Action,
      10 => l10n.journeyDay10Action,
      14 => l10n.journeyDay14Action,
      15 => l10n.journeyDay15Action,
      21 => l10n.journeyDay21Action,
      30 => l10n.journeyDay30Action,
      _ => null,
    };

String? _journeyMilestone(AppLocalizations l10n, int day) => switch (day) {
      3 => l10n.journeyDay3Milestone,
      7 => l10n.journeyDay7Milestone,
      14 => l10n.journeyDay14Milestone,
      30 => l10n.journeyDay30Milestone,
      _ => null,
    };

String localizedAchievementTitle(AppLocalizations l10n, String id) =>
    switch (id) {
      'first_break' => l10n.achievementFirstBreakTitle,
      'streak_3' => l10n.achievementStreak3Title,
      'week_1' => l10n.achievementWeek1Title,
      'streak_14' => l10n.achievementStreak14Title,
      'score_60' => l10n.achievementScore60Title,
      'graduate_30' => l10n.achievementGraduate30Title,
      _ => id,
    };

String localizedAchievementDesc(AppLocalizations l10n, String id) =>
    switch (id) {
      'first_break' => l10n.achievementFirstBreakDesc,
      'streak_3' => l10n.achievementStreak3Desc,
      'week_1' => l10n.achievementWeek1Desc,
      'streak_14' => l10n.achievementStreak14Desc,
      'score_60' => l10n.achievementScore60Desc,
      'graduate_30' => l10n.achievementGraduate30Desc,
      _ => '',
    };

String localizedMoodLabel(AppLocalizations l10n, WorkoutMood mood) =>
    switch (mood) {
      WorkoutMood.stressed => l10n.moodStressed,
      WorkoutMood.tired => l10n.moodTired,
      WorkoutMood.sore => l10n.moodSore,
      WorkoutMood.focused => l10n.moodFocused,
      WorkoutMood.calm => l10n.moodCalm,
    };

String localizedMoodSoundscape(AppLocalizations l10n, WorkoutMood mood) =>
    switch (mood) {
      WorkoutMood.stressed => l10n.moodStressedSoundscape,
      WorkoutMood.tired => l10n.moodTiredSoundscape,
      WorkoutMood.sore => l10n.moodSoreSoundscape,
      WorkoutMood.focused => l10n.moodFocusedSoundscape,
      WorkoutMood.calm => l10n.moodCalmSoundscape,
    };

String localizedMoodDesc(AppLocalizations l10n, WorkoutMood mood) =>
    switch (mood) {
      WorkoutMood.stressed => l10n.moodStressedDesc,
      WorkoutMood.tired => l10n.moodTiredDesc,
      WorkoutMood.sore => l10n.moodSoreDesc,
      WorkoutMood.focused => l10n.moodFocusedDesc,
      WorkoutMood.calm => l10n.moodCalmDesc,
    };

String localizedPainAreaList(AppLocalizations l10n, Set<PainArea> areas) {
  if (areas.isEmpty) return '';
  return areas.map((a) => a.localized(l10n)).join(', ');
}

String milestoneMessage(AppLocalizations l10n, int day) => switch (day) {
      3 => l10n.milestoneMessageDay3,
      7 => l10n.milestoneMessageDay7,
      14 => l10n.milestoneMessageDay14,
      30 => l10n.milestoneMessageDay30,
      _ => l10n.milestoneMessageDefault,
    };
