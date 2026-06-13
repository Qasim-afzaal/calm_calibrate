import 'package:calm_calibrate/core/constants/app_spacing.dart';
import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_event.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_state.dart';
import 'package:calm_calibrate/presentation/widgets/feature_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _lastSessionCount = 0;
  int _lastDay = 1;
  bool _lastPremium = false;
  bool _lastCheckedIn = false;

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] home_screen loaded'); // auth-check-debug

    _captureRefreshSignals();
    AppCache.instance.addListener(_onCacheUpdated);
    context.read<HomeBloc>().add(const HomeLoadRequested());
  }

  @override
  void dispose() {
    AppCache.instance.removeListener(_onCacheUpdated);
    super.dispose();
  }

  void _captureRefreshSignals() {
    final cache = AppCache.instance;
    _lastSessionCount = cache.sessionLogs.length;
    _lastDay = cache.currentDay;
    _lastPremium = SubscriptionRepository.instance.isPremium;
    _lastCheckedIn = cache.checkedInToday;
  }

  void _onCacheUpdated() {
    if (!mounted) return;
    final cache = AppCache.instance;
    final premium = SubscriptionRepository.instance.isPremium;
    final shouldRefresh = cache.sessionLogs.length != _lastSessionCount ||
        cache.currentDay != _lastDay ||
        premium != _lastPremium ||
        cache.checkedInToday != _lastCheckedIn;
    if (!shouldRefresh) return;

    _captureRefreshSignals();
    context.read<HomeBloc>().add(const HomeRefreshRequested());
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            final engagement = EngagementRepository.instance;
            final isPremium = SubscriptionRepository.instance.isPremium;
            final posture = AppCache.instance.latestPostureAnalysis;
            final sub = SubscriptionRepository.instance;
            final screenW = MediaQuery.sizeOf(context).width;
            final compactHeader = screenW < 360;
            final hPad = context.metrics.horizontalPadding;

            return RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<HomeBloc>();
                bloc.add(const HomeRefreshRequested());
                await bloc.stream.firstWhere((s) => !s.isLoading);
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                children: [
                  SizedBox(height: AppSpacing.lg),

                  // ── Header (responsive — no overflow) ──────────────
                  FadeSlideIn(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.greeting},',
                                style: TextStyle(
                                  color: c.textSecondary,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 2),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8,
                                runSpacing: 4,
                                children: [
                                  Text(
                                    state.profile.name == 'there'
                                        ? 'Desk warrior'
                                        : state.profile.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: compactHeader ? 22 : null),
                                  ),
                                  if (isPremium) _ProBadge(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        StreakBadge(
                          days: state.profile.streakDays,
                          compact: compactHeader,
                        ),
                      ],
                    ),
                  ),

                  // ── Pro: status + posture tracking ─────────────────
                  if (isPremium) ...[
                    SizedBox(height: AppSpacing.md),
                    FadeSlideIn(
                      child: _ProStatusBar(
                        trialDaysLeft: sub.trialDaysLeft,
                        postureScore: posture?.score,
                        onPostureTap: () => context.push('/check-in'),
                      ),
                    ),
                  ],

                  SizedBox(height: AppSpacing.lg),
                  StaggeredColumn(
                    children: [
                      JourneyDayCard(
                        day: engagement.currentDay,
                        title: engagement.todayPlan?.title ?? 'Daily goal',
                        action: engagement.todayPlan?.action ??
                            'Complete a desk break today',
                        onTap: () => context.push('/journey'),
                      ),
                      if (engagement.shouldShowCheckIn) ...[
                        SizedBox(height: AppSpacing.md),
                        CheckInBanner(
                          onTap: () => context.push('/check-in'),
                        ),
                      ],
                      SizedBox(height: AppSpacing.lg),
                      SmartBreakCard(
                        minutesUntilBreak: state.nextBreakMinutes,
                        isPremium: isPremium,
                        aiHint: posture != null
                            ? 'AI picked for your ${posture.issues.first.toLowerCase()}'
                            : null,
                        onTap: () {
                          if (isPremium) {
                            context.push('/smart-break');
                          } else {
                            showProLockSheet(
                              context,
                              feature: 'Smart Break reminders',
                              benefit:
                                  'Pro times breaks from your posture & sitting pattern — '
                                  'AI picks the right 90-sec reset when you need it.',
                            );
                          }
                        },
                      ),

                      // ── Pro: all 6 paywall features ─────────────────
                      if (isPremium) ...[
                        SizedBox(height: AppSpacing.lg),
                        SectionHeader(title: 'Your Pro features'),
                        SizedBox(height: AppSpacing.md),
                        ProFeatureGrid(),
                      ] else ...[
                        SizedBox(height: AppSpacing.md),
                        _UpgradeBanner(
                          onTap: () => context.push('/premium'),
                        ),
                      ],
                    ],
                  ),

                  SizedBox(height: AppSpacing.xxl),

                  // ── Today's sessions ───────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: SectionHeader(
                          title: isPremium
                              ? 'Today\'s AI Plan'
                              : 'Today\'s Sessions',
                        ),
                      ),
                      if (isPremium)
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: _AiPlanBadge(),
                        ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),

                  if (isPremium)
                    AiDailyPlanSection()
                  else ...[
                    AiDailyPlanLockedTeaser(),
                    SizedBox(height: AppSpacing.md),
                    ...state.sessions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final session = entry.value;
                      final locked = !sub.canAccessDailySession(index);
                      return Padding(
                        padding: EdgeInsets.only(bottom: AppSpacing.md),
                        child: FadeSlideIn(
                          delay: Duration(milliseconds: 80 * (index + 4)),
                          child: SessionCard(
                            icon: session.icon,
                            title: session.title,
                            subtitle: session.subtitle,
                            durationMinutes: session.durationMinutes,
                            isCompleted: session.isCompleted,
                            isLocked: locked,
                            onTap: () {
                              if (locked) {
                                showProLockSheet(
                                  context,
                                  feature: 'Extra daily sessions',
                                  benefit:
                                      'Free plan includes 1 session per day. '
                                      'Pro unlocks your full AI plan — morning, '
                                      'midday & evening breaks.',
                                );
                              } else {
                                context.push('/pre-workout/${session.id}');
                              }
                            },
                          ),
                        ),
                      );
                    }),
                    if (!isPremium) ...[
                      SizedBox(height: AppSpacing.sm),
                      MoodSoundLockedTeaser(),
                    ],
                  ],

                  // ── Pro: quick access to full library ──────────────
                  if (isPremium) ...[
                    SizedBox(height: AppSpacing.lg),
                    _ProgramsCta(onTap: () => context.go('/sessions')),
                  ],

                  SizedBox(height: 80),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Small reusable widgets ──────────────────────────────────────────

