# CalmCalibrate MVP Architecture

Local-first Flutter template for shipping habit/wellness MVPs fast. Clone this repo, rebrand, swap onboarding questions and content catalog — keep the architecture.

---

## Stack

| Layer | Package / pattern |
|-------|-------------------|
| UI | Flutter Material 3 |
| State | `flutter_bloc` (feature-scoped, not global) |
| Navigation | `go_router` (ShellRoute + StatefulShellRoute) |
| Persistence | Drift + SQLite (`drift_flutter`) |
| Legacy | SharedPreferences (one-time migration only) |
| Fonts | Poppins via `google_fonts` |
| Charts | `fl_chart` |
| Notifications | `flutter_local_notifications` + `timezone` |

---

## Folder structure

```
lib/
├── app/                    # App shell: bootstrap, router, MaterialApp
│   ├── app.dart
│   ├── bootstrap.dart
│   └── router.dart
├── core/                   # Design system — NO blocs, routes, repos
│   ├── animations/
│   ├── branding/           # AppLogo
│   ├── config/             # AiFeatures feature flags
│   ├── constants/          # ScreenMetrics, spacing, durations
│   ├── theme/              # AppTheme, AppColorTokens, AppTypography
│   └── widgets/            # Reusable UI (barrel: widgets.dart)
├── data/
│   ├── calculators/        # Pure logic (progress, scores)
│   ├── local/              # AppCache, AppState, Drift database
│   ├── models/             # Domain types & enums
│   ├── repositories/       # Abstract contracts + Cached* singletons
│   └── services/           # Side-effect services (AI mock, reminders)
├── presentation/
│   ├── blocs/              # One folder per feature
│   ├── screens/            # Grouped by feature area
│   └── widgets/            # Feature-aware UI (premium, paywall)
└── main.dart               # WidgetsFlutterBinding → Bootstrap → runApp
```

**Rule:** `core/` never imports from `presentation/` or `data/repositories/`.

---

## Data flow

```
┌─────────────┐     ┌──────────┐     ┌────────────┐     ┌──────────┐     ┌─────────┐
│   Screen    │────▶│   BLoC   │────▶│ Repository │────▶│ AppCache │────▶│  Drift  │
│ (optional)  │     │          │     │  (contract)│     │ singleton│     │ SQLite  │
└─────────────┘     └──────────┘     └────────────┘     └──────────┘     └─────────┘
                                              │
                    Some screens call ────────┘
                    AppCache / Repository directly (simple flows)
```

### AppCache

- Single in-memory `AppState`
- `load()` on startup, `persist()` after every mutation
- `ChangeNotifier` — theme/listeners refresh UI
- Owns: streaks, journey days, achievements, check-in gating, premium flags

### Repositories

| Repository | Role |
|------------|------|
| `UserRepository` | Profile, mobility score, session logs |
| `SessionRepository` | Hard-coded exercise catalog + today's picks |
| `EngagementRepository` | Milestones, check-in rules |
| `SubscriptionRepository` | Local premium mock |

Implementation: `CachedUserRepository` (alias `MockUserRepository` — **real local data**, not a fake).

---

## Onboarding

### Screen order

| Step | Route | Screen | BLoC scope |
|------|-------|--------|------------|
| 0 | `/splash` | `splash_screen.dart` | — |
| 1 | `/welcome` | `welcome_screen.dart` | — |
| 2 | `/onboarding/pain` | `pain_selector_screen.dart` | OnboardingBloc |
| 3 | `/onboarding/work-pattern` | `work_pattern_screen.dart` | OnboardingBloc |
| 4 | `/onboarding/goals` | `goals_reminders_screen.dart` | OnboardingBloc |
| 5 | `/onboarding/notifications` | `notifications_screen.dart` | OnboardingBloc |
| 6 | `/onboarding/plan` | `personalized_plan_screen.dart` | — |
| alt | `/onboarding/assessment` → `/onboarding/score` | assessment flow | AssessmentBloc |

### Navigation rules

- **Onboarding steps:** `context.push()` (back stack works)
- **Tab switch / post-onboarding:** `context.go()` (reset stack)
- **Finish:** `profile.copyWith(onboardingComplete: true)` then `context.go('/home')`

### OnboardingBloc events

| Event | Purpose |
|-------|---------|
| `OnboardingPainAreaToggled` | Toggle body pain area |
| `OnboardingNameSet` | User display name |
| `OnboardingSittingHoursSet` | Work hours band |
| `OnboardingBreakTimeToggled` | Active hours (morning/lunch/afternoon/evening) |
| `OnboardingGoalSet` | Primary goal |
| `OnboardingReminderMinutesSet` | 30 / 45 / 60 min |
| `OnboardingSmartRemindersSet` | Smart reminders toggle |
| `OnboardingPartialProfileSaveRequested` | Persist to SQLite on Continue |

### Splash routing (returning users)

```
onboardingComplete?
  yes → pending milestone? → /milestone/:day
      → shouldShowCheckIn?  → /check-in
      → else                 → /home
  no  → /welcome
```

### Feature-flag branch

`lib/core/config/ai_features.dart`:

```dart
abstract final class AiFeatures {
  static const llmEnabled = false;
  static const cameraScanEnabled = false;
}
```

When `cameraScanEnabled == false`:
- Skip camera assessment
- Use `MobilityScoreCalculator.ensureEstimatedScore()` instead
- Notifications → plan directly

---

## Router patterns

**File:** `lib/app/router.dart`

