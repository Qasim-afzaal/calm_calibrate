/// Toggle Pro subscription / paywall until RevenueCat is integrated.
///
/// When [enabled] is false:
/// - Paywalls, upgrade banners, and lock sheets are hidden
/// - Pro-gated features remain accessible (no purchase path yet)
/// - `/premium` redirects to home
abstract final class SubscriptionFeatures {
  static const enabled = false;

  /// Debug helper — call from dev tools or startup checks.
  static String get debugStatus =>
      'subscription enabled=$enabled (RevenueCat pending)';
}
