# CalmCalibrate — User Journey (Day 1 → Day 30)

How we engage, retain, and convert desk workers over 30 days.

---

## Engagement pillars

| Pillar | How |
|--------|-----|
| **Personalize** | Pain map + work pattern + mobility score → custom plan |
| **Habit** | Streaks, reminders, smart breaks |
| **Proof** | Pre/post pain check-in, mobility score, weekly recap |
| **Celebrate** | Milestones Day 3, 7, 14, 30 + achievements |
| **Recover** | Re-engagement screen if inactive 2+ days |

---

## Full screen map (all UI ready)

### Onboarding (Day 1)
| Screen | Route |
|--------|-------|
| Splash | `/splash` |
| Welcome | `/welcome` |
| Pain selector | `/onboarding/pain` |
| Work pattern | `/onboarding/work-pattern` |
| Goals & reminders | `/onboarding/goals` |
| Notifications permission | `/onboarding/notifications` |
| Mobility assessment | `/onboarding/assessment` |
| Mobility score result | `/onboarding/score` |
| Personalized plan | `/onboarding/plan` |

### Core app
| Screen | Route |
|--------|-------|
| Home dashboard | `/home` |
| Daily check-in | `/check-in` |
| Pre-workout check-in | `/pre-workout/:sessionId` |
| Active session | `/workout/:sessionId` |
| Session complete | `/workout/:sessionId/complete` |
| Smart break prompt | `/smart-break` |
| Sessions library | `/sessions` |
| Progress / weekly chart | `/progress` |
| Weekly recap | `/weekly-recap` |
| 30-day journey map | `/journey` |
| Achievements | `/achievements` |
| Reminders settings | `/settings/reminders` |
| Profile | `/profile` |
| Premium paywall | `/premium` |

### Retention
| Screen | Route |
|--------|-------|
| Streak milestone | `/milestone/3`, `/milestone/7`, `/milestone/14`, `/milestone/30` |
| Re-engagement (churn) | `/re-engage` |

### Dev preview
| Screen | Route |
|--------|-------|
| All screens catalog | `/dev/screens` |

**Preview every screen:** Profile → **All Screens (Preview)**

---

## Day-by-day engagement plan

### Week 1 — Habit formation

| Day | Goal | Screen / action | Push notification |
|-----|------|-----------------|-------------------|
| **1** | Complete onboarding + 1 session | Onboarding → Morning Reset | "Your desk plan is ready" |
| **2** | Daily check-in + 1 session | `/check-in` → Midday Break | "How's your neck today?" |
| **3** | 3-day streak | `/milestone/3` | "Don't break your streak!" |
| **4** | Smart break at 3pm | `/smart-break` | "3pm slump? Move 90 sec" |
| **5** | Try new program | `/sessions` → Neck Relief | — |
| **6** | Tune reminders | `/settings/reminders` | — |
| **7** | Week 1 recap | `/weekly-recap` | "Your Week 1 report is ready" |

### Week 2 — Deepen

| Day | Goal | Action |
|-----|------|--------|
| **8** | Evening recovery session | Evening Deep Recovery |
| **9** | 2 sessions | Morning + Midday |
| **10** | Retake assessment | `/onboarding/assessment` — compare score |
| **11–13** | Maintain streak | Daily sessions |
| **14** | 2-week milestone | `/milestone/14` |

### Week 3 — Identity

| Day | Goal | Action |
|-----|------|--------|
| **15** | Review journey map | `/journey` — halfway point |
| **16–20** | Pain-area focus rotation | Neck → Back → Hips programs |
| **21** | Week 3 recap | `/weekly-recap` |

### Week 4 — Convert

| Day | Goal | Action |
|-----|------|--------|
| **22–29** | Full program adherence | All 3 daily sessions when possible |
| **30** | Graduate + premium trial | `/milestone/30` → `/premium` |

---

## User flow diagram

```
Day 1
  Splash → Welcome → Pain → Work → Goals → Notifications
    → Assessment → Score → Plan → Home
         ↓
  Pre-workout check-in → Active session → Complete → Streak + points

Day 2+
  Home → [Check-in banner?] → Pre-workout → Session → Complete
       → Smart break prompt (3pm)
       → Progress tab (weekly chart)

Day 3, 7, 14, 30
  Milestone celebration screen

Missed 2+ days
  Re-engagement screen → Quick comeback session

Week 7, 21
  Weekly recap → Advance to next week
```

---

## Retention mechanics (built in app)

1. **Streak badge** on home
2. **Day X journey card** — today's goal
3. **Check-in banner** — appears until daily check-in done
4. **Smart break card** — tap to open break prompt
5. **Pre/post pain scores** — session complete + check-in
6. **Mobility points** — gamification per session
7. **Achievements** — unlock at Day 1, 3, 7, 14, 30
8. **Weekly recap** — visual proof of improvement
9. **Journey map** — 30-day progress timeline
10. **Premium** — Day 30 conversion hook

---

## How to test the full flow

```bash
flutter run
```

1. Complete onboarding (Day 1 flow)
2. On **Profile** → tap **All Screens (Preview)**
3. Use **Simulate journey day** chips (Day 1, 3, 7, 14, 30)
4. Tap any screen to preview

---

*Backend phase: wire push notifications, persist day count, real camera assessment.*
