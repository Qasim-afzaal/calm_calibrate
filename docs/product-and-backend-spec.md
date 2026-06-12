# CalmCalibrate — Product, App Flow & Backend Specification

This document explains **how every feature works today** (Flutter prototype with local storage) and **what a production backend must provide** to replace mocks.

---

## 1. Architecture overview

### Current (prototype)

```
┌─────────────────────────────────────────────────────────┐
│  Flutter UI (screens + BLoCs/Cubits)                    │
└───────────────────────────┬─────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────┐
│  Repositories (User, Session, Engagement, Subscription) │
└───────────────────────────┬─────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────┐
│  AppCache → SharedPreferences (single JSON blob)        │
│  AiService → mock rules (+ optional OPENAI_API_KEY hook)│
└─────────────────────────────────────────────────────────┘
```

**No server, no auth, no real camera, no real payments.** All data lives on the device.

### Target (production)

```
┌──────────────┐     HTTPS/REST or GraphQL     ┌──────────────────────┐
│  Flutter app │ ◄────────────────────────────►│  API Gateway         │
└──────────────┘                               └──────────┬───────────┘
                                                            │
                    ┌───────────────────────────────────────┼────────────────────────┐
                    │                                       │                        │
            ┌───────▼───────┐  ┌──────────────┐  ┌─────────▼────────┐  ┌──────────▼──────────┐
            │ User & profile│  │ Sessions CMS │  │ AI / LLM service │  │ Subscriptions       │
            │ service       │  │ + exercise   │  │ (posture, plans) │  │ (RevenueCat/Stripe) │
            └───────────────┘  └──────────────┘  └──────────────────┘  └─────────────────────┘
                    │                                       │
            ┌───────▼───────┐                      ┌─────────▼────────┐
            │ PostgreSQL /  │                      │ Push notifications│
            │ Firebase      │                      │ (FCM / APNs)      │
            └───────────────┘                      └───────────────────┘
```

**On-device only (privacy):** camera frames for posture scan should be processed locally; only **scores + metadata** sync to backend.

---

## 2. Complete app flow

### 2.1 First launch — onboarding (Day 1)

| Step | Route | What happens | Data collected |
|------|-------|--------------|----------------|
| Splash | `/splash` | Loads `AppCache`, routes to welcome or home | — |
| Welcome | `/welcome` | Value prop | — |
| Pain areas | `/onboarding/pain` | Body map tap | `profile.painAreas` |
| Work pattern | `/onboarding/work-pattern` | Sitting hours | `profile.sittingHours` |
| Goals & reminders | `/onboarding/goals` | Goal + break interval | `profile.goal`, `profile.reminderMinutes` |
| Notifications | `/onboarding/notifications` | Permission prompt (UI only) | — |
| Mobility assessment | `/onboarding/assessment` | **Simulated scan** (see §3) | `mobilityScore` |
| Score result | `/onboarding/score` | Shows gauge + area scores | — |
| Personalized plan | `/onboarding/plan` | Summary → marks onboarding done | `profile.onboardingComplete = true` |
| Home | `/home` | Main dashboard | — |

### 2.2 Daily loop (Day 2+)

```
Home (/home)
  ├─ Journey card → /journey (30-day map)
  ├─ Check-in banner (if day ≥ 2 & not checked in) → /check-in
  ├─ Smart Break card → /smart-break [PRO gated]
  ├─ Today's sessions (free: 1/day; Pro: AI plan + all)
  │     └─ /pre-workout/:sessionId → /workout/:sessionId → /workout/:id/complete
  ├─ Pro feature grid [PRO only]
  └─ Upgrade banner [free only] → /premium

Bottom tabs: Home | Progress | Sessions | Profile
```

### 2.3 Engagement & retention

| Trigger | Route | Purpose |
|---------|-------|---------|
| Daily check-in | `/check-in` | Pain score + trouble areas; Pro gets AI posture section |
| Weekly recap | `/weekly-recap` | Week summary; Pro gets AI insight |
| Milestones | `/milestone/3`, `/7`, `/14`, `/30` | Streak celebrations |
| Re-engagement | `/re-engage` | Return after 2+ days inactive |
| Achievements | `/achievements` | Badges from journey + streaks |

### 2.4 Premium flow

