# CalmCalibrate — Frontend Structure

Easy-to-navigate Flutter UI with reusable widgets and calm desk-recovery animations.

---

## Folder structure

```
lib/
├── app/                    # App entry, router
├── core/
│   ├── animations/         # Reusable motion (breathe, fade, pulse…)
│   ├── constants/          # Spacing, durations, radius
│   ├── theme/              # Colors, ThemeData
│   └── widgets/            # Reusable UI components
│       ├── buttons/
│       ├── cards/
│       ├── feedback/
│       ├── illustrations/
│       ├── layout/
│       └── widgets.dart    # ← import everything from here
├── data/                   # Models + repositories (mock for now)
└── presentation/
    ├── blocs/              # BLoC = ViewModel layer
    └── screens/            # Views only — use core/widgets
```

---

## Import pattern

```dart
import 'package:calm_calibrate/core/widgets/widgets.dart';
```

Gives you: `AppButton`, `SessionCard`, `PainScalePicker`, `FadeSlideIn`, etc.

---

## Reusable widgets

| Widget | Use for |
|--------|---------|
| `AppButton` | All CTAs (filled / outlined / navy) |
| `AppCard` | Any bordered container with optional tap |
| `SessionCard` | Session rows on Home + Sessions |
| `SmartBreakCard` | Navy break reminder on Home |
| `JourneyDayCard` | Day X goal on Home |
| `CheckInBanner` | Daily pain check-in prompt |
| `StreakBadge` | Fire streak counter |
| `StatCard` | Minutes / points / streak stats |
| `PainScalePicker` | 1–5 pain scale (check-in, workout) |
| `SectionHeader` | "Today's Sessions" style headers |
| `OnboardingPage` | Standard onboarding layout + step bar |
| `DeskHeroIllustration` | Welcome hero art |
| `BodyPainMap` | Pain area selector |
| `ScoreGauge` | Mobility score ring |

---

## Animations (desk recovery niche)

Calm, breathing-paced — not gym-aggressive.

| Animation | Feel | Used on |
|-----------|------|---------|
| `BreatheAnimation` | Slow inhale/exhale scale | Splash logo, workout icon, check-in heart |
| `FloatAnimation` | Gentle vertical float | Welcome desk hero |
| `FadeSlideIn` | Soft entrance | All screen content |
| `StaggeredColumn` | Sequential reveals | Home cards, onboarding |
| `ScaleTap` | Tactile press feedback | Buttons, cards |
| `PulseRing` | Active break urgency | Workout timer |
| `CelebrationPop` | Bouncy win moment | Session complete, milestones, streak |
| `AppPageTransitions` | Slide-up page change | Router (optional) |

Timings live in `core/constants/app_durations.dart`.

---

## Screen rules

1. **Screens** = layout + wiring only. No duplicate card/button code.
2. **BLoCs** = state + actions. No UI widgets inside blocs.
3. **Repositories** = data. Swap mock → API later without touching UI.
4. New screen? Check `core/widgets/` first before building custom UI.

---

## Adding a new screen

1. Create `lib/presentation/screens/{area}/{name}_screen.dart`
2. Use `OnboardingPage` or `FadeSlideIn` + shared cards
3. Add route in `lib/app/router.dart`
4. Add to `ScreenCatalogScreen` for preview
