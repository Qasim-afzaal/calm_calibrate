import 'package:calm_calibrate/presentation/blocs/assessment/assessment_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_event.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_state.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_event.dart';
import 'package:calm_calibrate/presentation/blocs/home/home_state.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_event.dart';
import 'package:calm_calibrate/presentation/blocs/progress/progress_state.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/workout/workout_state.dart';
import 'package:calm_calibrate/presentation/screens/achievements/achievements_screen.dart';
import 'package:calm_calibrate/presentation/screens/dev/screen_catalog_screen.dart';
import 'package:calm_calibrate/presentation/screens/engagement/daily_checkin_screen.dart';
import 'package:calm_calibrate/presentation/screens/engagement/pre_workout_checkin_screen.dart';
import 'package:calm_calibrate/presentation/screens/engagement/re_engagement_screen.dart';
import 'package:calm_calibrate/presentation/screens/engagement/smart_break_prompt_screen.dart';
import 'package:calm_calibrate/presentation/screens/engagement/streak_milestone_screen.dart';
import 'package:calm_calibrate/presentation/screens/engagement/weekly_recap_screen.dart';
import 'package:calm_calibrate/presentation/screens/home/home_screen.dart';
import 'package:calm_calibrate/presentation/screens/journey/journey_map_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/assessment_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/goals_reminders_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/notifications_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/pain_selector_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/personalized_plan_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/score_result_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/splash_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/welcome_screen.dart';
import 'package:calm_calibrate/presentation/screens/onboarding/work_pattern_screen.dart';
import 'package:calm_calibrate/presentation/screens/premium/premium_screen.dart';
import 'package:calm_calibrate/presentation/screens/profile/profile_screen.dart';
import 'package:calm_calibrate/presentation/screens/progress/progress_screen.dart';
import 'package:calm_calibrate/presentation/screens/sessions/sessions_library_screen.dart';
import 'package:calm_calibrate/presentation/screens/settings/reminders_settings_screen.dart';
import 'package:calm_calibrate/presentation/screens/shell/main_shell.dart';
import 'package:calm_calibrate/presentation/screens/workout/active_session_screen.dart';
import 'package:calm_calibrate/presentation/screens/workout/session_complete_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => WelcomeScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (_) => OnboardingBloc(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/onboarding/pain',
            builder: (context, state) => PainSelectorScreen(),
          ),
          GoRoute(
            path: '/onboarding/work-pattern',
            builder: (context, state) => WorkPatternScreen(),
          ),
          GoRoute(
            path: '/onboarding/goals',
            builder: (context, state) => GoalsRemindersScreen(),
          ),
          GoRoute(
            path: '/onboarding/notifications',
            builder: (context, state) => NotificationsScreen(),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (_) => AssessmentBloc(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/onboarding/assessment',
            builder: (context, state) => AssessmentScreen(),
          ),
          GoRoute(
            path: '/onboarding/score',
            builder: (context, state) => ScoreResultScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/onboarding/plan',
        builder: (context, state) => PersonalizedPlanScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => BlocProvider(
                  create: (_) => HomeBloc(),
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/progress',
                builder: (context, state) => BlocProvider(
                  create: (_) => ProgressBloc(),
                  child: ProgressScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sessions',
                builder: (context, state) => SessionsLibraryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/check-in',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => DailyCheckInScreen(),
      ),
      GoRoute(
        path: '/pre-workout/:sessionId',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return PreWorkoutCheckInScreen(sessionId: sessionId);
        },
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (_) => WorkoutBloc(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/workout/:sessionId',
            builder: (context, state) {
              final sessionId = state.pathParameters['sessionId']!;
              return ActiveSessionScreen(sessionId: sessionId);
            },
            routes: [
              GoRoute(
                path: 'complete',
                builder: (context, state) => SessionCompleteScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/smart-break',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => SmartBreakPromptScreen(),
      ),
      GoRoute(
        path: '/weekly-recap',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => WeeklyRecapScreen(),
      ),
      GoRoute(
        path: '/re-engage',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ReEngagementScreen(),
      ),
      GoRoute(
        path: '/milestone/:day',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final day = int.parse(state.pathParameters['day']!);
          return StreakMilestoneScreen(day: day);
        },
      ),
      GoRoute(
        path: '/journey',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => JourneyMapScreen(),
      ),
      GoRoute(
        path: '/achievements',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => AchievementsScreen(),
      ),
      GoRoute(
        path: '/settings/reminders',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => RemindersSettingsScreen(),
      ),
      GoRoute(
        path: '/premium',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => PremiumScreen(),
      ),
      GoRoute(
        path: '/dev/screens',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ScreenCatalogScreen(),
      ),
    ],
  );
}
