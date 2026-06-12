import 'package:equatable/equatable.dart';

enum PainArea {
  neck,
  shoulders,
  upperBack,
  lowerBack,
  hips;

  String get label => switch (this) {
        PainArea.neck => 'Neck',
        PainArea.shoulders => 'Shoulders',
        PainArea.upperBack => 'Upper Back',
        PainArea.lowerBack => 'Lower Back',
        PainArea.hips => 'Hips',
      };

  String get shortLabel => switch (this) {
        PainArea.neck => 'Neck',
        PainArea.shoulders => 'Shoulders',
        PainArea.upperBack => 'Upper Back',
        PainArea.lowerBack => 'Lower Back',
        PainArea.hips => 'Hips',
      };
}

enum BreakTime {
  morning,
  lunch,
  afternoon,
  evening;

  String get label => switch (this) {
        BreakTime.morning => 'Morning',
        BreakTime.lunch => 'Lunch',
        BreakTime.afternoon => 'Afternoon',
        BreakTime.evening => 'Evening',
      };
}

enum UserGoal {
  reduceNeckPain,
  fixPosture,
  moreEnergy,
  preventInjury;

  String get label => switch (this) {
        UserGoal.reduceNeckPain => 'Reduce neck pain',
        UserGoal.fixPosture => 'Fix posture',
        UserGoal.moreEnergy => 'More energy',
        UserGoal.preventInjury => 'Prevent injury',
      };
}

enum SittingHours {
  fourToSix,
  sixToEight,
  eightPlus;

  String get label => switch (this) {
        SittingHours.fourToSix => '4–6 hrs',
        SittingHours.sixToEight => '6–8 hrs',
        SittingHours.eightPlus => '8+ hrs',
      };

  int get hours => switch (this) {
        SittingHours.fourToSix => 5,
        SittingHours.sixToEight => 7,
        SittingHours.eightPlus => 9,
      };
}

class AreaScore extends Equatable {
  const AreaScore({
    required this.area,
    required this.score,
    required this.potentialGain,
  });

  final PainArea area;
  final int score;
  final int potentialGain;

  @override
  List<Object?> get props => [area, score, potentialGain];
}

class MobilityScore extends Equatable {
  const MobilityScore({
    required this.overall,
    required this.areaScores,
  });

  final int overall;
  final List<AreaScore> areaScores;

  @override
  List<Object?> get props => [overall, areaScores];
}