| Action | Route / location | Result |
|--------|------------------|--------|
| Upgrade | `/premium` | Paywall, plan picker, 7-day trial |
| Cancel trial | Paywall or Profile → Pro subscription sheet | `isPremium = false` |
| Gates | Home sessions 2+, Smart Break, Sessions library premium programs, AI features, mood sounds | Upsell sheet → `/premium` |

---

## 3. Mobility assessment — how scoring works

### 3.1 What the UI shows vs reality

| UI copy | Prototype reality |
|---------|-------------------|
| "Use your camera" | **Placeholder icon** — no camera plugin |
| "On-device processing" | **Planned** — not implemented |
| "Analyzing posture…" | **Progress bar loop** (~2.4 seconds) |
| "Based on posture scan" | Score derived from **pain areas picked in onboarding** |

### 3.2 Current calculation (mock)

**File:** `lib/presentation/blocs/assessment/assessment_cubit.dart`

```
overall = clamp(72 - (painAreas.count × 4), 35, 85)

For each pain area (max 3):
  areaScore = clamp(overall - 8 + area.index × 2, 30, 80)
  potentialGain = clamp(100 - areaScore, 10, 40)
```

**Example:** Neck + Back + Hips → `72 - 12 = 60` overall.

**Storage:** `AppCache.saveMobilityScore()` → JSON in SharedPreferences.

### 3.3 Production — real posture scan

**Recommended pipeline (on-device):**

1. **Camera** — front/side profile capture (`camera` package).
2. **Pose detection** — Google ML Kit Pose Detection or MediaPipe (landmarks: nose, shoulders, hips, ears).
3. **Metrics computed locally:**

   | Metric | Measurement | Desk-worker signal |
   |--------|-------------|-------------------|
   | Forward head | Ear–shoulder–hip angle | Forward-head posture |
   | Shoulder roll | Shoulder line vs horizontal | Rounded shoulders |
   | Thoracic curve | Shoulder–hip alignment | Slouch |
   | Hip flexion | Seated hip angle | Tight hips |

4. **Score mapping** — weighted sum → 0–100 per area + overall.
5. **Sync to backend** — send `{ overall, areaScores[], capturedAt, deviceId }` only; **do not upload raw video** unless user opts in.

**Backend endpoints needed:**

```
POST /v1/assessments
  Body: { overall, areaScores[], source: "on_device_ml", appVersion }
  Response: { id, storedAt }

GET  /v1/assessments?userId=&limit=10
  Response: history for progress comparison (Day 10 retake)
```

---

## 4. Progress & weekly charts

### 4.1 Current (mock)

**File:** `lib/data/repositories/weekly_progress_calculator.dart`

- `beforeScore = currentScore - (sessionCount × 2)` (clamped)
- Each week on chart: `beforeScore + cumulativeSessions × 2`
- Area improvements: `sessionCountPerArea × 4` (max 28%)
- Average relief: mean of `(prePainScore - postPainScore)` from session logs

### 4.2 Production backend

```
GET /v1/progress/weekly?weeks=6
  Response: {
    weekLabels, mobilityScores[], beforeScore, afterScore,
    areaImprovements{}, totalSessions, totalMinutes, averageRelief
  }

POST /v1/sessions/{id}/complete
  Body: { prePainScore, postPainScore, durationMinutes, completedAt }
  Response: { mobilityPointsEarned, streakUpdated, newMobilityScore? }
```

Backend should **recompute** mobility trend from real assessment history + session adherence, not hard-coded `×2` rules.

---

## 5. Sessions & exercise library

### 5.1 Current content

| Tier | Programs | IDs |
|------|----------|-----|
| **Free (daily plan)** | 3 | `morning_reset`, `midday_break`, `evening_recovery` |
| **Pro library** | 5+ | `neck_relief`, `back_saver`, `hip_opener`, `eye_reset`, `shoulder_melt` |

Each program = `ExerciseSession` with steps (name, duration, instruction, pose enum, tip).

**Stored in code** — `CachedSessionRepository` static lists.

### 5.2 Workout flow

1. **Pre-workout** (`/pre-workout/:id`) — pain 1–5, mood sound picker [Pro]
2. **Active session** (`/workout/:id`) — timer per step, pose animation
3. **Complete** — stats, optional post-pain dialog, Pro upsell if free

**Session log fields:** `sessionId`, `completedAt`, `durationMinutes`, `prePainScore`, `postPainScore`, `mobilityPointsEarned`.

### 5.3 Production backend

