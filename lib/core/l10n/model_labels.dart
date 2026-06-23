import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/l10n/app_localizations.dart';

extension PainAreaL10n on PainArea {
  String localized(AppLocalizations l10n) => switch (this) {
        PainArea.neck => l10n.painNeck,
        PainArea.shoulders => l10n.painShoulders,
        PainArea.upperBack => l10n.painUpperBack,
        PainArea.lowerBack => l10n.painLowerBack,
        PainArea.hips => l10n.painHips,
      };
}

extension BreakTimeL10n on BreakTime {
  String localized(AppLocalizations l10n) => switch (this) {
        BreakTime.morning => l10n.breakMorning,
        BreakTime.lunch => l10n.breakLunch,
        BreakTime.afternoon => l10n.breakAfternoon,
        BreakTime.evening => l10n.breakEvening,
      };
}

extension UserGoalL10n on UserGoal {
  String localized(AppLocalizations l10n) => switch (this) {
        UserGoal.reduceNeckPain => l10n.goalReduceNeckPain,
        UserGoal.fixPosture => l10n.goalFixPosture,
        UserGoal.moreEnergy => l10n.goalMoreEnergy,
        UserGoal.preventInjury => l10n.goalPreventInjury,
      };
}

extension SittingHoursL10n on SittingHours {
  String localized(AppLocalizations l10n) => switch (this) {
        SittingHours.fourToSix => l10n.sittingFourToSix,
        SittingHours.sixToEight => l10n.sittingSixToEight,
        SittingHours.eightPlus => l10n.sittingEightPlus,
      };

  String localizedHoursUnit(AppLocalizations l10n) => l10n.hours;
}

String localizedPainAreaFromLabel(AppLocalizations l10n, String label) {
  for (final area in PainArea.values) {
    if (area.label == label) return area.localized(l10n);
  }
  return label;
}
