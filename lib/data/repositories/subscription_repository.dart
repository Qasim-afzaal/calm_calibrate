import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';

/// Local subscription state — swap for RevenueCat / StoreKit later.
class SubscriptionRepository {
  SubscriptionRepository._();
  static final SubscriptionRepository instance = SubscriptionRepository._();

  final _cache = AppCache.instance;

  /// Whether paywall UI, upsells, and `/premium` are active.
  bool get showSubscriptionUi => SubscriptionFeatures.enabled;

  /// Pro access for feature gates — bypassed until RevenueCat is wired.
  bool get hasProAccess =>
      !SubscriptionFeatures.enabled || _cache.profile.isPremium;

  bool get isPremium => _cache.profile.isPremium;
  PremiumPlan? get plan => _cache.premiumPlan;
  DateTime? get premiumSince => _cache.premiumSince;
  int get trialDaysLeft {
    final since = _cache.premiumSince;
    if (since == null) return 0;
    final elapsed = DateTime.now().difference(since).inDays;
    return (7 - elapsed).clamp(0, 7);
  }

  Future<void> startFreeTrial(PremiumPlan plan) {
    if (!SubscriptionFeatures.enabled) return Future.value();
    return _cache.activatePremium(plan: plan);
  }

  Future<void> cancelPremium() {
    if (!SubscriptionFeatures.enabled) return Future.value();
    return _cache.deactivatePremium();
  }

  /// Free users get the first daily session; Pro gets all.
  bool canAccessDailySession(int index) => hasProAccess || index == 0;

  bool get canUseSmartBreak => hasProAccess;

  bool get canUseMoodSound => hasProAccess;

  bool canAccessProgram(String sessionId, SessionRepository sessions) =>
      hasProAccess || !sessions.isPremiumProgram(sessionId);
}