| Pattern | Use |
|---------|-----|
| `ShellRoute` + `BlocProvider` | Shared BLoC for onboarding / assessment |
| `StatefulShellRoute.indexedStack` | Bottom nav tabs |
| `parentNavigatorKey: _rootNavigatorKey` | Full-screen overlays above tabs |
| Path params | `/workout/:sessionId`, `/milestone/:day` |

Tab shell (`MainShell`): Home, Progress, Sessions, Profile.

BLoCs created at route level — not in a global `MultiBlocProvider`.

---

## Design system

### Theme access

```dart
final c = context.appColors;   // AppColorTokens
final m = context.metrics;     // ScreenMetrics (responsive)
```

### Breakpoints (`ScreenMetrics`)

| Token | Threshold |
|-------|-----------|
| Compact height | `< 700` |
| Compact width | `< 360` |
| Tablet | `≥ 600` |
| Large | `≥ 900` |

### Layout primitives

| Widget | When to use |
|--------|-------------|
| `ResponsiveScrollBody(fillViewport: true)` | Onboarding / settings with Spacer |
| `OnboardingPage` | Standard onboarding wrapper |
| `ResponsivePadding` | Horizontal inset + max width |
| `PrimaryButton` | Primary / outlined CTAs |
| `SelectableChip` | Multi/single select options |
| `OnboardingStepIndicator` | Step N of onboarding |

### Branding

- Primary: `#E85D3B` (orange)
- Logo: `AppLogo` widget
- Icons: `assets/branding/app_icon.png`
- Typography: Poppins (`AppTypography`)

---

## Persistence (Drift)

### Schema files

```
lib/data/local/database/
├── tables.dart           # Table definitions
├── app_database.dart     # Drift DB + schemaVersion + migrations
├── app_database.g.dart   # Generated (build_runner)
├── state_persistence.dart # AppState ↔ SQLite
└── legacy_importer.dart  # SharedPreferences → SQLite one-time
```

### Key tables

| Table | Contents |
|-------|----------|
| `UserProfileRows` | name, goal, reminderMinutes, streak, premium |
| `UserPainAreaRows` | Selected pain areas |
| `UserBreakTimeRows` | Preferred break windows |
| `SessionLogRows` | Completed workouts |
| `JourneyMetaRows` | currentDay, check-in state |
| `AppSettingsRows` | theme, notificationsEnabled, premium |

### Adding a field

1. Add to domain model (`UserProfile` or `AppState`)
2. Add column in `tables.dart`
3. Update `state_persistence.dart` load/save
4. Increment `schemaVersion` + write `onUpgrade` migration
5. `dart run build_runner build`

---

## Services

| Service | Init | Trigger |
|---------|------|---------|
| `ReminderNotificationService` | `bootstrap.dart` | Profile save, notifications enable |
| `AiService` | on demand | Mock when `AiFeatures.llmEnabled == false` |

### Reminder schedule

- **Anchors:** daily at break times (9:00, 12:30, 15:00, 18:00)
- **Intervals:** every N minutes during active window (7 days ahead)
- **Streak:** daily 19:00 nudge
- OS delivers when app is killed (local scheduled notifications)

---

## Engagement loop

Driven by `AppCache` rules:

- **Journey:** 30-day plan, `currentDay` advances on completed days
- **Check-in:** shown day 2+ if not checked in today
- **Milestones:** streak screens at key days
- **Achievements:** unlocked on first session, streaks, week complete
- **Progress tab:** calculated from `SessionLog` via `WeeklyProgressCalculator`

---

## Testing

| File | Covers |
|------|--------|
| `test/state_persistence_test.dart` | Drift round-trip + legacy migration |
| `test/weekly_progress_calculator_test.dart` | Calculator logic |
| `test/widget_test.dart` | Splash → welcome |

Test setup essentials:

```dart
AppDatabase.enableTestMode();              // in-memory SQLite
ReminderNotificationService.schedulingEnabled = false;
await AppCache.resetForTesting();
BreatheAnimation.globallyEnabled = false;  // + other animations
```

---

## Clone to new product (quick reference)

### Minimum changes

1. **Identity** — app name, bundle ID, icon assets
2. **Brand** — `app_color_tokens.dart`, `app_logo.dart`
3. **Onboarding** — screens + `UserProfile` fields + routes
4. **Content** — `session_repository.dart` catalog
5. **Flags** — `ai_features.dart` for staged features

### Keep unchanged

- `AppCache` / `StatePersistence` pattern
- Router shell structure
- Core widget library
- Bootstrap init sequence
- Test harness (`enableTestMode`, animation disable)

### Future backend

Repositories are abstract contracts. Replace `CachedUserRepository` internals with API calls without changing BLoC/screen signatures. See `docs/backend-local-first-spec.md`.

---

## File naming cheat sheet

```
lib/presentation/screens/{feature}/{name}_screen.dart
lib/presentation/blocs/{feature}/{feature}_bloc.dart
lib/presentation/blocs/{feature}/{feature}_event.dart
lib/presentation/blocs/{feature}/{feature}_state.dart
lib/data/models/{name}.dart
lib/data/repositories/{name}_repository.dart
lib/core/widgets/{category}/{widget_name}.dart
```

Package imports: `package:calm_calibrate/...`

---

## Cursor skill

Agent skill for this pattern: `.cursor/skills/calm-calibrate-mvp/SKILL.md`

Invoke when scaffolding onboarding, routes, or cloning the MVP template.
