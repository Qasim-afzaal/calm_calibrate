import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/engagement_journey.dart';

/// Engagement state — backed by local cache until backend is ready.
class EngagementRepository {
  EngagementRepository._();
  static final EngagementRepository instance = EngagementRepository._();

  final _cache = AppCache.instance;

  int get currentDay => _cache.currentDay;
  int get streakDays => _cache.profile.streakDays;
  bool get checkedInToday => _cache.state.checkedInToday;
  int get prePainScore => _cache.state.prePainScore;

  JourneyDay? get todayPlan => _cache.todayPlan;

  bool get shouldShowCheckIn => _cache.shouldShowCheckIn;

  bool get shouldShowReEngagement {
    final last = _cache.state.lastActiveDate;
    if (last == null) return false;
    return DateTime.now().difference(last).inDays >= 2;
  }

  JourneyDay? get pendingMilestone => _cache.pendingMilestone;

  List<Achievement> get achievements => _cache.achievements;

  bool isDayCompleted(int day) => _cache.isDayCompleted(day);
  bool isDayCurrent(int day) => _cache.isDayCurrent(day);

  void simulateDay(int day) => _cache.simulateDay(day);

  void recordCheckIn({required int painScore}) =>
      _cache.recordCheckIn(painScore: painScore);

  void completeSession() {
    // Handled inside AppCache.logSession — kept for API compatibility.
  }

  void markMilestoneSeen(int day) => _cache.markMilestoneSeen(day);

  void advanceDay() => _cache.advanceDay();
}
