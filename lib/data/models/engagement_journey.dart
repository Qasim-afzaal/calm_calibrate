import 'package:equatable/equatable.dart';

/// Day-by-day engagement plan for desk worker retention (Day 1 → Day 30).
class JourneyDay extends Equatable {
  const JourneyDay({
    required this.day,
    required this.title,
    required this.goal,
    required this.action,
    required this.screen,
    this.milestone,
    this.pushTitle,
    this.pushBody,
  });

  final int day;
  final String title;
  final String goal;
  final String action;
  final String screen;
  final String? milestone;
  final String? pushTitle;
  final String? pushBody;

  @override
  List<Object?> get props => [day, title, goal, action, screen, milestone];
}

abstract final class JourneyPlan {
  static const days = <JourneyDay>[
    JourneyDay(
      day: 1,
      title: 'First session',
      goal: 'Complete onboarding + 1 break',
      action: 'Finish pain assessment and do Morning Reset',
      screen: '/pre-workout/morning_reset',
      pushTitle: 'Your desk plan is ready',
      pushBody: '90 seconds to relieve neck tension — start now.',
    ),
    JourneyDay(
      day: 2,
      title: 'Build the habit',
      goal: '2 sessions + daily check-in',
      action: 'Log how your neck feels, do Midday Desk Break',
      screen: '/check-in',
      pushTitle: 'How\'s your neck today?',
      pushBody: 'Quick check-in, then a 5-min desk break.',
    ),
    JourneyDay(
      day: 3,
      title: '3-day streak',
      goal: 'Hit 3-day streak',
      action: 'Complete any session before end of day',
      screen: '/milestone/3',
      milestone: '3-Day Streak 🔥',
      pushTitle: 'Don\'t break your streak!',
      pushBody: 'One 90-sec break keeps your 3-day streak alive.',
    ),
    JourneyDay(
      day: 4,
      title: 'Afternoon slump',
      goal: 'Try Smart Break at 3pm',
      action: 'Respond to smart break prompt',
      screen: '/smart-break',
      pushTitle: '3pm slump? Move for 90 sec',
      pushBody: 'Your back will thank you.',
    ),
    JourneyDay(
      day: 5,
      title: 'Explore library',
      goal: 'Try a new pain-area program',
      action: 'Open Sessions and pick Neck Relief',
      screen: '/sessions',
    ),
    JourneyDay(
      day: 6,
      title: 'Weekend prep',
      goal: 'Set reminder schedule',
      action: 'Review reminder settings',
      screen: '/settings/reminders',
    ),
    JourneyDay(
      day: 7,
      title: 'Week 1 recap',
      goal: 'Review weekly progress',
      action: 'Open weekly recap — see mobility score change',
      screen: '/weekly-recap',
      milestone: 'Week 1 Complete 🎉',
      pushTitle: 'Your Week 1 report is ready',
      pushBody: 'See how your mobility improved.',
    ),
    JourneyDay(
      day: 8,
      title: 'Deeper recovery',
      goal: 'Complete Evening Deep Recovery',
      action: '12-min evening session before bed',
      screen: '/workout/evening_recovery',
    ),
    JourneyDay(
      day: 10,
      title: 'Posture check',
      goal: 'Retake mobility assessment',
      action: 'Compare score vs Day 1',
      screen: '/onboarding/assessment',
    ),
    JourneyDay(
      day: 14,
      title: '2-week milestone',
      goal: '14-day streak or 10+ sessions',
      action: 'Unlock achievement badge',
      screen: '/milestone/14',
      milestone: '2-Week Warrior 💪',
    ),
    JourneyDay(
      day: 15,
      title: 'Halfway point',
      goal: 'Review journey map',
      action: 'See Day 1–30 progress on journey map',
      screen: '/journey',
    ),
    JourneyDay(
      day: 21,
      title: 'Week 3 recap',
      goal: 'Weekly recap + share progress',
      action: 'Review 3-week mobility trend',
      screen: '/weekly-recap',
    ),
    JourneyDay(
      day: 30,
      title: '30-day graduate',
      goal: 'Complete 30-day program',
      action: 'Final assessment + unlock premium trial',
      screen: '/milestone/30',
      milestone: '30-Day Graduate 🏆',
      pushTitle: 'You did it — 30 days!',
      pushBody: 'Your mobility score improved. Keep going with Pro.',
    ),
  ];

  static JourneyDay? forDay(int day) {
    for (final d in days) {
      if (d.day == day) return d;
    }
    return null;
  }

  /// Returns explicit plan or a sensible default for every day 1–30.
  static JourneyDay resolve(int day) {
    return forDay(day) ??
        JourneyDay(
          day: day,
          title: 'Daily desk break',
          goal: 'Complete at least one session',
          action: 'Do a 3–5 min mobility break at your desk',
          screen: '/home',
        );
  }

  static JourneyDay? milestoneForDay(int day) {
    return days.cast<JourneyDay?>().firstWhere(
          (d) => d?.day == day && d?.milestone != null,
          orElse: () => null,
        );
  }
}

class Achievement extends Equatable {
  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.unlockedDay,
    this.isUnlocked = false,
  });

  final String id;
  final String title;
  final String description;
  final String icon;
  final int unlockedDay;
  final bool isUnlocked;

  Achievement copyWith({bool? isUnlocked}) => Achievement(
        id: id,
        title: title,
        description: description,
        icon: icon,
        unlockedDay: unlockedDay,
        isUnlocked: isUnlocked ?? this.isUnlocked,
      );

  @override
  List<Object?> get props => [id, title, isUnlocked];
}

abstract final class Achievements {
  static const all = [
    Achievement(
      id: 'first_break',
      title: 'First Break',
      description: 'Completed your first desk session',
      icon: '🌱',
      unlockedDay: 1,
    ),
    Achievement(
      id: 'streak_3',
      title: '3-Day Streak',
      description: 'Moved 3 days in a row',
      icon: '🔥',
      unlockedDay: 3,
    ),
    Achievement(
      id: 'week_1',
      title: 'Week 1 Complete',
      description: 'Finished your first week',
      icon: '⭐',
      unlockedDay: 7,
    ),
    Achievement(
      id: 'streak_14',
      title: '2-Week Warrior',
      description: '14 days of desk recovery',
      icon: '💪',
      unlockedDay: 14,
    ),
    Achievement(
      id: 'score_60',
      title: 'Mobility 60+',
      description: 'Mobility score reached 60',
      icon: '📈',
      unlockedDay: 10,
    ),
    Achievement(
      id: 'graduate_30',
      title: '30-Day Graduate',
      description: 'Completed the full program',
      icon: '🏆',
      unlockedDay: 30,
    ),
  ];
}
