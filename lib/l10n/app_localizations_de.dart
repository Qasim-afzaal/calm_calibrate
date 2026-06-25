// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'CalmCalibrate';

  @override
  String get navHome => 'Heim';

  @override
  String get navProgress => 'Fortschritt';

  @override
  String get navSessions => 'Sitzungen';

  @override
  String get navProfile => 'Profil';

  @override
  String get continueButton => 'Weitermachen';

  @override
  String get getStarted => 'Legen Sie los';

  @override
  String get back => 'Zurück';

  @override
  String get done => 'Erledigt';

  @override
  String get skip => 'Überspringen';

  @override
  String get close => 'Schließen';

  @override
  String get save => 'Speichern';

  @override
  String get cancel => 'Stornieren';

  @override
  String get welcomeTitle => 'Bewegen Sie sich besser\nbei der Arbeit';

  @override
  String get welcomeSubtitle =>
      'Lindern Sie Verspannungen, korrigieren Sie die Körperhaltung und fühlen Sie sich voller Energie mit 90-Sekunden-Pausen am Schreibtisch, die speziell für Sie gemacht sind.';

  @override
  String get painSelectorTitle => 'Wo tut Sitzen weh?';

  @override
  String get goalsRemindersTitle => 'Ziele und Erinnerungen';

  @override
  String get goalsRemindersSubtitle =>
      'Wir werden Sie zum richtigen Zeitpunkt anstupsen, niemals während Besprechungen.';

  @override
  String get yourGoals => 'Ihre Ziele';

  @override
  String get reminderFrequency => 'Erinnerungshäufigkeit';

  @override
  String reminderMinutesLabel(int minutes) {
    return '$minutes min';
  }

  @override
  String get smartReminders => 'Intelligente Erinnerungen';

  @override
  String get smartRemindersHint =>
      'Überspringen Sie Anstupser, wenn Sie sich in einer Besprechung oder einem Anruf befinden.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get appearance => 'Aussehen';

  @override
  String get appearanceHint =>
      'Wählen Sie, wie CalmCalibrate auf diesem Gerät aussehen soll.';

  @override
  String get language => 'Sprache';

  @override
  String get languageHint => 'App-Anzeigesprache';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeSystem => 'System';

  @override
  String get reminders => 'Erinnerungen';

  @override
  String remindersEveryMinutes(int minutes) {
    return 'Alle $minutes Min';
  }

  @override
  String get journeyTitle => '30-tägige Reise';

  @override
  String get journeySubtitle => 'Sehen Sie sich Ihr vollständiges Programm an';

  @override
  String get achievements => 'Erfolge';

  @override
  String get achievementsSubtitle => 'Abzeichen und Meilensteine';

  @override
  String get retakeAssessment => 'Wiederholungsbewertung';

  @override
  String get retakeAssessmentSubtitle =>
      'Aktualisieren Sie Ihren Mobilitätswert';

  @override
  String get proSubscription => 'Pro-Abonnement';

  @override
  String get upgradeToPro => 'Upgrade auf Pro';

  @override
  String get proBenefitsSubtitle =>
      'KI-Pläne, Haltungsscan und vollständige Bibliothek';

  @override
  String trialDaysLeft(int count) {
    return 'Es verbleiben noch $count Testtage';
  }

  @override
  String get viewProBenefits => 'Sehen Sie sich die Pro-Vorteile an';

  @override
  String get cancelFreeTrial => 'Kostenlose Testversion kündigen';

  @override
  String get returnToFreePlan => 'Zurück zum kostenlosen Plan';

  @override
  String get painNeck => 'Nacken';

  @override
  String get painShoulders => 'Schultern';

  @override
  String get painUpperBack => 'Oberer Rücken';

  @override
  String get painLowerBack => 'Unterer Rücken';

  @override
  String get painHips => 'Hüften';

  @override
  String get breakMorning => 'Morgen';

  @override
  String get breakLunch => 'Mittagessen';

  @override
  String get breakAfternoon => 'Nachmittag';

  @override
  String get breakEvening => 'Abend';

  @override
  String get goalReduceNeckPain => 'Reduzieren Sie Nackenschmerzen';

  @override
  String get goalFixPosture => 'Haltung korrigieren';

  @override
  String get goalMoreEnergy => 'Mehr Energie';

  @override
  String get goalPreventInjury => 'Verletzungen vorbeugen';

  @override
  String get sittingFourToSix => '4 bis 6 Std';

  @override
  String get sittingSixToEight => '6 bis 8 Std';

  @override
  String get sittingEightPlus => '8+ Std';

  @override
  String get hours => 'Std.';

  @override
  String get localeEnglish => 'Englisch';

  @override
  String get localeUrdu => 'Urdu';

  @override
  String get localeHindi => 'Hindi';

  @override
  String get localeBengali => 'Bengali';

  @override
  String get localeSpanish => 'Spanisch';

  @override
  String get localeFrench => 'Französisch';

  @override
  String get localeArabic => 'Arabisch';

  @override
  String get localePortuguese => 'Portugiesisch';

  @override
  String get localeGerman => 'Deutsch';

  @override
  String get greetingMorning => 'Guten Morgen';

  @override
  String get greetingAfternoon => 'Guten Tag';

  @override
  String get greetingEvening => 'Guten Abend';

  @override
  String get proBadge => 'PRO';

  @override
  String get aiBadge => 'KI';

  @override
  String postureScoreLabel(int score) {
    return 'Haltung $score/100';
  }

  @override
  String trialDaysShort(int days) {
    return '$days d Versuch';
  }

  @override
  String get journeyDefaultGoal => 'Bleiben Sie konsequent';

  @override
  String get journeyDefaultAction =>
      'Machen Sie noch heute eine Schreibtischpause';

  @override
  String aiPickedForIssue(String issue) {
    return 'KI für Ihr $issue ausgewählt';
  }

  @override
  String get proLockSmartBreakFeature => 'Smart Break-Erinnerungen';

  @override
  String get proLockSmartBreakBenefit =>
      'Machen Sie mal Pausen von Ihrer Haltung und Ihrem Sitzmuster. Die KI wählt den richtigen 90-Sekunden-Reset aus, wenn Sie ihn brauchen.';

  @override
  String get yourProFeatures => 'Ihre Pro-Funktionen';

  @override
  String get proLockExtraSessionsFeature => 'Zusätzliche tägliche Sitzungen';

  @override
  String get proLockExtraSessionsBenefit =>
      'Der kostenlose Plan beinhaltet 1 Sitzung pro Tag. Pro schaltet Ihren vollständigen KI-Plan frei: Morgen-, Mittags- und Abendpausen.';

  @override
  String get todaysAiPlan => 'Der heutige KI-Plan';

  @override
  String get todaysSessions => 'Die heutigen Sitzungen';

  @override
  String get browseProgramsTitle => 'Durchsuchen Sie über 50 Programme';

  @override
  String get browseProgramsSubtitle =>
      'Nacken, Rücken, Hüften und mehr. Alles freigeschaltet';

  @override
  String get unlockProTitle => 'Schalte Pro frei';

  @override
  String get unlockProSubtitle =>
      'KI-Haltung · Stimmungsgeräusche · 50+ Programme';

  @override
  String get checkInBannerTitle => 'Täglicher Check-in';

  @override
  String get checkInBannerSubtitle => 'Wie geht es deinem Körper heute?';

  @override
  String get smartBreakTitle => 'Intelligente Pause';

  @override
  String smartBreakNextIn(int minutes) {
    return 'Nächste Pause in ~$minutes Min';
  }

  @override
  String get smartBreakPremiumHint =>
      'Abhängig von Ihrer Körperhaltung und Ihrem Sitzmuster';

  @override
  String get smartBreakFreeHint => 'Basierend auf Ihrem Sitzmuster';

  @override
  String get journeyCardTodaysGoal => 'Das heutige Ziel';

  @override
  String get journeyCardDayLabel => 'TAG';

  @override
  String journeyCardStreak(int days) {
    return '$days Tagessträhne';
  }

  @override
  String streakBadgeFull(int days) {
    return '$days Tagessträhne';
  }

  @override
  String get noProgressDataYet => 'Noch keine Fortschrittsdaten';

  @override
  String get weeklyProgressTitle => 'Wöchentlicher Fortschritt';

  @override
  String get weeklyProgressEmptyHint =>
      'Schließen Sie Ihre erste Sitzung ab, um mit dem Tracking zu beginnen.';

  @override
  String weeklyProgressSummary(int sessions, int minutes) {
    return '$sessions Sitzungen · $minutes Minuten insgesamt';
  }

  @override
  String weeklyProgressAvgRelief(int relief) {
    return 'durchschnittliche Erleichterung +$relief';
  }

  @override
  String get beforeLabel => 'Vor';

  @override
  String get nowLabel => 'Jetzt';

  @override
  String get areaImprovementsTitle => 'Gebietsverbesserungen';

  @override
  String improvementPercent(int percent) {
    return '+$percent%';
  }

  @override
  String get sessionsTitle => 'Sitzungen';

  @override
  String get sessionsSubtitlePro =>
      'Pro-Bibliothek freigeschaltet · Programme nach Bereich';

  @override
  String get sessionsSubtitleFree =>
      'Programme nach Schmerzbereich an Ihrem Schreibtisch';

  @override
  String get filterAll => 'Alle';

  @override
  String get todaysPlan => 'Der heutige Plan';

  @override
  String get allPrograms => 'Alle Programme';

  @override
  String playingSoundscape(String label) {
    return 'Spielt: $label';
  }

  @override
  String stepProgress(int current, int total) {
    return 'Schritt $current von $total';
  }

  @override
  String get previous => 'Vorherige';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Wieder aufnehmen';

  @override
  String get next => 'Nächste';

  @override
  String get defaultStretchTip =>
      'Tipp: Atmen Sie beim Dehnen aus. Erzwinge niemals Schmerzen.';

  @override
  String get niceWork => 'Gute Arbeit!';

  @override
  String get sessionCompleteMessage =>
      'Ihr Körper dankt es Ihnen. Machen Sie morgen weiter so.';

  @override
  String get statMinutes => 'Minuten';

  @override
  String get statMobilityPts => 'Mobilitätspunkte';

  @override
  String get statStreak => 'Strähne';

  @override
  String statStreakValue(int days) {
    return '${days}d';
  }

  @override
  String get upsellMoodSoundsTitle =>
      'Schalten Sie Stimmungsgeräusche und KI-Pläne frei';

  @override
  String get upsellMoodSoundsSubtitle =>
      'Pro passt die Umgebungsgeräusche an Ihre Gefühle an und erstellt Ihren vollständigen täglichen Erholungsplan.';

  @override
  String get backToHome => 'Zurück nach Hause';

  @override
  String get howDoYouFeel => 'Wie fühlen Sie sich?';

  @override
  String get painNowTitle => 'Wie sind deine Schmerzen jetzt?';

  @override
  String get painNowSubtitle =>
      'Dies hilft uns, Ihre nächste Sitzung zu personalisieren.';

  @override
  String get thanksAdjustPlan => 'Danke! Wir passen Ihren Plan an.';

  @override
  String get workPatternTitle => 'Ihr Arbeitsmuster';

  @override
  String get workPatternSubtitle =>
      'Dies hilft uns, Pausen dann einzuplanen, wenn Sie sie am meisten brauchen.';

  @override
  String get whatShouldWeCallYou => 'Wie sollen wir dich nennen?';

  @override
  String get firstNameHint => 'Vorname';

  @override
  String get hoursSittingPerDay => 'Stunden Sitzen pro Tag';

  @override
  String get bestBreakTimes => 'Beste Pausenzeiten?';

  @override
  String get workPatternValidationAll =>
      'Fügen Sie Ihren Namen, die Sitzzeiten und eine Pausenzeit hinzu';

  @override
  String get workPatternValidationHours =>
      'Wählen Sie Sitzzeiten und mindestens eine Pausenzeit';

  @override
  String get stayOnTrackTitle => 'Bleiben Sie auf dem richtigen Weg';

  @override
  String get stayOnTrackSubtitle =>
      'Intelligente Erinnerungen erinnern Sie zum richtigen Zeitpunkt, nie während Besprechungen.';

  @override
  String get notificationBenefitBreaks =>
      'Pausenerinnerungen während der Arbeitszeit';

  @override
  String get notificationBenefitSlump => 'Einbruchwarnungen um 15 Uhr';

  @override
  String get notificationBenefitStreak => 'Streifenschutz stößt an';

  @override
  String get enableNotifications => 'Benachrichtigungen aktivieren';

  @override
  String get maybeLater => 'Vielleicht später';

  @override
  String get mobilityAssessmentTitle => 'Mobilitätsbewertung';

  @override
  String get analyzingPosture => 'Haltung analysieren...';

  @override
  String get mobilityScoreTitle => 'Mobilitätsbewertung';

  @override
  String get scanningInstructions =>
      'Stellen Sie sich in die Profilansicht. Halten Sie Ihren ganzen Körper im Bild.';

  @override
  String get scanPrivacyNote =>
      'Wir verwenden Ihre Kamera, um die Körperhaltung zu messen. Aus Datenschutzgründen erfolgt die Verarbeitung auf Ihrem Gerät.';

  @override
  String scanProgress(int percent) {
    return '$percent% abgeschlossen';
  }

  @override
  String get scanningEllipsis => 'Scannen...';

  @override
  String get startScan => 'Starten Sie den Scan';

  @override
  String get skipForNow => 'Überspringen Sie es vorerst';

  @override
  String get alignShouldersGuide =>
      'Richten Sie die Schultern an der Führung aus';

  @override
  String get yourMobilityScore => 'Ihr Mobilitätswert';

  @override
  String get scoreBasedOnScan =>
      'Basierend auf Ihrem Haltungsscan und Ihren Schmerzbereichen';

  @override
  String get seeMyPlan => 'Siehe Mein Plan';

  @override
  String potentialGain(int gain) {
    return '+$gain';
  }

  @override
  String get yourPlanAppBar => 'Ihr Plan';

  @override
  String get personalizedForYou => 'Personalisiert für Sie';

  @override
  String get planSubtitleDefault =>
      '3 tägliche Sitzungen, zugeschnitten auf Schreibtischarbeiter.';

  @override
  String planSubtitleFocused(String areas) {
    return 'Konzentriert sich auf $areas mit intelligentem Pausen-Timing.';
  }

  @override
  String get startMyPlan => 'Starten Sie meinen Plan';

  @override
  String sessionDurationMin(int minutes) {
    return '$minutes min';
  }

  @override
  String dayCheckIn(int day) {
    return 'Tag $day Check-in';
  }

  @override
  String get howDoesBodyFeelToday => 'Wie fühlt sich Ihr Körper heute an?';

  @override
  String get checkInHelpsPickRoutine =>
      'Dies hilft uns, die richtige Routine für Sie auszuwählen.';

  @override
  String get overallPainLevel => 'Gesamtschmerzniveau';

  @override
  String get troubleAreasToday => 'Krisengebiete heute';

  @override
  String get troubleAreaEyes => 'Augen';

  @override
  String get continueToTodaysSession =>
      'Fahren Sie mit der heutigen Sitzung fort';

  @override
  String get proLockPremiumProgramFeature => 'Premium-Programm';

  @override
  String get proLockPremiumProgramBenefit =>
      'Dieses Schreibtischprogramm ist Teil der Pro-Bibliothek. Über 50 gezielte Sitzungen für Nacken, Rücken, Hüften und mehr.';

  @override
  String get defaultSessionTitle => 'Schreibtischpause';

  @override
  String get defaultSessionSubtitle => 'Schneller Mobilitäts-Reset';

  @override
  String get beforeWeStart => 'Bevor wir beginnen';

  @override
  String get howDoesBodyFeel => 'Wie fühlt sich Ihr Körper an?';

  @override
  String get painScaleGreat => 'Großartig';

  @override
  String get painScaleSore => 'Wund';

  @override
  String get startSession => 'Sitzung starten';

  @override
  String get skipCheckIn => 'Überspringen Sie den Check-in';

  @override
  String get smartBreakPromptTitle => 'Intelligente Pause';

  @override
  String smartBreakAiMessage(String issue) {
    return 'AI hat diese Pause für Ihr $issue ausgewählt. Du hast 47 Minuten gesessen. 90 Sekunden helfen.';
  }

  @override
  String get smartBreakProMessage =>
      'Pro Smart Break: Ihr Nacken braucht nach 47 Minuten Sitzen eine Erholung.';

  @override
  String get smartBreakFreeMessage =>
      'Du hast 47 Minuten gesessen. Ihr Nacken könnte einen 90-Sekunden-Reset gebrauchen.';

  @override
  String get start90SecBreak => 'Beginnen Sie mit einer 90-sekündigen Pause';

  @override
  String get snooze15Min => '15 Min. Schlummern';

  @override
  String get achievementUnlocked => 'Erfolg freigeschaltet';

  @override
  String get milestoneReachedFallback => 'Meilenstein erreicht!';

  @override
  String daysStrong(int days) {
    return '$days Tage stark';
  }

  @override
  String get unlockProFreeTrial =>
      'Schalten Sie die kostenlose Pro-Testversion frei';

  @override
  String get continueToHome => 'Weiter zur Startseite';

  @override
  String get keepGoing => 'Weitermachen';

  @override
  String get milestoneMessageDay3 =>
      'Drei Tage hintereinander. Kleine Pausen summieren sich.';

  @override
  String get milestoneMessageDay7 =>
      'Eine ganze Woche lang für Ihren Körper da sein.';

  @override
  String get milestoneMessageDay14 =>
      'Zwei Wochen lang konstant – Ihre Beweglichkeit verbessert sich.';

  @override
  String get milestoneMessageDay30 =>
      'Dreißig Tage. Sie haben eine echte Gewohnheit zur Erholung am Schreibtisch entwickelt.';

  @override
  String get milestoneMessageDefault =>
      'Immer wieder auftauchen. Dein Körper verändert sich.';

  @override
  String weekRecapTitle(int week) {
    return 'Woche $week Rückblick';
  }

  @override
  String get yourWeekInReview => 'Ihr Wochenrückblick';

  @override
  String get weekRecapSubtitle =>
      'Kleine Pausen summieren sich. Hier ist Ihr Fortschritt.';

  @override
  String get recapSessions => 'Sitzungen';

  @override
  String get recapStreak => 'Strähne';

  @override
  String get recapMinutes => 'Minuten';

  @override
  String get aiWeeklyInsightTitle => 'Wöchentliche KI-Einblicke';

  @override
  String get aiInsightEmpty =>
      'Absolvieren Sie Sitzungen, um KI-Einblicke zu erhalten.';

  @override
  String get unlockAiWeeklyInsights =>
      'Schalten Sie mit Pro wöchentliche KI-Einblicke frei';

  @override
  String get weMissYou => 'Wir vermissen dich!';

  @override
  String get reEngagementBody =>
      'Ihr Nacken und Ihr Rücken nehmen sich keine Ruhetage. Eine 90-sekündige Pause genügt, um wieder in die Spur zu kommen.';

  @override
  String get quickComebackSession => 'Schnelle Comeback-Session';

  @override
  String get comebackSessionDetails =>
      'Nackenentlastung · 3 Min. · Keine Ausrüstung';

  @override
  String get do3MinComeback => 'Machen Sie ein 3-minütiges Comeback';

  @override
  String get remindMeTomorrow => 'Erinnere mich morgen daran';

  @override
  String get journeyMapTitle => '30-tägige Reise';

  @override
  String dayOf30(int day) {
    return 'Tag $day von 30';
  }

  @override
  String get achievementsTitle => 'Erfolge';

  @override
  String achievementsUnlockedCount(int unlocked, int total) {
    return '$unlocked / $total entsperrt';
  }

  @override
  String achievementUnlockDay(int day) {
    return 'Tag $day';
  }

  @override
  String get remindersTitle => 'Erinnerungen';

  @override
  String get breakFrequency => 'Pausenfrequenz';

  @override
  String breakFrequencyMin(int minutes) {
    return '$minutes min';
  }

  @override
  String get activeHours => 'Aktive Stunden';

  @override
  String get smartRemindersSubtitle =>
      'Überspringen Sie Besprechungen und passen Sie sich der Aktivität an';

  @override
  String get calmCalibratePro => 'CalmCalibrate Pro';

  @override
  String get fullDeskRecoverySystem =>
      'Vollständiges Wiederherstellungssystem für den Schreibtisch';

  @override
  String get unlockFullRecovery =>
      'Schalten Sie die vollständige Wiederherstellung frei';

  @override
  String get paywallTagline =>
      '90-sekündige Pausen, die auch am Schreibtisch funktionieren.';

  @override
  String get startFreeTrial => 'Kostenlose Testversion starten';

  @override
  String get cancelTrial => 'Testversion abbrechen';

  @override
  String get trialDisclaimer =>
      '7-tägige kostenlose Testversion · Jederzeit kündbar';

  @override
  String get welcomeProTrialStarted =>
      'Willkommen bei Pro! 7-tägiger kostenloser Testzeitraum gestartet.';

  @override
  String get aiDailyPlanComingSoon => 'KI-Tagesplan kommt bald';

  @override
  String get generateAiPlanToday => 'Erstellen Sie einen KI-Plan für heute';

  @override
  String aiFocus(String focus) {
    return 'KI-Fokus: $focus';
  }

  @override
  String get planSlotMorning => 'Morgen';

  @override
  String get planSlotMidday => 'Mittag';

  @override
  String get planSlotEvening => 'Abend';

  @override
  String get aiDailyPlanLockedTeaser =>
      'Vorteil: KI erstellt Ihren Morgen-, Mittags- und Abendplan';

  @override
  String get howAreYouFeeling => 'Wie fühlen Sie sich?';

  @override
  String get moodSoundPremiumHint =>
      'Wir spielen während Ihrer Sitzung eine passende Klangkulisse ein';

  @override
  String get moodSoundFreeHint =>
      'Pro schaltet stimmungsangepasstes Umgebungsaudio frei';

  @override
  String get proLockMoodFeature => 'Stimmungsvolle Klanglandschaften';

  @override
  String get moodSoundLockedTeaser =>
      'Pro: Auf Ihre Stimmung abgestimmte Klanglandschaften';

  @override
  String featureComingSoon(String feature) {
    return '$feature kommt bald';
  }

  @override
  String get aiNotConnectedYet =>
      'AI ist noch nicht verbunden. Wenn Sie bereit sind, wird ein serverloses LLM verwendet. Kein Login erforderlich.';

  @override
  String get sessionMorningResetTitle => 'Morgen-Reset';

  @override
  String get sessionMorningResetSubtitle => 'Wecken Sie Ihre Wirbelsäule auf';

  @override
  String get sessionMiddayBreakTitle => 'Mittagspause am Schreibtisch';

  @override
  String get sessionMiddayBreakSubtitle =>
      'Bekämpfen Sie die Nachmittagssteifheit';

  @override
  String get sessionEveningRecoveryTitle => 'Abendliche tiefe Erholung';

  @override
  String get sessionEveningRecoverySubtitle =>
      'Lassen Sie die Anspannung des Tages hinter sich';

  @override
  String get sessionNeckReliefTitle => 'Nackenentlastung';

  @override
  String get sessionNeckReliefSubtitle =>
      'Korrektur der Kopfhaltung nach vorne';

  @override
  String get sessionBackSaverTitle => 'Rückenschoner';

  @override
  String get sessionBackSaverSubtitle => 'Dekompression des unteren Rückens';

  @override
  String get sessionUpperBackReliefTitle => 'Entlastung des oberen Rückens';

  @override
  String get sessionUpperBackReliefSubtitle => 'Thorax- und Fallenfreigabe';

  @override
  String get sessionHipOpenerTitle => 'Hüftöffner';

  @override
  String get sessionHipOpenerSubtitle => 'Enge Hüftbeuger';

  @override
  String get sessionEyeResetTitle => 'Augen-Reset';

  @override
  String get sessionEyeResetSubtitle => 'Bildschirm-Zugentlastung';

  @override
  String get sessionShoulderMeltTitle => 'Schulterschmelze';

  @override
  String get sessionShoulderMeltSubtitle => 'Freigabe der oberen Falle';

  @override
  String get stepNeckRollsName => 'Nackenrollen';

  @override
  String get stepNeckRollsInstruction =>
      'Rollen Sie Ihren Hals langsam im Kreis. Atme tief durch.';

  @override
  String get stepNeckRollsTip => 'Bewegen Sie sich langsam. Kein Ruckeln.';

  @override
  String get stepShoulderShrugsName => 'Schulterzucken';

  @override
  String get stepShoulderShrugsInstruction =>
      'Heben Sie die Schultern an die Ohren, halten Sie sie 3 Sekunden lang und lassen Sie sie los.';

  @override
  String get stepShoulderShrugsTip =>
      'Halten Sie die Taste oben 3 Sekunden lang gedrückt.';

  @override
  String get stepSeatedTwistName => 'Sitzende Drehung';

  @override
  String get stepSeatedTwistInstruction =>
      'Vorsichtig nach links und rechts drehen. Halten Sie die Hüften nach vorne gerichtet.';

  @override
  String get stepSeatedTwistTip =>
      'Halten Sie die Hüften ruhig. Ab der Taille drehen.';

  @override
  String get stepChestOpenerName => 'Brustöffner';

  @override
  String get stepChestOpenerInstruction =>
      'Hände hinter dem Rücken verschränken. Öffnen Sie die Brust vorsichtig.';

  @override
  String get stepChestOpenerTip => 'Drücken Sie die Schulterblätter zusammen.';

  @override
  String get stepNeckSideReleaseName => 'Seitliche Entriegelung am Hals';

  @override
  String get stepNeckSideReleaseInstruction =>
      'Neigen Sie das Ohr zur Schulter. Halten Sie jede Seite 20 Sekunden lang gedrückt.';

  @override
  String get stepNeckSideReleaseTip =>
      'Halten Sie die gegenüberliegende Schulter entspannt.';

  @override
  String get stepSeatedCatCowName => 'Sitzende Katzenkuh';

  @override
  String get stepSeatedCatCowInstruction =>
      'Beugen und runden Sie Ihren Rücken langsam mit der Atmung.';

  @override
  String get stepSeatedCatCowTip =>
      'Synchronisieren Sie die Bewegung mit Ihrem Atem.';

  @override
  String get stepHipFlexorStretchName => 'Dehnung der Hüftbeuger';

  @override
  String get stepHipFlexorStretchInstruction =>
      'Stehen Sie auf und treten Sie einen Fuß zurück. Lehnen Sie sich sanft nach vorne.';

  @override
  String get stepHipFlexorStretchTip =>
      'Halten Sie das vordere Knie über dem Knöchel.';

  @override
  String get stepStandingBackExtensionName => 'Stehende Rückenverlängerung';

  @override
  String get stepStandingBackExtensionInstruction =>
      'Hände auf dem unteren Rücken. Lehnen Sie sich leicht zurück.';

  @override
  String get stepStandingBackExtensionTip => 'Kleines Sortiment. Kein Zwang.';

  @override
  String get stepThoracicExtensionName => 'Thoraxverlängerung';

  @override
  String get stepThoracicExtensionInstruction =>
      'Hände hinter dem Kopf. Oberen Rücken über den Stuhl beugen.';

  @override
  String get stepThoracicExtensionTip =>
      'Führen Sie mit der Brust, nicht mit dem Hals.';

  @override
  String get stepFigure4StretchName => 'Abbildung 4 Dehnung';

  @override
  String get stepFigure4StretchInstruction =>
      'Knöchel am gegenüberliegenden Knie. Lehnen Sie sich sanft nach vorne.';

  @override
  String get stepFigure4StretchTip => 'Flexfuß zum Schutz des Knies.';

  @override
  String get stepChildsPoseChairName => 'Kinderpose (Stuhl)';

  @override
  String get stepChildsPoseChairInstruction =>
      'Lehnen Sie sich zurück und beugen Sie sich über die Knie nach vorne. Atmen.';

  @override
  String get stepChildsPoseChairTip => 'Lass deinen Nacken schwer hängen.';

  @override
  String get stepDeepBreathingName => 'Tiefes Atmen';

  @override
  String get stepDeepBreathingInstruction =>
      '4 Counts rein, 6 Counts raus. Entspannen Sie die Schultern.';

  @override
  String get stepDeepBreathingTip =>
      'Längeres Ausatmen beruhigt das Nervensystem.';

  @override
  String get stepDeskStretchName => 'Schreibtischdehnung';

  @override
  String get stepDeskStretchInstruction =>
      'Sanfte Dehnung an Ihrem Schreibtisch.';

  @override
  String get stepDeskStretchTip =>
      'Bewegen Sie sich innerhalb eines angenehmen Bereichs.';

  @override
  String get journeyDay1Title => 'Erste Sitzung';

  @override
  String get journeyDay1Goal => 'Komplettes Onboarding + 1 Pause';

  @override
  String get journeyDay1Action =>
      'Beenden Sie die Schmerzbeurteilung und führen Sie den „Morning Reset“ durch';

  @override
  String get journeyDay2Title => 'Bauen Sie die Gewohnheit auf';

  @override
  String get journeyDay2Goal => '2 Sitzungen + täglicher Check-in';

  @override
  String get journeyDay2Action =>
      'Protokollieren Sie, wie sich Ihr Nacken anfühlt, und machen Sie eine Mittagspause am Schreibtisch';

  @override
  String get journeyDay3Title => '3-tägiger Streak';

  @override
  String get journeyDay3Goal => 'Erfolgreiche 3-Tage-Serie';

  @override
  String get journeyDay3Action =>
      'Schließen Sie jede Sitzung vor Ende des Tages ab';

  @override
  String get journeyDay3Milestone => '3-Tage-Strecke';

  @override
  String get journeyDay4Title => 'Nachmittagsflaute';

  @override
  String get journeyDay4Goal => 'Probieren Sie Smart Break um 15 Uhr aus';

  @override
  String get journeyDay4Action =>
      'Reagieren Sie auf die Smart-Break-Eingabeaufforderung';

  @override
  String get journeyDay5Title => 'Entdecken Sie die Bibliothek';

  @override
  String get journeyDay5Goal =>
      'Probieren Sie ein neues Programm für den Schmerzbereich aus';

  @override
  String get journeyDay5Action =>
      'Öffnen Sie Sitzungen und wählen Sie „Nackenentlastung“.';

  @override
  String get journeyDay6Title => 'Wochenendvorbereitung';

  @override
  String get journeyDay6Goal => 'Legen Sie einen Erinnerungszeitplan fest';

  @override
  String get journeyDay6Action => 'Überprüfen Sie die Erinnerungseinstellungen';

  @override
  String get journeyDay7Title => 'Zusammenfassung der ersten Woche';

  @override
  String get journeyDay7Goal => 'Überprüfen Sie den wöchentlichen Fortschritt';

  @override
  String get journeyDay7Action =>
      'Öffnen Sie die wöchentliche Zusammenfassung und sehen Sie, wie sich die Mobilitätsbewertung ändert';

  @override
  String get journeyDay7Milestone => 'Woche 1 abgeschlossen';

  @override
  String get journeyDay8Title => 'Tiefergehende Genesung';

  @override
  String get journeyDay8Goal => 'Komplette abendliche Tiefenerholung';

  @override
  String get journeyDay8Action =>
      '12-minütige Abendsitzung vor dem Schlafengehen';

  @override
  String get journeyDay10Title => 'Fortschrittskontrolle';

  @override
  String get journeyDay10Goal =>
      'Überprüfen Sie Ihre wöchentlichen Statistiken';

  @override
  String get journeyDay10Action =>
      'Sehen Sie sich Sitzungen und Schmerztrends auf Progress an';

  @override
  String get journeyDay14Title => '2-wöchiger Meilenstein';

  @override
  String get journeyDay14Goal => '14-tägiger Streak oder 10+ Sitzungen';

  @override
  String get journeyDay14Action => 'Schalte das Leistungsabzeichen frei';

  @override
  String get journeyDay14Milestone => '2 Wochen Krieger';

  @override
  String get journeyDay15Title => 'Halbzeitpunkt';

  @override
  String get journeyDay15Goal => 'Überprüfen Sie die Anfahrtskarte';

  @override
  String get journeyDay15Action =>
      'Sehen Sie sich den Fortschritt von Tag 1 bis 30 auf der Reisekarte an';

  @override
  String get journeyDay21Title => 'Rückblick auf Woche 3';

  @override
  String get journeyDay21Goal =>
      'Wöchentliche Zusammenfassung + Fortschritt teilen';

  @override
  String get journeyDay21Action =>
      'Überprüfen Sie den 3-Wochen-Mobilitätstrend';

  @override
  String get journeyDay30Title => '30-tägiger Abschluss';

  @override
  String get journeyDay30Goal => 'Komplettes 30-Tage-Programm';

  @override
  String get journeyDay30Action =>
      'Abschließende Beurteilung + Premium-Testversion freischalten';

  @override
  String get journeyDay30Milestone => '30-Tage-Absolvent';

  @override
  String get journeyDayDefaultTitle => 'Tägliche Schreibtischpause';

  @override
  String get journeyDayDefaultGoal => 'Absolvieren Sie mindestens eine Sitzung';

  @override
  String get journeyDayDefaultAction =>
      'Machen Sie an Ihrem Schreibtisch eine 3- bis 5-minütige Mobilitätspause';

  @override
  String get achievementFirstBreakTitle => 'Erste Pause';

  @override
  String get achievementFirstBreakDesc =>
      'Sie haben Ihre erste Schreibtischsitzung abgeschlossen';

  @override
  String get achievementStreak3Title => '3-Tage-Strecke';

  @override
  String get achievementStreak3Desc => '3 Tage hintereinander umgezogen';

  @override
  String get achievementWeek1Title => 'Woche 1 abgeschlossen';

  @override
  String get achievementWeek1Desc => 'Du hast deine erste Woche beendet';

  @override
  String get achievementStreak14Title => '2 Wochen Krieger';

  @override
  String get achievementStreak14Desc => '14 Tage Erholung am Schreibtisch';

  @override
  String get achievementScore60Title => 'Mobilität 60+';

  @override
  String get achievementScore60Desc => 'Der Mobilitätswert erreichte 60';

  @override
  String get achievementGraduate30Title => '30-Tage-Absolvent';

  @override
  String get achievementGraduate30Desc => 'Komplettes Programm abgeschlossen';

  @override
  String get moodStressed => 'Betont';

  @override
  String get moodStressedSoundscape => 'Tief einatmen, Umgebungsluft';

  @override
  String get moodStressedDesc =>
      'Langsame Ausatmungstöne beruhigen Ihr Nervensystem';

  @override
  String get moodTired => 'Müde';

  @override
  String get moodTiredSoundscape => 'Sanfter Regen';

  @override
  String get moodTiredDesc => 'Sanfter Regen lindert geistige Müdigkeit';

  @override
  String get moodSore => 'Wund';

  @override
  String get moodSoreSoundscape => 'Warme tiefe Töne';

  @override
  String get moodSoreDesc => 'Beruhigende Frequenzen für verspannte Muskeln';

  @override
  String get moodFocused => 'Konzentriert';

  @override
  String get moodFocusedSoundscape => 'Minimales Fokuspad';

  @override
  String get moodFocusedDesc =>
      'Leichter Rhythmus, um während der Dehnübungen präsent zu bleiben';

  @override
  String get moodCalm => 'Ruhig';

  @override
  String get moodCalmSoundscape => 'Schreibtisch-Zen';

  @override
  String get moodCalmDesc => 'Ruhiger Hintergrund für das Büro';

  @override
  String get proLockCtaDefault =>
      'Starten Sie die kostenlose 7-Tage-Testversion';

  @override
  String get upsellDefaultTitle => 'Möchten Sie mehr aus jeder Pause?';

  @override
  String get upsellDefaultSubtitle =>
      'Schalten Sie KI-Pläne, Stimmungsgeräuschlandschaften, Haltungsscan und über 50 Programme frei.';

  @override
  String get proFeature50Programs => 'Über 50 Programme';

  @override
  String get proFeature50ProgramsSub => 'Vollständige Schreibtischbibliothek';

  @override
  String get proFeatureAiPosture => 'KI-Haltung';

  @override
  String get proFeatureAiPostureSub => 'Scannen und verfolgen';

  @override
  String get proFeatureAiDailyPlan => 'KI-Tagesplan';

  @override
  String get proFeatureAiDailyPlanSub => 'Personalisiert';

  @override
  String get proFeatureSmartBreaks => 'Intelligente Pausen';

  @override
  String get proFeatureSmartBreaksSub => 'Zeitgesteuerte Erinnerungen';

  @override
  String get proFeatureWeeklyReport => 'Wochenbericht';

  @override
  String get proFeatureWeeklyReportSub => 'KI-Fortschritt';

  @override
  String get proFeatureMoodSounds => 'Stimmungsgeräusche';

  @override
  String get proFeatureMoodSoundsSub => 'Umgebungsgeräusche';

  @override
  String get proFeatureDesktopApp => 'Desktop-App';

  @override
  String get proFeatureDesktopAppSub => 'Kommt bald';

  @override
  String get comingSoonBadge => 'Bald';

  @override
  String get desktopCompanionComingSoon => 'Desktop-Begleiter kommt bald!';

  @override
  String get aiPlanBelowHint =>
      'Ihr KI-Plan finden Sie unten in den heutigen Sitzungen';

  @override
  String get cancelProTrialTitle => 'Pro-Testversion abbrechen?';

  @override
  String get cancelProTrialBody =>
      'Sie verlieren den Zugriff auf KI-Pläne, Haltungsanalysen und die vollständige Übungsbibliothek. Ihr Fortschritt und Ihre Erfolgsserie bleiben gespeichert.';

  @override
  String get keepPro => 'Bleiben Sie Profi';

  @override
  String get proTrialCancelled =>
      'Pro-Testversion abgesagt. Sie nutzen den kostenlosen Plan.';

  @override
  String get permissionNotificationsTitle => 'Pausenerinnerungen zulassen';

  @override
  String get permissionNotificationsRationale =>
      'CalmCalibrate sendet während Ihrer Arbeitszeit Erinnerungen an Schreibtischpausen, damit Sie mobil und schmerzfrei bleiben. Sie können diese jederzeit in den Einstellungen deaktivieren.';

  @override
  String get permissionCameraTitle => 'Kamerazugriff für Haltungsscan';

  @override
  String get permissionCameraRationale =>
      'CalmCalibrate verwendet die Kamera, um Ihre Körperhaltung während der Mobilitätsbeurteilung zu analysieren. Das Video wird auf Ihrem Gerät verarbeitet und nicht hochgeladen.';

  @override
  String get permissionExactAlarmRationale =>
      'Ermöglicht, dass Pausenerinnerungen genau zu den von Ihnen geplanten Zeiten eintreffen, auch wenn die App im Hintergrund läuft.';
}