```
GET  /v1/programs                    # List all; flag isPremium
GET  /v1/programs/{id}               # Full steps + media URLs
GET  /v1/users/me/today-plan         # Free: 1–3 sessions; Pro: AI plan
POST /v1/sessions/{id}/complete      # Log completion
```

**CMS requirement:** Admin tool to manage programs, steps, video/audio assets, focus areas.

**Media CDN:** Exercise videos, mood soundscape audio files (see §8).

---

## 6. AI features — how they work

All AI today runs in `lib/data/services/ai_service.dart`. With `OPENAI_API_KEY` set at build time, hooks exist but **still return mock data** until backend wiring is done.

### 6.1 AI Posture Analysis (Pro)

**Where:** Daily check-in (`/check-in`), Home posture chip  
**Flow:**

1. User selects issues from chips (Forward head, Rounded shoulders, etc.)
2. `AiPostureCubit.analyze()` calls `AiService.analyzePosture()`
3. Input: profile, mobility score, selected issues, recent session logs
4. Output: `PostureAnalysis` — score, summary, recommendations, desk tips
5. Saved to `AppCache.postureAnalyses[]`

**Mock scoring:**

```
postureScore = mobilityScore
  - 8 if "Forward head"
  - 6 if "Slouched lower back"
  - 5 if "Elevated shoulders"
  → clamp(28, 85)
```

**Production:**

```
POST /v1/ai/posture/analyze
  Body: {
    selectedIssues[], mobilityScore, painAreas[], sittingHours,
    recentSessionIds[], optional: photoBase64 (if camera scan)
  }
  Response: PostureAnalysis JSON

  Backend: LLM prompt with structured JSON output OR
           rule engine + optional vision model for photo
```

**Privacy:** Prefer **on-device pose metrics** sent as numbers, not photos.

---

### 6.2 AI Daily Plan (Pro)

**Where:** Home — "Today's AI Plan"  
**Flow:**

1. `AiPlanCubit` loads cached plan or generates new
2. `AiService.generateDailyPlan()` uses profile, mobility score, sessions, latest posture
3. Output: `AiDailyPlan` — morning / midday / evening text + coach note
4. Cached in `AppCache.aiDailyPlan`

**Production:**

```
POST /v1/ai/daily-plan
  Body: { userId, date, context: { mobilityScore, painAreas, posture, sessions[] } }
  Response: AiDailyPlan

GET  /v1/ai/daily-plan?date=2026-06-12
  Response: cached plan for the day (regenerate once per day max)
```

**LLM prompt should include:** pain areas, sitting hours, streak, last 7 sessions, latest posture issues, time of day.

---

### 6.3 Weekly AI Insight (Pro)

**Where:** Progress tab, Weekly recap  
**Flow:** `AiService.generateWeeklyInsight()` — template string from session count, minutes, avg relief, mobility score.

**Production:**

```
POST /v1/ai/weekly-insight
  Body: { weekStart, sessionCount, totalMinutes, avgRelief, mobilityScore, painAreas }
  Response: { insight: string, highlights: string[] }
```

---

### 6.4 Smart Break (Pro)

**Where:** Home card → `/smart-break`  
**Current:** Static message ("47 min sitting"); Pro adds posture-based copy if analysis exists.

**Production:**

```
GET /v1/smart-break/next
  Response: {
    minutesUntilBreak, suggestedSessionId, reason,
    optional: desktopCompanionSignal (future)
  }
```

Requires: **activity signals** — last session time, calendar integration, or desktop companion heartbeat.

---

### 6.5 AI architecture recommendation

| Component | Responsibility |
|-----------|----------------|
| **API gateway** | Auth, rate limits, Pro feature gates |
| **LLM service** | OpenAI / Anthropic / self-hosted; structured outputs |
| **Prompt store** | Versioned prompts per feature |
| **Context builder** | Aggregates user profile + last N sessions + posture |
| **Cache layer** | Redis — daily plan per user per day |
| **Job queue** | Weekly insight batch generation |

**Rate limits (suggested):** Free = 0 AI calls; Pro trial = 20/day; Pro paid = 100/day.

---

## 7. Premium & subscriptions

### 7.1 Pro features (paywall promises)

