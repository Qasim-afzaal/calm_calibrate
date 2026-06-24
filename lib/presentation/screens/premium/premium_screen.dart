import 'dart:math' as math;

import 'package:calm_calibrate/core/animations/loop_animation.dart';
import 'package:calm_calibrate/core/animations/pulse_ring.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/presentation/widgets/premium/cancel_premium_flow.dart';
import 'package:calm_calibrate/presentation/widgets/premium/paywall_cta_button.dart';
import 'package:calm_calibrate/presentation/widgets/premium/paywall_exercise_slider.dart';
import 'package:calm_calibrate/presentation/widgets/premium/paywall_features_carousel.dart';
import 'package:calm_calibrate/presentation/widgets/premium/paywall_trial_status.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PremiumScreen extends StatefulWidget {
  PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen>
    with SingleTickerProviderStateMixin {
  PremiumPlan _plan = PremiumPlan.monthly;
  bool _loading = false;
  late final AnimationController _bgDrift;

  static final _carouselFeatures = [
    PaywallFeatureItem(
      icon: Icons.fitness_center_rounded,
      title: '50+ Desk Programs',
      description: 'Neck, back, hips, shoulders. Targeted for desk workers',
    ),
    PaywallFeatureItem(
      icon: Icons.auto_awesome_rounded,
      title: 'AI Posture Analysis',
      description: 'Spot forward head and slouch before pain builds up',
    ),
    PaywallFeatureItem(
      icon: Icons.calendar_today_rounded,
      title: 'Personalized Daily Plan',
      description: 'Morning, midday & evening sessions built for you',
    ),
    PaywallFeatureItem(
      icon: Icons.music_note_rounded,
      title: 'Mood Soundscapes',
      description: 'Ambient audio matched to stressed, tired, or calm',
    ),
    PaywallFeatureItem(
      icon: Icons.notifications_active_rounded,
      title: 'Smart Break Reminders',
      description: 'Smart timed 90 sec resets between meetings',
    ),
    PaywallFeatureItem(
      icon: Icons.insights_rounded,
      title: 'Weekly AI Reports',
      description: 'Track mobility score and pain relief over time',
    ),
    PaywallFeatureItem(
      icon: Icons.desktop_windows_rounded,
      title: 'Desktop Companion',
      description: 'Menubar app coming soon. Breaks without leaving work',
    ),
  ];

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] premium_screen loaded'); // auth-check-debug

    _bgDrift = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    LoopAnimation.repeatLinear(_bgDrift);
    AppCache.instance.addListener(_onCacheUpdated);
  }

  void _onCacheUpdated() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    AppCache.instance.removeListener(_onCacheUpdated);
    _bgDrift.dispose();
    super.dispose();
  }

  Future<void> _startTrial() async {
    setState(() => _loading = true);
    await SubscriptionRepository.instance.startFreeTrial(_plan);
    if (!mounted) return;
    setState(() => _loading = false);
    final l10n = context.l10n;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.welcomeProTrialStarted),
        backgroundColor: context.appColors.success,
      ),
    );
    context.go('/home');
  }

  Future<void> _cancelTrial() async {
    final cancelled = await cancelPremiumSubscription(context);
    if (!mounted || !cancelled) return;
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isPremium = SubscriptionRepository.instance.isPremium;
    final m = context.metrics;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: c.navy,
      body: Stack(
        children: [
          _AnimatedBackground(drift: _bgDrift),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: m.isCompact ? 36 : 44,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(minWidth: 40, minHeight: 40),
                      icon: Icon(Icons.close, color: Colors.white70, size: 22),
                      onPressed: () => context.pop(),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: m.horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaywallExerciseSlider(
                          slideHeight: m.paywallSlideHeight,
                          poseSize: m.paywallPoseSize,
                        ),
                        SizedBox(height: m.sectionGap),
                        _ProHeaderRow(compact: m.isCompact, l10n: l10n),
                        if (isPremium) ...[
                          SizedBox(height: m.sectionGap),
                          PaywallTrialStatus(
                            daysLeft:
                                SubscriptionRepository.instance.trialDaysLeft,
                          ),
                        ],
                        SizedBox(height: m.sectionGap),
                        Text(
                          l10n.unlockFullRecovery,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: m.headlineSize,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          l10n.paywallTagline,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: m.isCompact ? 12 : 13,
                          ),
                        ),
                        if (!isPremium) ...[
                          SizedBox(height: m.sectionGap),
                          PaywallFeaturesCarousel(
                            features: _carouselFeatures,
                            cardHeight: m.paywallFeatureCardHeight,
                            compact: m.isCompact,
                            showTitle: !m.isVeryCompact,
                          ),
                        ],
                        SizedBox(height: m.sectionGap),
                      ],
                    ),
                  ),
                ),
                _PaywallFooter(
                  isPremium: isPremium,
                  compact: m.isCompact,
                  ctaHeight: m.paywallCtaHeight,
                  horizontalPadding: m.horizontalPadding,
                  plan: _plan,
                  loading: _loading,
                  l10n: l10n,
                  onPlanSelected: (p) => setState(() => _plan = p),
                  onStartTrial: _startTrial,
                  onContinueHome: () => context.go('/home'),
                  onCancelTrial: _cancelTrial,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProHeaderRow extends StatelessWidget {
  _ProHeaderRow({required this.compact, required this.l10n});

  final bool compact;
  final dynamic l10n;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      children: [
        PulseRing(
          active: !SubscriptionRepository.instance.isPremium,
          child: Container(
            padding: EdgeInsets.all(compact ? 6 : 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  c.primary.withValues(alpha: 0.3),
                  c.primary.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.workspace_premium_rounded,
              color: c.primary,
              size: compact ? 18 : 22,
            ),
          ),
        ),
        SizedBox(width: compact ? 8 : 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.calmCalibratePro,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: compact ? 14 : 15,
                ),
              ),
              Text(
                l10n.fullDeskRecoverySystem,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: compact ? 11 : 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaywallFooter extends StatelessWidget {
  _PaywallFooter({
    required this.isPremium,
    required this.compact,
    required this.ctaHeight,
    required this.horizontalPadding,
    required this.plan,
    required this.loading,
    required this.onPlanSelected,
    required this.onStartTrial,
    required this.onContinueHome,
    required this.onCancelTrial,
    required this.l10n,
  });

  final bool isPremium;
  final bool compact;
  final double ctaHeight;
  final double horizontalPadding;
  final PremiumPlan plan;
  final bool loading;
  final dynamic l10n;
  final ValueChanged<PremiumPlan> onPlanSelected;
  final VoidCallback onStartTrial;
  final VoidCallback onContinueHome;
  final VoidCallback onCancelTrial;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 4, horizontalPadding, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isPremium) ...[
            PaywallCtaButton(
              label: l10n.continueToHome,
              height: ctaHeight,
              onPressed: onContinueHome,
            ),
            TextButton(
              onPressed: onCancelTrial,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.cancelTrial,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: compact ? 12 : 13,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white38,
                ),
              ),
            ),
          ] else ...[
            Row(
              children: [
                Expanded(
                  child: _PlanCard(
                    plan: PremiumPlan.weekly,
                    selected: plan == PremiumPlan.weekly,
                    compact: compact,
                    onTap: () => onPlanSelected(PremiumPlan.weekly),
                    badge: 'Flexible',
                  ),
                ),
                SizedBox(width: compact ? 8 : 10),
                Expanded(
                  child: _PlanCard(
                    plan: PremiumPlan.monthly,
                    selected: plan == PremiumPlan.monthly,
                    compact: compact,
                    onTap: () => onPlanSelected(PremiumPlan.monthly),
                    badge: 'Best value',
                  ),
                ),
              ],
            ),
            SizedBox(height: compact ? 10 : 12),
            PaywallCtaButton(
              label: l10n.startFreeTrial,
              height: ctaHeight,
              isLoading: loading,
              onPressed: loading ? null : onStartTrial,
            ),
          ],
          SizedBox(height: compact ? 4 : 6),
          Center(
            child: Text(
              l10n.trialDisclaimer,
              style: TextStyle(
                color: Colors.white54,
                fontSize: compact ? 11 : 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedBackground extends StatelessWidget {
  _AnimatedBackground({required this.drift});

  final Animation<double> drift;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return AnimatedBuilder(
      animation: drift,
      builder: (context, _) {
        final c = context.appColors;
        final t = drift.value;
        return Stack(
          children: [
            Positioned(
              top: -60 + math.sin(t * 2 * math.pi) * 20,
              right: -40 + math.cos(t * 2 * math.pi) * 15,
              child: _glowOrb(c, 200, 0.3),
            ),
            Positioned(
              bottom: 120 + math.cos(t * 2 * math.pi) * 25,
              left: -80 + math.sin(t * 2 * math.pi + 1) * 20,
              child: _glowOrb(c, 160, 0.18),
            ),
          ],
        );
      },
    );
  }

  Widget _glowOrb(AppColorTokens colors, double size, double alpha) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            colors.primary.withValues(alpha: alpha),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  _PlanCard({
    required this.plan,
    required this.selected,
    required this.compact,
    required this.onTap,
    this.badge,
  });

  final PremiumPlan plan;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 10 : 12,
          vertical: compact ? 10 : 12,
        ),
        decoration: BoxDecoration(
          gradient: selected
              ? LinearGradient(
                  colors: [
                    c.primary.withValues(alpha: 0.28),
                    c.primary.withValues(alpha: 0.06),
                  ],
                )
              : null,
          color: selected ? null : Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? c.primary : Colors.white24,
            width: selected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: c.primary.withValues(alpha: selected ? 0.18 : 0),
              blurRadius: selected ? 10 : 0,
              offset: Offset(0, selected ? 3 : 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badge != null)
              Container(
                margin: EdgeInsets.only(bottom: compact ? 4 : 6),
                padding: EdgeInsets.symmetric(
                  horizontal: compact ? 5 : 7,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? c.primary
                      : c.primary.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: compact ? 8 : 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            Text(
              plan.label,
              style: TextStyle(
                color: selected ? c.primary : Colors.white70,
                fontWeight: FontWeight.w700,
                fontSize: compact ? 12 : 14,
              ),
            ),
            SizedBox(height: compact ? 1 : 2),
            Text(
              plan.price,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: compact ? 14 : 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
