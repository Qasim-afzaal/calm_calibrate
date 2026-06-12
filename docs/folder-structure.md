# Folder structure

> See also: **[codebase-guide.md](./codebase-guide.md)** — full routes, BLoCs, and data flows.

How this project is organized and where new code should go.

## Target layout

```
lib/
├── main.dart                 # Entry → bootstrap → runApp
├── app/                      # App shell (router, theme wiring, bootstrap)
├── core/                     # Shared, feature-agnostic building blocks
│   ├── animations/
│   ├── constants/
│   ├── theme/
│   └── widgets/              # Design system ONLY (no blocs, no routes)
│       ├── buttons/
│       ├── cards/
│       ├── feedback/
│       ├── layout/
│       └── widgets.dart      # Barrel: core widgets + animations
├── data/                     # Models, persistence, repositories, services
│   ├── calculators/          # Pure logic (weekly progress, scoring helpers)
│   ├── local/                # AppState, AppCache, SharedPreferences
│   ├── models/
│   ├── repositories/         # Data access contracts + cache implementations
│   └── services/             # AI, mood sound, external APIs
└── presentation/             # UI + state management
    ├── blocs/                # Event / State / Bloc per feature
    │   └── <feature>/
    │       ├── *_event.dart
    │       ├── *_state.dart
    │       └── *_bloc.dart
    ├── screens/              # Full-page routes, one folder per flow
    └── widgets/              # Feature-aware composed widgets
        ├── feature_widgets.dart   # Barrel for premium / pro UI
        └── premium/
```

## Rules

| Layer | May import | Must NOT import |
|-------|------------|-----------------|
| `core/widgets` | `core/*`, Flutter | `presentation/blocs`, `go_router`, repositories |
| `presentation/widgets` | `core`, `data`, `presentation/blocs` | — |
| `presentation/screens` | `core`, `data`, `presentation/*` | — |
| `presentation/blocs` | `data` (repos/services) | `presentation/screens`, Flutter widgets (except flutter_bloc) |
| `data` | `data` only | `presentation`, `core/widgets` |

## Two widget barrels

```dart
// Design system — buttons, cards, layout, animations
import 'package:calm_calibrate/core/widgets/widgets.dart';

// Pro / premium sections that use blocs & routes
import 'package:calm_calibrate/presentation/widgets/feature_widgets.dart';
```

## BLoC folder convention

Each feature gets **three files**:

```
presentation/blocs/home/
  home_event.dart   # User intents (HomeLoadRequested)
  home_state.dart   # UI snapshot (HomeState)
  home_bloc.dart    # on<Event> handlers
```

## Data flow

```
Screen → bloc.add(Event) → Bloc → Repository → AppCache → disk
Screen ← BlocBuilder ← State
Profile/theme ← ListenableBuilder ← AppCache.notifyListeners()
```

## Where to put new code

| You are adding… | Put it in… |
|-----------------|------------|
| Reusable button/card with no business logic | `core/widgets/` |
| Paywall section, AI widget with bloc | `presentation/widgets/` |
| New screen | `presentation/screens/<feature>/` |
| Screen logic | `presentation/blocs/<feature>/` |
| Persisted field | `AppState` + `AppCache` method |
| Read/write API | `data/repositories/` |
| Pure calculation | `data/calculators/` |

## Recent cleanups

- **Premium widgets** moved from `core/widgets/premium/` → `presentation/widgets/premium/`
- **`weekly_progress_calculator`** moved to `data/calculators/`
- **`JourneyDayCard`** decoupled — takes `day`, `title`, `action` props (no repository inside)
- **`SessionCard`** reused in sessions library (removed duplicate `_SessionCard`)
- **Premium programs** single source in `SessionRepository.getPremiumPrograms()`
