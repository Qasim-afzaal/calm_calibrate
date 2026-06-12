# CalmCalibrate — How the code works

This guide explains the app in plain terms: where data lives, how screens get updated, and how **BLoC (Event → State → Bloc)** fits in.

> **Full map:** For routes, every screen, widget layers, BLoC tables, and end-to-end flows, see **[codebase-guide.md](./codebase-guide.md)**.

---

## Big picture (4 layers)

```
┌─────────────────────────────────────────────────────────────┐
│  UI — Screens & widgets (Flutter)                           │
│  Sends Events · reads State via BlocBuilder                 │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│  BLoC — presentation/blocs/*                                │
│  Business logic for one screen/feature                      │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│  Repositories — data/repositories/*                         │
│  Clean API: profile, sessions, premium…                     │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│  AppCache + AppState — data/local/*                         │
│  All data in memory + saved to SharedPreferences            │
└─────────────────────────────────────────────────────────────┘
```

**Rule of thumb:** UI never talks to `SharedPreferences` directly. It sends **events** to a **Bloc**, which uses **repositories**, which read/write **AppCache**.

---

## BLoC vs Cubit (what we use now)

| | **Cubit** (old) | **BLoC** (now) |
|---|---|---|
| UI says | `bloc.load()` — call a method | `bloc.add(HomeLoadRequested())` — dispatch an **event** |
| Logic lives in | methods on the cubit | `on<Event>` handlers on the bloc |
| Good for | tiny widgets | clearer history, easier to test & read |

**Cubit is just BLoC without events.** Same `State`, same `BlocBuilder` — we only changed *how the UI triggers actions*.

---

## BLoC pattern — walkthrough with AI Daily Plan

Files live in `lib/presentation/blocs/ai_plan/`:

### 1. Event — “what happened?”

```dart
// ai_plan_event.dart
sealed class AiPlanEvent { ... }

final class AiPlanStarted extends AiPlanEvent { ... }
final class AiPlanGenerateRequested extends AiPlanEvent { ... }
```

The UI (or the bloc itself) **adds** events. Each event is one user intent or lifecycle step.

### 2. State — “what should the UI show?”

```dart
// ai_plan_state.dart
class AiPlanState {
  final AiPlanStatus status;  // idle | generating | done | error
  final AiDailyPlan? plan;
}
```

**Immutable snapshot.** When state changes, `BlocBuilder` rebuilds.

### 3. Bloc — “what do we do when an event arrives?”

```dart
// ai_plan_bloc.dart
class AiPlanBloc extends Bloc<AiPlanEvent, AiPlanState> {
  AiPlanBloc() : super(const AiPlanState()) {
    on<AiPlanStarted>(_onStarted);
    on<AiPlanGenerateRequested>(_onGenerateRequested);
  }
}
```

Handlers call repositories / services, then `emit(newState)`.

### 4. UI wiring

```dart
BlocProvider(
  create: (_) => AiPlanBloc()
    ..add(AiPlanStarted(autoGenerate: true)),
  child: ...,
)

BlocBuilder<AiPlanBloc, AiPlanState>(
  builder: (context, state) {
    if (state.plan == null) {
      return AppButton(
        onPressed: () => context.read<AiPlanBloc>()
            .add(const AiPlanGenerateRequested()),
      );
    }
    return PlanView(plan: state.plan!);
  },
)
```

**Flow:**

```
User taps "Generate"
    → add(AiPlanGenerateRequested)
    → Bloc sets status = generating
    → AiService.generateDailyPlan(...)
    → AppCache.saveAiDailyPlan(plan)
    → emit(status: done, plan: plan)
    → BlocBuilder rebuilds with plan
```

---

## All blocs in this app

| Feature | Folder | Main events |
|---------|--------|-------------|
| AI daily plan | `blocs/ai_plan/` | `AiPlanStarted`, `AiPlanGenerateRequested` |
| AI posture | `blocs/ai_posture/` | `AiPostureStarted`, `AiPostureIssueToggled`, `AiPostureAnalyzeRequested` |
| Home | `blocs/home/` | `HomeLoadRequested`, `HomeRefreshRequested` |
| Progress | `blocs/progress/` | `ProgressLoadRequested` |
| Workout | `blocs/workout/` | `WorkoutSessionLoadRequested`, `WorkoutPaused`, … |
| Onboarding | `blocs/onboarding/` | `OnboardingPainAreaToggled`, `OnboardingGoalSet`, … |
| Assessment | `blocs/assessment/` | `AssessmentScanStarted`, `AssessmentResetRequested` |

Each feature has **three files**: `*_event.dart`, `*_state.dart`, `*_bloc.dart`.

Blocs are created in `lib/app/router.dart` via `BlocProvider`.

---

## AppState — the data model

**File:** `lib/data/local/app_state.dart`

`AppState` is a **plain Dart class** holding everything we persist: profile, scores, sessions, journey day, premium, AI plans, theme mode, etc.

It has `toJson()` / `fromJson()` so we save one JSON blob to disk.

**Think of AppState as the in-memory database row for the whole app.**

---

## AppCache — reads/writes AppState + notifies UI

**File:** `lib/data/local/app_cache.dart`

```dart
class AppCache extends ChangeNotifier {
  static final instance = AppCache._();
  late AppState _state;

  Future<void> persist() async {
    await LocalStorage.instance.setJson(...);
    notifyListeners();
  }
}
```

### What is `ChangeNotifier`?

1. Widget uses `ListenableBuilder(listenable: AppCache.instance, ...)`
2. When cache calls `notifyListeners()`, the builder runs again
3. Widget reads fresh data from cache or repositories

**Used for app-wide settings** (theme, premium, profile) — not for screen-specific loading (that’s BLoC).

---

## Repositories

**Files:** `lib/data/repositories/*`

Blocs call repositories; repositories call `AppCache`. Later you can swap cache for a real API without changing blocs.

---

## When to use BLoC vs ListenableBuilder?

| Use **BLoC** | Use **ListenableBuilder + AppCache** |
|--------------|--------------------------------------|
| Loading / error / multi-step UI on one screen | Theme, premium badge, cached profile |
| User actions (workout, onboarding form) | Many widgets need same global data |

---

## File map (start here)

| Topic | File |
|-------|------|
| App startup | `lib/main.dart`, `lib/app/bootstrap.dart` |
| Routes + blocs | `lib/app/router.dart` |
| Best BLoC example | `lib/presentation/blocs/ai_plan/` |
| AI plan UI | `lib/core/widgets/premium/ai_daily_plan_section.dart` |
| Saved data shape | `lib/data/local/app_state.dart` |
| Save/load | `lib/data/local/app_cache.dart` |

---

## Glossary

| Term | Meaning |
|------|---------|
| **Event** | Message to the bloc (“user tapped generate”) |
| **State** | Data the UI renders right now |
| **Bloc** | Receives events, updates state |
| **emit** | Push a new state to listeners |
| **AppState** | All persisted app data |
| **AppCache** | Singleton owner of AppState + disk save |
| **ChangeNotifier** | `notifyListeners()` → rebuild listeners |
| **Repository** | Abstraction over cache/API |
