// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'CalmeCalibrer';

  @override
  String get navHome => 'Maison';

  @override
  String get navProgress => 'Progrès';

  @override
  String get navSessions => 'Séances';

  @override
  String get navProfile => 'Profil';

  @override
  String get continueButton => 'Continuer';

  @override
  String get getStarted => 'Commencer';

  @override
  String get back => 'Dos';

  @override
  String get done => 'Fait';

  @override
  String get skip => 'Sauter';

  @override
  String get close => 'Fermer';

  @override
  String get save => 'Sauvegarder';

  @override
  String get cancel => 'Annuler';

  @override
  String get welcomeTitle => 'Bougez mieux\nau travail';

  @override
  String get welcomeSubtitle =>
      'Soulagez les raideurs, corrigez votre posture et sentez-vous plein d\'énergie avec des pauses de bureau de 90 secondes faites pour vous.';

  @override
  String get painSelectorTitle => 'Où est-ce que rester assis fait mal ?';

  @override
  String get goalsRemindersTitle => 'Objectifs et rappels';

  @override
  String get goalsRemindersSubtitle =>
      'Nous vous donnerons un coup de pouce au bon moment, jamais pendant les réunions.';

  @override
  String get yourGoals => 'Vos objectifs';

  @override
  String get reminderFrequency => 'Fréquence de rappel';

  @override
  String reminderMinutesLabel(int minutes) {
    return '$minutes min';
  }

  @override
  String get smartReminders => 'Rappels intelligents';

  @override
  String get smartRemindersHint =>
      'Évitez les coups de coude lorsque vous êtes en réunion ou en appel.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get appearance => 'Apparence';

  @override
  String get appearanceHint =>
      'Choisissez l\'apparence de CalmCalibrate sur cet appareil.';

  @override
  String get language => 'Langue';

  @override
  String get languageHint => 'Langue d\'affichage de l\'application';

  @override
  String get systemDefault => 'Valeur par défaut du système';

  @override
  String get themeLight => 'Lumière';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get reminders => 'Rappels';

  @override
  String remindersEveryMinutes(int minutes) {
    return 'Toutes les $minutes minutes';
  }

  @override
  String get journeyTitle => 'Voyage de 30 jours';

  @override
  String get journeySubtitle => 'Voir votre programme complet';

  @override
  String get achievements => 'Réalisations';

  @override
  String get achievementsSubtitle => 'Insignes et jalons';

  @override
  String get retakeAssessment => 'Reprendre l\'évaluation';

  @override
  String get retakeAssessmentSubtitle =>
      'Mettez à jour votre score de mobilité';

  @override
  String get proSubscription => 'Abonnement Pro';

  @override
  String get upgradeToPro => 'Passer à Pro';

  @override
  String get proBenefitsSubtitle =>
      'Plans d\'IA, analyse de posture et bibliothèque complète';

  @override
  String trialDaysLeft(int count) {
    return '$count jours d\'essai restants';
  }

  @override
  String get viewProBenefits => 'Voir les avantages Pro';

  @override
  String get cancelFreeTrial => 'Annuler l\'essai gratuit';

  @override
  String get returnToFreePlan => 'Revenir au forfait gratuit';

  @override
  String get painNeck => 'Cou';

  @override
  String get painShoulders => 'Épaules';

  @override
  String get painUpperBack => 'Haut du dos';

  @override
  String get painLowerBack => 'Lombes';

  @override
  String get painHips => 'Les hanches';

  @override
  String get breakMorning => 'Matin';

  @override
  String get breakLunch => 'Déjeuner';

  @override
  String get breakAfternoon => 'Après-midi';

  @override
  String get breakEvening => 'Soirée';

  @override
  String get goalReduceNeckPain => 'Réduire les douleurs au cou';

  @override
  String get goalFixPosture => 'Corriger la posture';

  @override
  String get goalMoreEnergy => 'Plus d\'énergie';

  @override
  String get goalPreventInjury => 'Prévenir les blessures';

  @override
  String get sittingFourToSix => '4 à 6 heures';

  @override
  String get sittingSixToEight => '6 à 8 heures';

  @override
  String get sittingEightPlus => '8+ heures';

  @override
  String get hours => 'heures';

  @override
  String get localeEnglish => 'Anglais';

  @override
  String get localeUrdu => 'Ourdou';

  @override
  String get localeHindi => 'hindi';

  @override
  String get localeBengali => 'bengali';

  @override
  String get localeSpanish => 'Espagnol';

  @override
  String get localeFrench => 'Français';

  @override
  String get localeArabic => 'arabe';

  @override
  String get localePortuguese => 'portugais';

  @override
  String get localeGerman => 'Allemand';

  @override
  String get greetingMorning => 'Bonjour';

  @override
  String get greetingAfternoon => 'Bon après-midi';

  @override
  String get greetingEvening => 'Bonne soirée';

  @override
  String get proBadge => 'PRO';

  @override
  String get aiBadge => 'IA';

  @override
  String postureScoreLabel(int score) {
    return 'Posture $score/100';
  }

  @override
  String trialDaysShort(int days) {
    return '$days j essai';
  }

  @override
  String get journeyDefaultGoal => 'Restez cohérent';

  @override
  String get journeyDefaultAction =>
      'Effectuez une pause au bureau aujourd\'hui';

  @override
  String aiPickedForIssue(String issue) {
    return 'IA choisie pour votre $issue';
  }

  @override
  String get proLockSmartBreakFeature => 'Rappels de pause intelligente';

  @override
  String get proLockSmartBreakBenefit =>
      'Les temps professionnels s\'écartent de votre posture et de votre modèle d\'assise. L\'IA choisit la bonne réinitialisation de 90 secondes lorsque vous en avez besoin.';

  @override
  String get yourProFeatures => 'Vos fonctionnalités Pro';

  @override
  String get proLockExtraSessionsFeature =>
      'Séances quotidiennes supplémentaires';

  @override
  String get proLockExtraSessionsBenefit =>
      'Le forfait gratuit comprend 1 séance par jour. Pro débloque votre plan IA complet : pauses du matin, de midi et du soir.';

  @override
  String get todaysAiPlan => 'Le plan IA d\'aujourd\'hui';

  @override
  String get todaysSessions => 'Les séances du jour';

  @override
  String get browseProgramsTitle => 'Parcourez plus de 50 programmes';

  @override
  String get browseProgramsSubtitle =>
      'Cou, dos, hanches et plus encore. Tout débloqué';

  @override
  String get unlockProTitle => 'Débloquez Pro';

  @override
  String get unlockProSubtitle =>
      'Posture IA · sons d\'humeur · 50+ programmes';

  @override
  String get checkInBannerTitle => 'Enregistrement quotidien';

  @override
  String get checkInBannerSubtitle => 'Comment va ton corps aujourd’hui ?';

  @override
  String get smartBreakTitle => 'Pause intelligente';

  @override
  String smartBreakNextIn(int minutes) {
    return 'Prochaine pause dans ~$minutes min';
  }

  @override
  String get smartBreakPremiumHint =>
      'Chronométré à partir de votre posture et de votre modèle d\'assise';

  @override
  String get smartBreakFreeHint => 'En fonction de votre configuration assise';

  @override
  String get journeyCardTodaysGoal => 'L\'objectif d\'aujourd\'hui';

  @override
  String get journeyCardDayLabel => 'JOUR';

  @override
  String journeyCardStreak(int days) {
    return '$days jours consécutifs';
  }

  @override
  String streakBadgeFull(int days) {
    return '$days jours consécutifs';
  }

  @override
  String get noProgressDataYet =>
      'Aucune donnée de progression pour l\'instant';

  @override
  String get weeklyProgressTitle => 'Progrès hebdomadaire';

  @override
  String get weeklyProgressEmptyHint =>
      'Terminez votre première session pour commencer le suivi.';

  @override
  String weeklyProgressSummary(int sessions, int minutes) {
    return '$sessions séances · $minutes min total';
  }

  @override
  String weeklyProgressAvgRelief(int relief) {
    return 'soulagement moyen +$relief';
  }

  @override
  String get beforeLabel => 'Avant';

  @override
  String get nowLabel => 'Maintenant';

  @override
  String get areaImprovementsTitle => 'Améliorations de la zone';

  @override
  String improvementPercent(int percent) {
    return '+$percent%';
  }

  @override
  String get sessionsTitle => 'Séances';

  @override
  String get sessionsSubtitlePro =>
      'Bibliothèque Pro débloquée · programmes par domaine';

  @override
  String get sessionsSubtitleFree =>
      'Programmes par zone douloureuse à votre bureau';

  @override
  String get filterAll => 'Tous';

  @override
  String get todaysPlan => 'Le plan d\'aujourd\'hui';

  @override
  String get allPrograms => 'Tous les programmes';

  @override
  String playingSoundscape(String label) {
    return 'Lecture : $label';
  }

  @override
  String stepProgress(int current, int total) {
    return 'Étape $current de $total';
  }

  @override
  String get previous => 'Précédent';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'CV';

  @override
  String get next => 'Suivant';

  @override
  String get defaultStretchTip =>
      'Astuce : Expirez pendant que vous vous étirez. Ne forcez jamais la douleur.';

  @override
  String get niceWork => 'Beau travail !';

  @override
  String get sessionCompleteMessage =>
      'Votre corps vous remercie. Continuez la séquence demain.';

  @override
  String get statMinutes => 'Minutes';

  @override
  String get statMobilityPts => 'Points de mobilité';

  @override
  String get statStreak => 'Traînée';

  @override
  String statStreakValue(int days) {
    return '${days}d';
  }

  @override
  String get upsellMoodSoundsTitle =>
      'Débloquez des sons d\'ambiance et des plans d\'IA';

  @override
  String get upsellMoodSoundsSubtitle =>
      'Pro adapte l\'audio ambiant à ce que vous ressentez et élabore votre plan de récupération quotidien complet.';

  @override
  String get backToHome => 'Retour à la maison';

  @override
  String get howDoYouFeel => 'Comment vous sentez-vous?';

  @override
  String get painNowTitle => 'Comment va ta douleur maintenant ?';

  @override
  String get painNowSubtitle =>
      'Cela nous aide à personnaliser votre prochaine session.';

  @override
  String get thanksAdjustPlan => 'Merci! Nous ajusterons votre plan.';

  @override
  String get workPatternTitle => 'Votre rythme de travail';

  @override
  String get workPatternSubtitle =>
      'Cela nous aide à planifier des pauses lorsque vous en avez le plus besoin.';

  @override
  String get whatShouldWeCallYou => 'Comment devrions-nous vous appeler ?';

  @override
  String get firstNameHint => 'Prénom';

  @override
  String get hoursSittingPerDay => 'Heures assises par jour';

  @override
  String get bestBreakTimes => 'Les meilleurs temps de pause ?';

  @override
  String get workPatternValidationAll =>
      'Ajoutez votre nom, vos heures de séance et une heure de pause';

  @override
  String get workPatternValidationHours =>
      'Sélectionnez des heures de séance et au moins une pause';

  @override
  String get stayOnTrackTitle => 'Restez sur la bonne voie';

  @override
  String get stayOnTrackSubtitle =>
      'Les rappels intelligents vous poussent au bon moment, jamais pendant les réunions.';

  @override
  String get notificationBenefitBreaks =>
      'Rappels de pause pendant les heures de travail';

  @override
  String get notificationBenefitSlump => 'Alertes de crise à 15 heures';

  @override
  String get notificationBenefitStreak =>
      'Coups de pouce pour la protection contre les traces';

  @override
  String get enableNotifications => 'Activer les notifications';

  @override
  String get maybeLater => 'Peut-être plus tard';

  @override
  String get mobilityAssessmentTitle => 'Évaluation de la mobilité';

  @override
  String get analyzingPosture => 'Analyser la posture...';

  @override
  String get mobilityScoreTitle => 'Score de mobilité';

  @override
  String get scanningInstructions =>
      'Tenez-vous en vue de profil. Gardez tout votre corps en forme.';

  @override
  String get scanPrivacyNote =>
      'Nous utiliserons votre appareil photo pour mesurer l\'alignement de la posture. Le traitement a lieu sur votre appareil pour des raisons de confidentialité.';

  @override
  String scanProgress(int percent) {
    return '$percent% terminé';
  }

  @override
  String get scanningEllipsis => 'Balayage...';

  @override
  String get startScan => 'Démarrer l\'analyse';

  @override
  String get skipForNow => 'Passer pour l\'instant';

  @override
  String get alignShouldersGuide => 'Aligner les épaules avec le guide';

  @override
  String get yourMobilityScore => 'Votre score de mobilité';

  @override
  String get scoreBasedOnScan =>
      'Basé sur votre analyse de posture et vos zones de douleur';

  @override
  String get seeMyPlan => 'Voir mon forfait';

  @override
  String potentialGain(int gain) {
    return '+$gain';
  }

  @override
  String get yourPlanAppBar => 'Votre forfait';

  @override
  String get personalizedForYou => 'Personnalisé pour vous';

  @override
  String get planSubtitleDefault =>
      '3 séances quotidiennes adaptées aux employés de bureau.';

  @override
  String planSubtitleFocused(String areas) {
    return 'Concentré sur $areas avec un timing de pause intelligent.';
  }

  @override
  String get startMyPlan => 'Commencer mon forfait';

  @override
  String sessionDurationMin(int minutes) {
    return '$minutes min';
  }

  @override
  String dayCheckIn(int day) {
    return 'Jour $day, enregistrement';
  }

  @override
  String get howDoesBodyFeelToday =>
      'Comment se sent votre corps aujourd’hui ?';

  @override
  String get checkInHelpsPickRoutine =>
      'Cela nous aide à choisir la routine qui vous convient.';

  @override
  String get overallPainLevel => 'Niveau de douleur global';

  @override
  String get troubleAreasToday => 'Zones problématiques aujourd’hui';

  @override
  String get troubleAreaEyes => 'Yeux';

  @override
  String get continueToTodaysSession =>
      'Continuer vers la séance d\'aujourd\'hui';

  @override
  String get proLockPremiumProgramFeature => 'Programme premium';

  @override
  String get proLockPremiumProgramBenefit =>
      'Ce programme de bureau fait partie de la bibliothèque Pro. Plus de 50 séances ciblées pour le cou, le dos, les hanches et plus encore.';

  @override
  String get defaultSessionTitle => 'Pause bureau';

  @override
  String get defaultSessionSubtitle => 'Réinitialisation rapide de la mobilité';

  @override
  String get beforeWeStart => 'Avant de commencer';

  @override
  String get howDoesBodyFeel => 'Comment se sent votre corps ?';

  @override
  String get painScaleGreat => 'Super';

  @override
  String get painScaleSore => 'Douloureux';

  @override
  String get startSession => 'Démarrer la session';

  @override
  String get skipCheckIn => 'Passer l\'enregistrement';

  @override
  String get smartBreakPromptTitle => 'Pause intelligente';

  @override
  String smartBreakAiMessage(String issue) {
    return 'AI a choisi cette pause pour votre $issue. Vous êtes assis depuis 47 minutes. 90 secondes aideront.';
  }

  @override
  String get smartBreakProMessage =>
      'Pause intelligente Pro : votre cou a besoin d\'une réinitialisation après 47 minutes de position assise.';

  @override
  String get smartBreakFreeMessage =>
      'Vous êtes assis depuis 47 minutes. Votre cou pourrait nécessiter une réinitialisation de 90 secondes.';

  @override
  String get start90SecBreak => 'Commencer une pause de 90 secondes';

  @override
  String get snooze15Min => 'Répéter 15 minutes';

  @override
  String get achievementUnlocked => 'Succès débloqué';

  @override
  String get milestoneReachedFallback => 'Jalon atteint !';

  @override
  String daysStrong(int days) {
    return '$days jours forts';
  }

  @override
  String get unlockProFreeTrial => 'Débloquez l\'essai gratuit Pro';

  @override
  String get continueToHome => 'Continuer vers l\'accueil';

  @override
  String get keepGoing => 'Continue';

  @override
  String get milestoneMessageDay3 =>
      'Trois jours de suite. Les petites pauses s’additionnent.';

  @override
  String get milestoneMessageDay7 =>
      'Une semaine complète à consacrer à votre corps.';

  @override
  String get milestoneMessageDay14 =>
      'Deux semaines de régularité — votre mobilité s\'améliore.';

  @override
  String get milestoneMessageDay30 =>
      'Trente jours. Vous avez développé une véritable habitude de récupération de bureau.';

  @override
  String get milestoneMessageDefault =>
      'Continuez à vous présenter. Votre corps change.';

  @override
  String weekRecapTitle(int week) {
    return 'Récapitulatif de la semaine $week';
  }

  @override
  String get yourWeekInReview => 'Votre semaine en revue';

  @override
  String get weekRecapSubtitle =>
      'Les petites pauses s’additionnent. Voici votre progression.';

  @override
  String get recapSessions => 'Séances';

  @override
  String get recapStreak => 'Traînée';

  @override
  String get recapMinutes => 'Minutes';

  @override
  String get aiWeeklyInsightTitle => 'Aperçu hebdomadaire de l\'IA';

  @override
  String get aiInsightEmpty =>
      'Terminez des sessions pour obtenir des informations sur l\'IA.';

  @override
  String get unlockAiWeeklyInsights =>
      'Débloquez des informations hebdomadaires sur l\'IA avec Pro';

  @override
  String get weMissYou => 'Tu nous manques !';

  @override
  String get reEngagementBody =>
      'Votre cou et votre dos ne prennent pas de jours de congé. Une pause de 90 secondes suffit pour se remettre sur les rails.';

  @override
  String get quickComebackSession => 'Séance de retour rapide';

  @override
  String get comebackSessionDetails =>
      'Soulagement du cou · 3 min · Aucun équipement';

  @override
  String get do3MinComeback => 'Faites un retour de 3 minutes';

  @override
  String get remindMeTomorrow => 'Rappelle-moi demain';

  @override
  String get journeyMapTitle => 'Voyage de 30 jours';

  @override
  String dayOf30(int day) {
    return 'Jour $day du 30';
  }

  @override
  String get achievementsTitle => 'Réalisations';

  @override
  String achievementsUnlockedCount(int unlocked, int total) {
    return '$unlocked / $total débloqué';
  }

  @override
  String achievementUnlockDay(int day) {
    return 'Jour $day';
  }

  @override
  String get remindersTitle => 'Rappels';

  @override
  String get breakFrequency => 'Fréquence de pause';

  @override
  String breakFrequencyMin(int minutes) {
    return '$minutes min';
  }

  @override
  String get activeHours => 'Heures d\'activité';

  @override
  String get smartRemindersSubtitle =>
      'Évitez les réunions, adaptez-vous à l\'activité';

  @override
  String get calmCalibratePro => 'CalmCalibrate Pro';

  @override
  String get fullDeskRecoverySystem =>
      'Système de récupération de bureau complet';

  @override
  String get unlockFullRecovery => 'Débloquez la récupération complète';

  @override
  String get paywallTagline =>
      'Des pauses de 90 secondes qui fonctionnent réellement à votre bureau.';

  @override
  String get startFreeTrial => 'Commencer l\'essai gratuit';

  @override
  String get cancelTrial => 'Annuler l\'essai';

  @override
  String get trialDisclaimer =>
      'Essai gratuit de 7 jours · Annulez à tout moment';

  @override
  String get welcomeProTrialStarted =>
      'Bienvenue chez Pro ! L\'essai gratuit de 7 jours a commencé.';

  @override
  String get aiDailyPlanComingSoon => 'Plan quotidien d\'IA bientôt disponible';

  @override
  String get generateAiPlanToday => 'Générez un plan d\'IA pour aujourd\'hui';

  @override
  String aiFocus(String focus) {
    return 'Objectif IA : $focus';
  }

  @override
  String get planSlotMorning => 'Matin';

  @override
  String get planSlotMidday => 'Midi';

  @override
  String get planSlotEvening => 'Soirée';

  @override
  String get aiDailyPlanLockedTeaser =>
      'Pro : L\'IA construit votre programme matin, midi et soir';

  @override
  String get howAreYouFeeling => 'Comment te sens-tu?';

  @override
  String get moodSoundPremiumHint =>
      'Nous jouerons un paysage sonore correspondant pendant votre session';

  @override
  String get moodSoundFreeHint =>
      'Pro débloque un son ambiant adapté à l\'ambiance';

  @override
  String get proLockMoodFeature => 'Paysages sonores d\'ambiance';

  @override
  String get moodSoundLockedTeaser =>
      'Pro : des paysages sonores adaptés à votre humeur';

  @override
  String featureComingSoon(String feature) {
    return '$feature à venir';
  }

  @override
  String get aiNotConnectedYet =>
      'L\'IA n\'est pas encore connectée. Cela utilisera un LLM sans serveur une fois prêt. Aucune connexion requise.';

  @override
  String get sessionMorningResetTitle => 'Réinitialisation du matin';

  @override
  String get sessionMorningResetSubtitle =>
      'Réveillez votre colonne vertébrale';

  @override
  String get sessionMiddayBreakTitle => 'Pause bureau de midi';

  @override
  String get sessionMiddayBreakSubtitle =>
      'Combattre les raideurs de l’après-midi';

  @override
  String get sessionEveningRecoveryTitle => 'Récupération profonde du soir';

  @override
  String get sessionEveningRecoverySubtitle =>
      'Relâchez la tension de la journée';

  @override
  String get sessionNeckReliefTitle => 'Soulagement du cou';

  @override
  String get sessionNeckReliefSubtitle =>
      'Correction de la posture de la tête vers l\'avant';

  @override
  String get sessionBackSaverTitle => 'Économiseur de dos';

  @override
  String get sessionBackSaverSubtitle => 'Décompression du bas du dos';

  @override
  String get sessionUpperBackReliefTitle => 'Soulagement du haut du dos';

  @override
  String get sessionUpperBackReliefSubtitle => 'Libération thoracique et piège';

  @override
  String get sessionHipOpenerTitle => 'Ouvre-hanche';

  @override
  String get sessionHipOpenerSubtitle => 'Fléchisseurs de hanche serrés';

  @override
  String get sessionEyeResetTitle => 'Réinitialisation des yeux';

  @override
  String get sessionEyeResetSubtitle => 'Décharge de traction de l\'écran';

  @override
  String get sessionShoulderMeltTitle => 'Fondre les épaules';

  @override
  String get sessionShoulderMeltSubtitle => 'Libération du piège supérieur';

  @override
  String get stepNeckRollsName => 'Rouleaux de cou';

  @override
  String get stepNeckRollsInstruction =>
      'Roulez lentement votre cou en cercle. Respirez profondément.';

  @override
  String get stepNeckRollsTip => 'Déplacez-vous lentement. Pas de secousses.';

  @override
  String get stepShoulderShrugsName => 'Haussements d\'épaules';

  @override
  String get stepShoulderShrugsInstruction =>
      'Soulevez les épaules jusqu\'aux oreilles, maintenez 3 secondes, relâchez.';

  @override
  String get stepShoulderShrugsTip => 'Maintenez en haut pendant 3 secondes.';

  @override
  String get stepSeatedTwistName => 'Torsion assise';

  @override
  String get stepSeatedTwistInstruction =>
      'Tournez doucement à gauche et à droite. Gardez les hanches tournées vers l’avant.';

  @override
  String get stepSeatedTwistTip =>
      'Gardez les hanches immobiles. Tournez à partir de la taille.';

  @override
  String get stepChestOpenerName => 'Ouvre-coffre';

  @override
  String get stepChestOpenerInstruction =>
      'Joignez les mains derrière le dos. Ouvrez doucement la poitrine.';

  @override
  String get stepChestOpenerTip => 'Pressez les omoplates ensemble.';

  @override
  String get stepNeckSideReleaseName => 'Libération côté cou';

  @override
  String get stepNeckSideReleaseInstruction =>
      'Inclinez l’oreille vers l’épaule. Tenez chaque côté 20 secondes.';

  @override
  String get stepNeckSideReleaseTip => 'Gardez l’épaule opposée détendue.';

  @override
  String get stepSeatedCatCowName => 'Vache chat assise';

  @override
  String get stepSeatedCatCowInstruction =>
      'Cambrez-vous et arrondissez lentement le dos en respirant.';

  @override
  String get stepSeatedCatCowTip =>
      'Synchronisez le mouvement avec votre respiration.';

  @override
  String get stepHipFlexorStretchName =>
      'Étirement des muscles fléchisseurs de la hanche';

  @override
  String get stepHipFlexorStretchInstruction =>
      'Levez-vous, reculez d’un pied. Penchez-vous doucement en avant.';

  @override
  String get stepHipFlexorStretchTip =>
      'Gardez le genou avant au-dessus de la cheville.';

  @override
  String get stepStandingBackExtensionName => 'Extension du dos debout';

  @override
  String get stepStandingBackExtensionInstruction =>
      'Mains dans le bas du dos. Penchez-vous légèrement en arrière.';

  @override
  String get stepStandingBackExtensionTip => 'Petite portée. Pas de forçage.';

  @override
  String get stepThoracicExtensionName => 'Extension thoracique';

  @override
  String get stepThoracicExtensionInstruction =>
      'Mains derrière la tête. Cambrez le haut du dossier par-dessus la chaise.';

  @override
  String get stepThoracicExtensionTip =>
      'Dirigez avec votre poitrine, pas avec votre cou.';

  @override
  String get stepFigure4StretchName => 'Figure 4 Étirement';

  @override
  String get stepFigure4StretchInstruction =>
      'Cheville sur le genou opposé. Penchez-vous doucement en avant.';

  @override
  String get stepFigure4StretchTip =>
      'Fléchissez le pied pour protéger le genou.';

  @override
  String get stepChildsPoseChairName => 'Pose de l\'enfant (chaise)';

  @override
  String get stepChildsPoseChairInstruction =>
      'Asseyez-vous, repliez-vous sur les genoux. Respirer.';

  @override
  String get stepChildsPoseChairTip => 'Laissez votre cou pendre lourdement.';

  @override
  String get stepDeepBreathingName => 'Respiration profonde';

  @override
  String get stepDeepBreathingInstruction =>
      '4 comptes entrants, 6 comptes sortants. Détendez les épaules.';

  @override
  String get stepDeepBreathingTip =>
      'Une expiration plus longue calme le système nerveux.';

  @override
  String get stepDeskStretchName => 'Étirement du bureau';

  @override
  String get stepDeskStretchInstruction =>
      'Étirez-vous doucement à votre bureau.';

  @override
  String get stepDeskStretchTip => 'Déplacez-vous dans une plage confortable.';

  @override
  String get journeyDay1Title => 'Première séance';

  @override
  String get journeyDay1Goal => 'Intégration complète + 1 pause';

  @override
  String get journeyDay1Action =>
      'Terminez l’évaluation de la douleur et effectuez la réinitialisation matinale';

  @override
  String get journeyDay2Title => 'Construisez l’habitude';

  @override
  String get journeyDay2Goal => '2 séances + enregistrement quotidien';

  @override
  String get journeyDay2Action =>
      'Enregistrez la sensation de votre cou et faites la pause de midi au bureau.';

  @override
  String get journeyDay3Title => 'séquence de 3 jours';

  @override
  String get journeyDay3Goal => 'A réussi une séquence de 3 jours';

  @override
  String get journeyDay3Action =>
      'Terminez n’importe quelle session avant la fin de la journée';

  @override
  String get journeyDay3Milestone => 'Séquence de 3 jours';

  @override
  String get journeyDay4Title => 'Crise de l\'après-midi';

  @override
  String get journeyDay4Goal => 'Essayez Smart Break à 15h';

  @override
  String get journeyDay4Action => 'Répondre à l\'invite de pause intelligente';

  @override
  String get journeyDay5Title => 'Explorer la bibliothèque';

  @override
  String get journeyDay5Goal =>
      'Essayez un nouveau programme pour les zones douloureuses';

  @override
  String get journeyDay5Action =>
      'Ouvrez les sessions et choisissez le soulagement du cou';

  @override
  String get journeyDay6Title => 'Préparation du week-end';

  @override
  String get journeyDay6Goal => 'Définir un calendrier de rappel';

  @override
  String get journeyDay6Action => 'Vérifier les paramètres de rappel';

  @override
  String get journeyDay7Title => 'Récapitulatif de la semaine 1';

  @override
  String get journeyDay7Goal => 'Examiner les progrès hebdomadaires';

  @override
  String get journeyDay7Action =>
      'Ouvrez le récapitulatif hebdomadaire et voyez l\'évolution du score de mobilité';

  @override
  String get journeyDay7Milestone => 'Semaine 1 terminée';

  @override
  String get journeyDay8Title => 'Une récupération plus profonde';

  @override
  String get journeyDay8Goal => 'Récupération profonde complète en soirée';

  @override
  String get journeyDay8Action =>
      'Séance du soir de 12 minutes avant de se coucher';

  @override
  String get journeyDay10Title => 'Contrôle des progrès';

  @override
  String get journeyDay10Goal => 'Consultez vos statistiques hebdomadaires';

  @override
  String get journeyDay10Action =>
      'Voir les séances et les tendances de la douleur sur Progress';

  @override
  String get journeyDay14Title => 'Jalon de 2 semaines';

  @override
  String get journeyDay14Goal => 'Séquence de 14 jours ou 10+ sessions';

  @override
  String get journeyDay14Action => 'Débloquez le badge de réussite';

  @override
  String get journeyDay14Milestone => 'Guerrier de 2 semaines';

  @override
  String get journeyDay15Title => 'À mi-chemin';

  @override
  String get journeyDay15Goal => 'Consulter la carte du voyage';

  @override
  String get journeyDay15Action =>
      'Voir la progression des jours 1 à 30 sur la carte du voyage';

  @override
  String get journeyDay21Title => 'Récapitulatif de la semaine 3';

  @override
  String get journeyDay21Goal =>
      'Récapitulatif hebdomadaire + partage des progrès';

  @override
  String get journeyDay21Action =>
      'Examen de la tendance de mobilité sur 3 semaines';

  @override
  String get journeyDay30Title => 'Diplômé de 30 jours';

  @override
  String get journeyDay30Goal => 'Programme complet de 30 jours';

  @override
  String get journeyDay30Action =>
      'Évaluation finale + débloquer l\'essai premium';

  @override
  String get journeyDay30Milestone => 'Diplômé de 30 jours';

  @override
  String get journeyDayDefaultTitle => 'Pause bureau quotidienne';

  @override
  String get journeyDayDefaultGoal => 'Terminer au moins une séance';

  @override
  String get journeyDayDefaultAction =>
      'Faites une pause mobilité de 3 à 5 min à votre bureau';

  @override
  String get achievementFirstBreakTitle => 'Première pause';

  @override
  String get achievementFirstBreakDesc =>
      'Vous avez terminé votre première session de bureau';

  @override
  String get achievementStreak3Title => 'Séquence de 3 jours';

  @override
  String get achievementStreak3Desc => 'Déménagé 3 jours de suite';

  @override
  String get achievementWeek1Title => 'Semaine 1 terminée';

  @override
  String get achievementWeek1Desc => 'Vous avez terminé votre première semaine';

  @override
  String get achievementStreak14Title => 'Guerrier de 2 semaines';

  @override
  String get achievementStreak14Desc => '14 jours de récupération de bureau';

  @override
  String get achievementScore60Title => 'Mobilité 60+';

  @override
  String get achievementScore60Desc => 'Le score de mobilité atteint 60';

  @override
  String get achievementGraduate30Title => 'Diplômé de 30 jours';

  @override
  String get achievementGraduate30Desc =>
      'Vous avez terminé le programme complet';

  @override
  String get moodStressed => 'Stressé';

  @override
  String get moodStressedSoundscape => 'Ambiance de respiration profonde';

  @override
  String get moodStressedDesc =>
      'Tonalités d\'expiration lentes pour calmer votre système nerveux';

  @override
  String get moodTired => 'Fatigué';

  @override
  String get moodTiredSoundscape => 'Pluie douce';

  @override
  String get moodTiredDesc =>
      'Des pluies douces pour soulager la fatigue mentale';

  @override
  String get moodSore => 'Douloureux';

  @override
  String get moodSoreSoundscape => 'Tonalités basses et chaudes';

  @override
  String get moodSoreDesc => 'Fréquences apaisantes pour les muscles tendus';

  @override
  String get moodFocused => 'Concentré';

  @override
  String get moodFocusedSoundscape => 'Pavé de mise au point minimal';

  @override
  String get moodFocusedDesc =>
      'Rythme léger pour rester présent pendant les étirements';

  @override
  String get moodCalm => 'Calme';

  @override
  String get moodCalmSoundscape => 'Bureau zen';

  @override
  String get moodCalmDesc => 'Contexte calme pour le bureau';

  @override
  String get proLockCtaDefault => 'Commencez l\'essai gratuit de 7 jours';

  @override
  String get upsellDefaultTitle => 'Vous voulez plus de chaque pause ?';

  @override
  String get upsellDefaultSubtitle =>
      'Débloquez des plans d\'IA, des paysages sonores d\'ambiance, une analyse de posture et plus de 50 programmes.';

  @override
  String get proFeature50Programs => '50+ programmes';

  @override
  String get proFeature50ProgramsSub => 'Bibliothèque de bureau complète';

  @override
  String get proFeatureAiPosture => 'Posture de l\'IA';

  @override
  String get proFeatureAiPostureSub => 'Scanner et suivre';

  @override
  String get proFeatureAiDailyPlan => 'Plan quotidien IA';

  @override
  String get proFeatureAiDailyPlanSub => 'Personnalisé';

  @override
  String get proFeatureSmartBreaks => 'Pauses intelligentes';

  @override
  String get proFeatureSmartBreaksSub => 'Rappels chronométrés';

  @override
  String get proFeatureWeeklyReport => 'Rapport hebdomadaire';

  @override
  String get proFeatureWeeklyReportSub => 'Progrès de l\'IA';

  @override
  String get proFeatureMoodSounds => 'Sons d\'humeur';

  @override
  String get proFeatureMoodSoundsSub => 'Son ambiant';

  @override
  String get proFeatureDesktopApp => 'Application de bureau';

  @override
  String get proFeatureDesktopAppSub => 'À venir';

  @override
  String get comingSoonBadge => 'Bientôt';

  @override
  String get desktopCompanionComingSoon => 'Compagnon de bureau à venir !';

  @override
  String get aiPlanBelowHint =>
      'Votre plan d\'IA est ci-dessous dans les sessions d\'aujourd\'hui';

  @override
  String get cancelProTrialTitle => 'Annuler l\'essai Pro ?';

  @override
  String get cancelProTrialBody =>
      'Vous perdrez l\'accès aux plans d\'IA, à l\'analyse de la posture et à la bibliothèque complète d\'exercices. Votre progression et votre séquence restent enregistrées.';

  @override
  String get keepPro => 'Restez pro';

  @override
  String get proTrialCancelled =>
      'Essai Pro annulé. Vous êtes sur le forfait gratuit.';

  @override
  String get permissionNotificationsTitle => 'Autoriser les rappels de pause';

  @override
  String get permissionNotificationsRationale =>
      'CalmCalibrate envoie des rappels de pause au bureau pendant vos heures de travail afin que vous restiez mobile et sans douleur. Vous pouvez les désactiver à tout moment dans Paramètres.';

  @override
  String get permissionCameraTitle =>
      'Accès à la caméra pour l\'analyse de la posture';

  @override
  String get permissionCameraRationale =>
      'CalmCalibrate utilise la caméra pour analyser votre posture lors de l\'évaluation de la mobilité. La vidéo est traitée sur votre appareil et n\'est pas téléchargée.';

  @override
  String get permissionExactAlarmRationale =>
      'Permet aux rappels de pause d\'arriver aux heures exactes que vous planifiez, même lorsque l\'application est en arrière-plan.';
}