| Feature | Free | Pro | Location |
|---------|------|-----|----------|
| Daily sessions | 1 per day | All 3 + AI plan | Home |
| Program library | Locked programs | 50+ (expand CMS) | `/sessions` |
| AI posture | Teaser / lock | Full scan | `/check-in` |
| AI daily plan | Locked teaser | Generated plan | Home |
| Smart breaks | Locked | Timed prompts | `/smart-break` |
| Weekly AI report | Locked | Insight text | Progress, `/weekly-recap` |
| Mood soundscapes | Locked | Mood → audio | Pre-workout, active session |
| Desktop companion | — | Coming soon | Pro grid |

### 7.2 Current (mock)

- `SubscriptionRepository.startFreeTrial(plan)` → sets `isPremium: true`, `premiumSince`, `premiumPlan` in local cache
- `cancelPremium()` clears Pro flags
- **No App Store / Play Billing / RevenueCat**

### 7.3 Production backend

```
POST /v1/subscriptions/verify-receipt
  Body: { platform: "ios"|"android", receipt, productId }
  Response: { isPremium, plan, expiresAt, trialDaysLeft }

GET  /v1/subscriptions/status
  Response: { isPremium, plan, expiresAt, trialDaysLeft }

POST /v1/subscriptions/webhook  (RevenueCat / Stripe server-to-server)
```

