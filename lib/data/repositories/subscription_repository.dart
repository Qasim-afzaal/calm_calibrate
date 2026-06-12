import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';

/// Local subscription state — swap for RevenueCat / StoreKit later.
class SubscriptionRepository {
  SubscriptionRepository._();
  static final SubscriptionRepository instance = SubscriptionRepository._();

  final _cache = AppCache.instance;

  bool get isPremium => _cache.profile.isPremium;
  PremiumPlan? get plan => _cache.premiumPlan;
  DateTime? get premiumSince => _cache.premiumSince;
  int get trialDaysLeft {
    final since = _cache.premiumSince;
    if (since == null) return 0;
    final elapsed = DateTime.now().difference(since).inDays;
    return (7 - elapsed).clamp(0, 7);
  }

  Future<void> startFreeTrial(PremiumPlan plan) =>
      _cache.activatePremium(plan: plan);

  Future<void> cancelPremium() => _cache.deactivatePremium();

  /// Free users get the first daily session; Pro gets all.
  bool canAccessDailySession(int index) => isPremium || index == 0;

  bool get canUseSmartBreak => isPremium;

  bool get canUseMoodSound => isPremium;

  bool canAccessProgram(String sessionId, SessionRepository sessions) =>
      isPremium || !sessions.isPremiumProgram(sessionId);
}