class _ProBadge extends StatelessWidget {
  _ProBadge();

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: c.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        'PRO',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _AiPlanBadge extends StatelessWidget {
  _AiPlanBadge();

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: c.primaryLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, size: 14, color: c.primary),
          SizedBox(width: 4),
          Text(
            'AI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: c.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProStatusBar extends StatelessWidget {
  _ProStatusBar({
    required this.trialDaysLeft,
    required this.onPostureTap,
    this.postureScore,
  });

  final int trialDaysLeft;
  final int? postureScore;
  final VoidCallback onPostureTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Row(
      children: [
        if (postureScore != null)
          Expanded(
            child: GestureDetector(
              onTap: onPostureTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: c.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.accessibility_new,
                      color: c.primary,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Posture $postureScore/100',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: c.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: c.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (postureScore != null) SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: c.border),
          ),
          child: Text(
            '$trialDaysLeft d trial',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: c.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgramsCta extends StatelessWidget {
  _ProgramsCta({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Material(
      color: c.navy,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.library_books_rounded,
                  color: c.primary,
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse 50+ programs',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Neck, back, hips & more — all unlocked',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpgradeBanner extends StatelessWidget {
  _UpgradeBanner({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              c.navy,
              c.navy.withValues(alpha: 0.85),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(Icons.workspace_premium, color: c.primary, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unlock Pro',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'AI posture · mood sounds · 50+ programs',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