**Recommended:** [RevenueCat](https://www.revenuecat.com/) — handles Apple/Google receipts; your API listens to webhooks and sets `user.isPremium`.

---

## 8. Mood soundscapes (Pro)

### 8.1 Current

- User picks mood: Stressed, Tired, Sore, Focused, Calm
- `MoodSoundService` maps mood → soundscape label (e.g. "Soft rain")
- **No audio playback** — UI shows "Playing: …" during workout
- Stored: `workoutMood`, `moodSoundEnabled` in AppCache

### 8.2 Production

```
GET /v1/audio/soundscapes?mood=stressed
  Response: { id, title, streamUrl, durationSeconds }

CDN: host MP3/AAC loops; client caches for offline Pro users
```

Optional: AI picks mood from pre-workout pain score server-side.

---

## 9. Engagement system (30-day journey)

### 9.1 Current (local)

**AppCache tracks:**

- `currentDay` (1–30)
- `completedJourneyDays`, `seenMilestones`
- `checkedInToday`, `completedSessionsToday`
- `streakDays`, `unlockedAchievements`
- Day advances when calendar day changes + previous day completed

### 9.2 Production

```
GET  /v1/engagement/state
POST /v1/engagement/check-in        { painScore, areas[] }
POST /v1/engagement/milestone-seen  { day }
GET  /v1/journey/plan               # 30-day content from CMS
```

Push notifications (FCM/APNs) for check-in, smart break, weekly recap — **requires device token registration:**

```
POST /v1/devices/register { fcmToken, platform, timezone }
```

---

## 10. User profile & auth

### 10.1 Profile fields (today)

| Field | Type | Source |
|-------|------|--------|
| name | string | Default "there" |
| painAreas | set | Onboarding |
| sittingHours | enum | Onboarding |
| preferredBreakTimes | set | Onboarding |
| goal | enum | Onboarding |
| reminderMinutes | int | Onboarding / settings |
| smartReminders | bool | Onboarding |
| streakDays | int | Computed on activity |
| mobilityPoints | int | Session completions |
| isPremium | bool | Subscription |

### 10.2 Production auth

```
POST /v1/auth/signup     { email, password } or OAuth (Apple/Google)
POST /v1/auth/login
POST /v1/auth/refresh
GET  /v1/users/me
PATCH /v1/users/me       { reminderMinutes, smartReminders, ... }
DELETE /v1/users/me      # GDPR
```

**Sync strategy:** App reads local cache first (offline); background sync pushes/pulls diff on connectivity.

---

## 11. Data model summary (backend DB)

### Core tables

| Table | Key fields |
|-------|------------|
| `users` | id, email, created_at, timezone |
| `profiles` | user_id, pain_areas[], sitting_hours, goal, reminder_minutes |
| `mobility_assessments` | user_id, overall, area_scores JSON, captured_at |
| `programs` | id, title, duration, is_premium, focus_areas[] |
| `program_steps` | program_id, order, name, duration_sec, instruction, pose_key |
| `session_logs` | user_id, program_id, pre_pain, post_pain, duration, completed_at |
| `posture_analyses` | user_id, issues[], score, summary, recommendations JSON |
| `ai_daily_plans` | user_id, date, morning, midday, evening, coach_note |
| `subscriptions` | user_id, plan, status, expires_at, platform_receipt |
| `engagement_state` | user_id, current_day, streak, achievements[] |
| `device_tokens` | user_id, fcm_token, platform |

---

## 12. Feature → backend requirement matrix

| Feature | Works offline today? | Backend required for v1? | Priority |
|---------|---------------------|---------------------------|----------|
| Onboarding + pain map | Yes | User sync | P0 |
| Mobility assessment | Mock only | Optional (store scores) | P0 |
| Real camera scan | No | On-device ML only | P1 |
| Session playback | Yes (bundled) | CMS for content updates | P0 |
| Session logging | Yes | Sync logs | P0 |
| Streaks & journey | Yes | Sync + push | P1 |
| Push reminders | UI only | FCM + scheduler | P1 |
| AI posture | Mock | LLM API + gateway | P1 |
| AI daily plan | Mock | LLM API + cache | P1 |
| Weekly AI insight | Mock | LLM API | P2 |
| Smart break timing | Static | Activity API / desktop agent | P2 |
| Subscriptions | Local flag | RevenueCat + webhook | P0 |
| Mood audio | Labels only | CDN audio files | P2 |
| Weekly progress chart | Estimated | Analytics from real data | P1 |
| Achievements | Local | Sync badges | P2 |
| Desktop companion | Placeholder | WebSocket / menubar app | P3 |

---

## 13. Suggested API surface (REST)

Base URL: `https://api.calmcalibrate.com/v1`  
Auth: `Authorization: Bearer <JWT>`

```
# Auth & user
POST   /auth/login
POST   /auth/register
GET    /users/me
PATCH  /users/me

# Assessment
POST   /assessments
GET    /assessments

# Programs & workouts
GET    /programs
GET    /programs/{id}
POST   /sessions/{programId}/complete
GET    /users/me/today-plan

# Engagement
GET    /engagement/state
POST   /engagement/check-in
GET    /progress/weekly

# AI (Pro — middleware checks subscription)
POST   /ai/posture/analyze
GET    /ai/daily-plan
POST   /ai/daily-plan/regenerate
POST   /ai/weekly-insight

# Smart break (Pro)
GET    /smart-break/next

# Subscriptions
GET    /subscriptions/status
POST   /subscriptions/verify-receipt

# Media
GET    /audio/soundscapes

# Devices
POST   /devices/register
```

---

## 14. Environment & secrets

| Secret | Used by | Notes |
|--------|---------|-------|
| `OPENAI_API_KEY` | AI service (future) | **Never in client** — backend only |
| Apple shared secret | Subscriptions | Server-side |
| Google Play service account | Subscriptions | Server-side |
| RevenueCat API key | Subscription sync | Server-side |
| FCM server key | Push | Server-side |

Flutter app should only hold: API base URL, RevenueCat **public** SDK key, feature flags.

---

## 15. Migration path (prototype → production)

1. **Phase 1 — Auth + sync**  
   Replace `AppCache` writes with repository that POSTs to API; keep local cache as offline fallback.

2. **Phase 2 — Subscriptions**  
   Integrate RevenueCat in Flutter; backend webhook sets `isPremium`.

3. **Phase 3 — Content CMS**  
   Move programs from Dart constants to API; app caches on launch.

4. **Phase 4 — AI backend**  
   Move `AiService` calls to API; LLM runs server-side with user context.

5. **Phase 5 — Real assessment**  
   ML Kit on device; upload scores only.

6. **Phase 6 — Push + smart break**  
   FCM reminders; optional desktop companion.

---

## 16. Related docs

| Document | Contents |
|----------|----------|
| [user-journey-day1-30.md](./user-journey-day1-30.md) | Day-by-day engagement plan |
| [frontend-structure.md](./frontend-structure.md) | Widgets, animations, folder layout |
| [market-research.md](./market-research.md) | Desk-worker market context |

---

## 17. Key source files (reference)

| Area | Path |
|------|------|
| Mobility score mock | `lib/presentation/blocs/assessment/assessment_cubit.dart` |
| AI mock | `lib/data/services/ai_service.dart` |
| Local state | `lib/data/local/app_cache.dart`, `app_state.dart` |
| Subscriptions | `lib/data/repositories/subscription_repository.dart` |
| Weekly progress | `lib/data/repositories/weekly_progress_calculator.dart` |
| Programs | `lib/data/repositories/session_repository.dart` |
| Routes | `lib/app/router.dart` |

---

*Last updated: June 2026 — matches CalmCalibrate Flutter prototype v1.0.0*
