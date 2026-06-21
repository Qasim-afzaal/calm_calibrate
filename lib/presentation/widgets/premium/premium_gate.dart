import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shows [child] for Pro users; otherwise shows lock overlay → paywall.
class PremiumGate extends StatelessWidget {
  const PremiumGate({
    super.key,
    required this.child,
    this.lockedChild,
    this.featureName = 'Pro feature',
  });

  final Widget child;
  final Widget? lockedChild;
  final String featureName;

  @override
  Widget build(BuildContext context) {
    final sub = SubscriptionRepository.instance;
    if (!SubscriptionFeatures.enabled || sub.isPremium) {
      return child;
    }
    return lockedChild ??
        _LockedPreview(
          featureName: featureName,
          onUnlock: () => context.push('/premium'),
        );
  }
}

class _LockedPreview extends StatelessWidget {
  const _LockedPreview({
    required this.featureName,
    required this.onUnlock,
  });

  final String featureName;
  final VoidCallback onUnlock;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onUnlock,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white24),
            color: Colors.white.withValues(alpha: 0.06),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lock_rounded, color: Colors.white70),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featureName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'Unlock with Pro',
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }
}
