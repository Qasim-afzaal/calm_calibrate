// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'CalmaCalibrar';

  @override
  String get navHome => 'Hogar';

  @override
  String get navProgress => 'Progreso';

  @override
  String get navSessions => 'Sesiones';

  @override
  String get navProfile => 'Perfil';

  @override
  String get continueButton => 'Continuar';

  @override
  String get getStarted => 'Empezar';

  @override
  String get back => 'Atrás';

  @override
  String get done => 'Hecho';

  @override
  String get skip => 'Saltar';

  @override
  String get close => 'Cerca';

  @override
  String get save => 'Ahorrar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get welcomeTitle => 'Muévete mejor\nen el trabajo';

  @override
  String get welcomeSubtitle =>
      'Alivia la rigidez, corrige la postura y siéntete lleno de energía con descansos de escritorio de 90 segundos hechos para ti.';

  @override
  String get painSelectorTitle => '¿Dónde duele estar sentado?';

  @override
  String get goalsRemindersTitle => 'Metas y recordatorios';

  @override
  String get goalsRemindersSubtitle =>
      'Le daremos un empujón en el momento adecuado, nunca durante las reuniones.';

  @override
  String get yourGoals => 'Tus objetivos';

  @override
  String get reminderFrequency => 'Frecuencia de recordatorio';

  @override
  String reminderMinutesLabel(int minutes) {
    return '$minutes min';
  }

  @override
  String get smartReminders => 'recordatorios inteligentes';

  @override
  String get smartRemindersHint =>
      'Evite los empujones cuando esté en una reunión o en una llamada.';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get appearance => 'Apariencia';

  @override
  String get appearanceHint =>
      'Elija cómo se ve CalmCalibrate en este dispositivo.';

  @override
  String get language => 'Idioma';

  @override
  String get languageHint => 'Idioma de visualización de la aplicación';

  @override
  String get systemDefault => 'Valor predeterminado del sistema';

  @override
  String get themeLight => 'Luz';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get reminders => 'Recordatorios';

  @override
  String remindersEveryMinutes(int minutes) {
    return 'Cada $minutes min';
  }

  @override
  String get journeyTitle => 'Viaje de 30 días';

  @override
  String get journeySubtitle => 'Vea su programa completo';

  @override
  String get achievements => 'Logros';

  @override
  String get achievementsSubtitle => 'Insignias e hitos';

  @override
  String get retakeAssessment => 'Volver a tomar la evaluación';

  @override
  String get retakeAssessmentSubtitle => 'Actualiza tu puntuación de movilidad';

  @override
  String get proSubscription => 'Suscripción profesional';

  @override
  String get upgradeToPro => 'Actualízate a Pro';

  @override
  String get proBenefitsSubtitle =>
      'Planes de IA, escaneo de postura y biblioteca completa';

  @override
  String trialDaysLeft(int count) {
    return '$count días de prueba restantes';
  }

  @override
  String get viewProBenefits => 'Ver beneficios profesionales';

  @override
  String get cancelFreeTrial => 'Cancelar prueba gratuita';

  @override
  String get returnToFreePlan => 'Volver al plan gratuito';

  @override
  String get painNeck => 'Cuello';

  @override
  String get painShoulders => 'Espalda';

  @override
  String get painUpperBack => 'Parte superior de la espalda';

  @override
  String get painLowerBack => 'espalda baja';

  @override
  String get painHips => 'Caderas';

  @override
  String get breakMorning => 'Mañana';

  @override
  String get breakLunch => 'Almuerzo';

  @override
  String get breakAfternoon => 'Tarde';

  @override
  String get breakEvening => 'Noche';

  @override
  String get goalReduceNeckPain => 'Reducir el dolor de cuello';

  @override
  String get goalFixPosture => 'Arreglar la postura';

  @override
  String get goalMoreEnergy => 'Más energía';

  @override
  String get goalPreventInjury => 'Prevenir lesiones';

  @override
  String get sittingFourToSix => '4 a 6 horas';

  @override
  String get sittingSixToEight => '6 a 8 horas';

  @override
  String get sittingEightPlus => '8+ horas';

  @override
  String get hours => 'horas';

  @override
  String get localeEnglish => 'Inglés';

  @override
  String get localeUrdu => 'urdu';

  @override
  String get localeHindi => 'hindi';

  @override
  String get localeBengali => 'bengalí';

  @override
  String get localeSpanish => 'Español';

  @override
  String get localeFrench => 'Francés';

  @override
  String get localeArabic => 'árabe';

  @override
  String get localePortuguese => 'portugués';

  @override
  String get localeGerman => 'Alemán';

  @override
  String get greetingMorning => 'Buen día';

  @override
  String get greetingAfternoon => 'Buenas tardes';

  @override
  String get greetingEvening => 'Buenas noches';

  @override
  String get proBadge => 'PRO';

  @override
  String get aiBadge => 'AI';

  @override
  String postureScoreLabel(int score) {
    return 'Postura $score/100';
  }

  @override
  String trialDaysShort(int days) {
    return '$days d prueba';
  }

  @override
  String get journeyDefaultGoal => 'Mantente constante';

  @override
  String get journeyDefaultAction =>
      'Completa un descanso en el escritorio hoy';

  @override
  String aiPickedForIssue(String issue) {
    return 'IA elegida para tu $issue';
  }

  @override
  String get proLockSmartBreakFeature =>
      'Recordatorios de descanso inteligentes';

  @override
  String get proLockSmartBreakBenefit =>
      'Pro Times rompe con tu postura y patrón de sentado. La IA elige el reinicio correcto de 90 segundos cuando lo necesitas.';

  @override
  String get yourProFeatures => 'Tus funciones profesionales';

  @override
  String get proLockExtraSessionsFeature => 'Sesiones diarias adicionales';

  @override
  String get proLockExtraSessionsBenefit =>
      'El plan gratuito incluye 1 sesión por día. Pro desbloquea tu plan completo de IA: descansos por la mañana, el mediodía y la noche.';

  @override
  String get todaysAiPlan => 'El plan de IA de hoy';

  @override
  String get todaysSessions => 'Sesiones de hoy';

  @override
  String get browseProgramsTitle => 'Explora más de 50 programas';

  @override
  String get browseProgramsSubtitle =>
      'Cuello, espalda, caderas y más. Todo desbloqueado';

  @override
  String get unlockProTitle => 'Desbloquear Pro';

  @override
  String get unlockProSubtitle =>
      'Postura de IA · sonidos del estado de ánimo · Más de 50 programas';

  @override
  String get checkInBannerTitle => 'Registro diario';

  @override
  String get checkInBannerSubtitle => '¿Cómo está tu cuerpo hoy?';

  @override
  String get smartBreakTitle => 'Descanso inteligente';

  @override
  String smartBreakNextIn(int minutes) {
    return 'Próxima pausa en ~$minutes min';
  }

  @override
  String get smartBreakPremiumHint =>
      'Cronometrado según su postura y patrón de sentado';

  @override
  String get smartBreakFreeHint => 'Según tu patrón de sentado';

  @override
  String get journeyCardTodaysGoal => 'El objetivo de hoy';

  @override
  String get journeyCardDayLabel => 'DÍA';

  @override
  String journeyCardStreak(int days) {
    return '$days racha de días';
  }

  @override
  String streakBadgeFull(int days) {
    return '$days racha de días';
  }

  @override
  String get noProgressDataYet => 'Aún no hay datos de progreso';

  @override
  String get weeklyProgressTitle => 'Progreso semanal';

  @override
  String get weeklyProgressEmptyHint =>
      'Complete su primera sesión para comenzar a realizar el seguimiento.';

  @override
  String weeklyProgressSummary(int sessions, int minutes) {
    return '$sessions sesiones · $minutes min total';
  }

  @override
  String weeklyProgressAvgRelief(int relief) {
    return 'alivio promedio +$relief';
  }

  @override
  String get beforeLabel => 'Antes';

  @override
  String get nowLabel => 'Ahora';

  @override
  String get areaImprovementsTitle => 'Mejoras del área';

  @override
  String improvementPercent(int percent) {
    return '+$percent%';
  }

  @override
  String get sessionsTitle => 'Sesiones';

  @override
  String get sessionsSubtitlePro =>
      'Biblioteca Pro desbloqueada · programas por área';

  @override
  String get sessionsSubtitleFree =>
      'Programas por zona de dolor en tu escritorio';

  @override
  String get filterAll => 'Todo';

  @override
  String get todaysPlan => 'El plan de hoy';

  @override
  String get allPrograms => 'Todos los programas';

  @override
  String playingSoundscape(String label) {
    return 'Jugando: $label';
  }

  @override
  String stepProgress(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get previous => 'Anterior';

  @override
  String get pause => 'Pausa';

  @override
  String get resume => 'Reanudar';

  @override
  String get next => 'Próximo';

  @override
  String get defaultStretchTip =>
      'Consejo: exhale mientras se estira. Nunca fuerces el dolor.';

  @override
  String get niceWork => '¡Buen trabajo!';

  @override
  String get sessionCompleteMessage =>
      'Tu cuerpo te lo agradece. Mantén la racha mañana.';

  @override
  String get statMinutes => 'Minutos';

  @override
  String get statMobilityPts => 'Ptos de movilidad';

  @override
  String get statStreak => 'Racha';

  @override
  String statStreakValue(int days) {
    return '${days}d';
  }

  @override
  String get upsellMoodSoundsTitle =>
      'Desbloquea sonidos ambientales y planes de IA';

  @override
  String get upsellMoodSoundsSubtitle =>
      'Pro adapta el audio ambiental a cómo te sientes y crea tu plan de recuperación diario completo.';

  @override
  String get backToHome => 'Volver a Inicio';

  @override
  String get howDoYouFeel => '¿Cómo te sientes?';

  @override
  String get painNowTitle => '¿Cómo está tu dolor ahora?';

  @override
  String get painNowSubtitle =>
      'Esto nos ayuda a personalizar su próxima sesión.';

  @override
  String get thanksAdjustPlan => '¡Gracias! Ajustaremos tu plan.';

  @override
  String get workPatternTitle => 'Tu patrón de trabajo';

  @override
  String get workPatternSubtitle =>
      'Esto nos ayuda a programar descansos cuando más los necesita.';

  @override
  String get whatShouldWeCallYou => '¿Cómo deberíamos llamarte?';

  @override
  String get firstNameHint => 'Nombre de pila';

  @override
  String get hoursSittingPerDay => 'Horas sentado al día';

  @override
  String get bestBreakTimes => '¿Los mejores tiempos de descanso?';

  @override
  String get workPatternValidationAll =>
      'Agregue su nombre, horario de atención y tiempo de descanso';

  @override
  String get workPatternValidationHours =>
      'Seleccione horas de descanso y al menos un tiempo de descanso.';

  @override
  String get stayOnTrackTitle => 'Mantente en el camino';

  @override
  String get stayOnTrackSubtitle =>
      'Los recordatorios inteligentes te avisan en el momento adecuado, nunca durante las reuniones.';

  @override
  String get notificationBenefitBreaks =>
      'Recordatorios de descanso durante el horario laboral';

  @override
  String get notificationBenefitSlump => 'Alertas de caída a las 3 p.m.';

  @override
  String get notificationBenefitStreak => 'Empujes de protección contra rayas';

  @override
  String get enableNotifications => 'Habilitar notificaciones';

  @override
  String get maybeLater => 'tal vez más tarde';

  @override
  String get mobilityAssessmentTitle => 'Evaluación de movilidad';

  @override
  String get analyzingPosture => 'Analizando la postura...';

  @override
  String get mobilityScoreTitle => 'Puntuación de movilidad';

  @override
  String get scanningInstructions =>
      'Párese en la vista de perfil. Mantenga todo su cuerpo encuadrado.';

  @override
  String get scanPrivacyNote =>
      'Usaremos su cámara para medir la alineación de la postura. El procesamiento se realiza en su dispositivo para garantizar la privacidad.';

  @override
  String scanProgress(int percent) {
    return '$percent% completado';
  }

  @override
  String get scanningEllipsis => 'Exploración...';

  @override
  String get startScan => 'Iniciar escaneo';

  @override
  String get skipForNow => 'Saltar por ahora';

  @override
  String get alignShouldersGuide => 'Alinear los hombros con la guía';

  @override
  String get yourMobilityScore => 'Tu puntuación de movilidad';

  @override
  String get scoreBasedOnScan =>
      'Basado en su escaneo de postura y áreas de dolor';

  @override
  String get seeMyPlan => 'Ver mi plan';

  @override
  String potentialGain(int gain) {
    return '+$gain';
  }

  @override
  String get yourPlanAppBar => 'Tu Plan';

  @override
  String get personalizedForYou => 'Personalizado para ti';

  @override
  String get planSubtitleDefault =>
      '3 sesiones diarias adaptadas a trabajadores de escritorio.';

  @override
  String planSubtitleFocused(String areas) {
    return 'Centrado en $areas con sincronización de descanso inteligente.';
  }

  @override
  String get startMyPlan => 'Iniciar mi plan';

  @override
  String sessionDurationMin(int minutes) {
    return '$minutes min';
  }

  @override
  String dayCheckIn(int day) {
    return 'Día $day llegada';
  }

  @override
  String get howDoesBodyFeelToday => '¿Cómo se siente tu cuerpo hoy?';

  @override
  String get checkInHelpsPickRoutine =>
      'Esto nos ayuda a elegir la rutina adecuada para usted.';

  @override
  String get overallPainLevel => 'Nivel general de dolor';

  @override
  String get troubleAreasToday => 'Áreas problemáticas hoy';

  @override
  String get troubleAreaEyes => 'Ojos';

  @override
  String get continueToTodaysSession => 'Continuar con la sesión de hoy.';

  @override
  String get proLockPremiumProgramFeature => 'programa premium';

  @override
  String get proLockPremiumProgramBenefit =>
      'Este programa de escritorio es parte de la biblioteca Pro. Más de 50 sesiones específicas para cuello, espalda, caderas y más.';

  @override
  String get defaultSessionTitle => 'descanso en el escritorio';

  @override
  String get defaultSessionSubtitle => 'Restablecimiento rápido de movilidad';

  @override
  String get beforeWeStart => 'Antes de comenzar';

  @override
  String get howDoesBodyFeel => '¿Cómo se siente tu cuerpo?';

  @override
  String get painScaleGreat => 'Excelente';

  @override
  String get painScaleSore => 'Doloroso';

  @override
  String get startSession => 'Iniciar sesión';

  @override
  String get skipCheckIn => 'Saltar el check-in';

  @override
  String get smartBreakPromptTitle => 'Descanso inteligente';

  @override
  String smartBreakAiMessage(String issue) {
    return 'AI eligió esta pausa para tu $issue. Llevas sentado 47 min. 90 segundos ayudarán.';
  }

  @override
  String get smartBreakProMessage =>
      'Descanso inteligente profesional: tu cuello necesita un reinicio después de 47 minutos de estar sentado.';

  @override
  String get smartBreakFreeMessage =>
      'Llevas sentado 47 min. A tu cuello le vendría bien un reinicio de 90 segundos.';

  @override
  String get start90SecBreak => 'Iniciar descanso de 90 segundos';

  @override
  String get snooze15Min => 'Dormir 15 min';

  @override
  String get achievementUnlocked => 'Logro desbloqueado';

  @override
  String get milestoneReachedFallback => '¡Hito alcanzado!';

  @override
  String daysStrong(int days) {
    return '$days días fuertes';
  }

  @override
  String get unlockProFreeTrial => 'Desbloquear prueba gratuita Pro';

  @override
  String get continueToHome => 'Continuar a Inicio';

  @override
  String get keepGoing => 'Sigue adelante';

  @override
  String get milestoneMessageDay3 =>
      'Tres días seguidos. Los pequeños descansos se van sumando.';

  @override
  String get milestoneMessageDay7 =>
      'Una semana completa de presentarte por tu cuerpo.';

  @override
  String get milestoneMessageDay14 =>
      'Dos semanas de constancia: tu movilidad está mejorando.';

  @override
  String get milestoneMessageDay30 =>
      'Treinta días. Construiste un verdadero hábito de recuperación de escritorio.';

  @override
  String get milestoneMessageDefault =>
      'Sigue apareciendo. Tu cuerpo está cambiando.';

  @override
  String weekRecapTitle(int week) {
    return 'Resumen de la semana $week';
  }

  @override
  String get yourWeekInReview => 'Tu semana en repaso';

  @override
  String get weekRecapSubtitle =>
      'Los pequeños descansos se suman. Aquí está tu progreso.';

  @override
  String get recapSessions => 'Sesiones';

  @override
  String get recapStreak => 'Racha';

  @override
  String get recapMinutes => 'Minutos';

  @override
  String get aiWeeklyInsightTitle => 'Información semanal de IA';

  @override
  String get aiInsightEmpty =>
      'Complete sesiones para obtener información sobre IA.';

  @override
  String get unlockAiWeeklyInsights =>
      'Desbloquee información semanal de IA con Pro';

  @override
  String get weMissYou => '¡Te echamos de menos!';

  @override
  String get reEngagementBody =>
      'Tu cuello y espalda no se toman días libres. Un descanso de 90 segundos es suficiente para volver a la normalidad.';

  @override
  String get quickComebackSession => 'Sesión de regreso rápido';

  @override
  String get comebackSessionDetails => 'Alivio del cuello · 3 min · Sin equipo';

  @override
  String get do3MinComeback => 'Haz un regreso de 3 minutos';

  @override
  String get remindMeTomorrow => 'recuérdamelo mañana';

  @override
  String get journeyMapTitle => 'Viaje de 30 días';

  @override
  String dayOf30(int day) {
    return 'Día $day de 30';
  }

  @override
  String get achievementsTitle => 'Logros';

  @override
  String achievementsUnlockedCount(int unlocked, int total) {
    return '$unlocked / $total desbloqueado';
  }

  @override
  String achievementUnlockDay(int day) {
    return 'Día $day';
  }

  @override
  String get remindersTitle => 'Recordatorios';

  @override
  String get breakFrequency => 'Frecuencia de rotura';

  @override
  String breakFrequencyMin(int minutes) {
    return '$minutes min';
  }

  @override
  String get activeHours => 'Horas activas';

  @override
  String get smartRemindersSubtitle =>
      'Saltarse reuniones, adaptarse a la actividad';

  @override
  String get calmCalibratePro => 'CalmaCalibrar Pro';

  @override
  String get fullDeskRecoverySystem =>
      'Sistema completo de recuperación de escritorio';

  @override
  String get unlockFullRecovery => 'Desbloquear la recuperación completa';

  @override
  String get paywallTagline =>
      'Descansos de 90 segundos que realmente funcionan en tu escritorio.';

  @override
  String get startFreeTrial => 'Iniciar prueba gratuita';

  @override
  String get cancelTrial => 'Cancelar prueba';

  @override
  String get trialDisclaimer =>
      'Prueba gratuita de 7 días · Cancela en cualquier momento';

  @override
  String get welcomeProTrialStarted =>
      '¡Bienvenido a Pro! Comenzó la prueba gratuita de 7 días.';

  @override
  String get aiDailyPlanComingSoon => 'Plan diario de IA próximamente';

  @override
  String get generateAiPlanToday => 'Genera un plan de IA para hoy';

  @override
  String aiFocus(String focus) {
    return 'Enfoque de IA: $focus';
  }

  @override
  String get planSlotMorning => 'Mañana';

  @override
  String get planSlotMidday => 'Mediodía';

  @override
  String get planSlotEvening => 'Noche';

  @override
  String get aiDailyPlanLockedTeaser =>
      'Ventaja: la IA crea tu plan de mañana, mediodía y noche';

  @override
  String get howAreYouFeeling => '¿Cómo te sientes?';

  @override
  String get moodSoundPremiumHint =>
      'Reproduciremos un paisaje sonoro coincidente durante tu sesión.';

  @override
  String get moodSoundFreeHint =>
      'Pro desbloquea audio ambiental adaptado al estado de ánimo';

  @override
  String get proLockMoodFeature => 'Paisajes sonoros del estado de ánimo';

  @override
  String get moodSoundLockedTeaser =>
      'Ventaja: paisajes sonoros adaptados a tu estado de ánimo';

  @override
  String featureComingSoon(String feature) {
    return '$feature próximamente';
  }

  @override
  String get aiNotConnectedYet =>
      'La IA aún no está conectada. Esto utilizará un LLM sin servidor cuando esté listo. No es necesario iniciar sesión.';

  @override
  String get sessionMorningResetTitle => 'Reinicio matutino';

  @override
  String get sessionMorningResetSubtitle => 'Despierta tu columna';

  @override
  String get sessionMiddayBreakTitle =>
      'Descanso en el escritorio del mediodía';

  @override
  String get sessionMiddayBreakSubtitle => 'Combatir las agujetas de la tarde';

  @override
  String get sessionEveningRecoveryTitle => 'Recuperación profunda nocturna';

  @override
  String get sessionEveningRecoverySubtitle => 'Libera la tensión del día';

  @override
  String get sessionNeckReliefTitle => 'Alivio del cuello';

  @override
  String get sessionNeckReliefSubtitle =>
      'Corrección de la postura de la cabeza hacia adelante';

  @override
  String get sessionBackSaverTitle => 'Ahorrador de espalda';

  @override
  String get sessionBackSaverSubtitle => 'Descompresión de la espalda baja';

  @override
  String get sessionUpperBackReliefTitle =>
      'Alivio de la parte superior de la espalda';

  @override
  String get sessionUpperBackReliefSubtitle =>
      'Liberación torácica y de trampa';

  @override
  String get sessionHipOpenerTitle => 'Abridor de cadera';

  @override
  String get sessionHipOpenerSubtitle => 'Flexores de cadera tensos';

  @override
  String get sessionEyeResetTitle => 'Restablecer ojos';

  @override
  String get sessionEyeResetSubtitle => 'Alivio de tensión de la pantalla';

  @override
  String get sessionShoulderMeltTitle => 'Derretimiento del hombro';

  @override
  String get sessionShoulderMeltSubtitle => 'Liberación de trampa superior';

  @override
  String get stepNeckRollsName => 'Rollos de cuello';

  @override
  String get stepNeckRollsInstruction =>
      'Gire lentamente el cuello en círculo. Respira profundamente.';

  @override
  String get stepNeckRollsTip => 'Muévete lentamente. Sin sacudidas.';

  @override
  String get stepShoulderShrugsName => 'Encogimiento de hombros';

  @override
  String get stepShoulderShrugsInstruction =>
      'Levante los hombros hasta las orejas, mantenga presionado durante 3 segundos y suelte.';

  @override
  String get stepShoulderShrugsTip =>
      'Manténgalo en la parte superior durante 3 segundos.';

  @override
  String get stepSeatedTwistName => 'Giro sentado';

  @override
  String get stepSeatedTwistInstruction =>
      'Gire suavemente hacia la izquierda y hacia la derecha. Mantenga las caderas mirando hacia adelante.';

  @override
  String get stepSeatedTwistTip =>
      'Mantenga las caderas quietas. Gire desde la cintura.';

  @override
  String get stepChestOpenerName => 'Abridor de pecho';

  @override
  String get stepChestOpenerInstruction =>
      'Junte las manos detrás de la espalda. Abre el pecho suavemente.';

  @override
  String get stepChestOpenerTip => 'Apriete los omóplatos.';

  @override
  String get stepNeckSideReleaseName => 'Liberación lateral del cuello';

  @override
  String get stepNeckSideReleaseInstruction =>
      'Incline la oreja hacia el hombro. Mantenga cada lado 20 segundos.';

  @override
  String get stepNeckSideReleaseTip => 'Mantenga el hombro opuesto relajado.';

  @override
  String get stepSeatedCatCowName => 'Vaca Gato Sentado';

  @override
  String get stepSeatedCatCowInstruction =>
      'Arquea y redondea la espalda lentamente con la respiración.';

  @override
  String get stepSeatedCatCowTip =>
      'Sincroniza el movimiento con tu respiración.';

  @override
  String get stepHipFlexorStretchName => 'Estiramiento del flexor de la cadera';

  @override
  String get stepHipFlexorStretchInstruction =>
      'Ponte de pie, da un paso atrás. Inclínese hacia adelante suavemente.';

  @override
  String get stepHipFlexorStretchTip =>
      'Mantenga la rodilla delantera sobre el tobillo.';

  @override
  String get stepStandingBackExtensionName => 'Extensión de espalda de pie';

  @override
  String get stepStandingBackExtensionInstruction =>
      'Manos en la espalda baja. Inclínese ligeramente hacia atrás.';

  @override
  String get stepStandingBackExtensionTip => 'Gama pequeña. Sin forzar.';

  @override
  String get stepThoracicExtensionName => 'Extensión torácica';

  @override
  String get stepThoracicExtensionInstruction =>
      'Manos detrás de la cabeza. Arquee la parte superior del respaldo sobre la silla.';

  @override
  String get stepThoracicExtensionTip =>
      'Lidera con tu pecho, no con tu cuello.';

  @override
  String get stepFigure4StretchName => 'Figura 4 Estiramiento';

  @override
  String get stepFigure4StretchInstruction =>
      'Tobillo sobre la rodilla opuesta. Inclínese hacia adelante suavemente.';

  @override
  String get stepFigure4StretchTip =>
      'Flexionar el pie para proteger la rodilla.';

  @override
  String get stepChildsPoseChairName => 'Postura del niño (silla)';

  @override
  String get stepChildsPoseChairInstruction =>
      'Siéntese, inclínese hacia adelante sobre las rodillas. Respirar.';

  @override
  String get stepChildsPoseChairTip => 'Deja que tu cuello cuelgue pesado.';

  @override
  String get stepDeepBreathingName => 'Respiración profunda';

  @override
  String get stepDeepBreathingInstruction =>
      '4 cuentas adentro, 6 cuentas afuera. Relaja los hombros.';

  @override
  String get stepDeepBreathingTip =>
      'Una exhalación más prolongada calma el sistema nervioso.';

  @override
  String get stepDeskStretchName => 'Estiramiento de escritorio';

  @override
  String get stepDeskStretchInstruction =>
      'Estírese suavemente en su escritorio.';

  @override
  String get stepDeskStretchTip => 'Muévase dentro de un rango cómodo.';

  @override
  String get journeyDay1Title => 'Primera sesión';

  @override
  String get journeyDay1Goal => 'Incorporación completa + 1 descanso';

  @override
  String get journeyDay1Action =>
      'Termine la evaluación del dolor y realice el reinicio matutino';

  @override
  String get journeyDay2Title => 'Desarrolla el hábito';

  @override
  String get journeyDay2Goal => '2 sesiones + check in diario';

  @override
  String get journeyDay2Action =>
      'Registra cómo se siente tu cuello, haz un descanso en el escritorio del mediodía';

  @override
  String get journeyDay3Title => 'racha de 3 días';

  @override
  String get journeyDay3Goal => 'Consigue una racha de 3 días';

  @override
  String get journeyDay3Action =>
      'Completa cualquier sesión antes del final del día.';

  @override
  String get journeyDay3Milestone => 'Racha de 3 días';

  @override
  String get journeyDay4Title => 'Caída de la tarde';

  @override
  String get journeyDay4Goal => 'Prueba Smart Break a las 3 p.m.';

  @override
  String get journeyDay4Action => 'Responder al mensaje de pausa inteligente';

  @override
  String get journeyDay5Title => 'Explorar biblioteca';

  @override
  String get journeyDay5Goal =>
      'Pruebe un nuevo programa para el área del dolor';

  @override
  String get journeyDay5Action => 'Abra Sesiones y elija Alivio del Cuello';

  @override
  String get journeyDay6Title => 'Preparación para el fin de semana';

  @override
  String get journeyDay6Goal => 'Establecer horario de recordatorio';

  @override
  String get journeyDay6Action => 'Revisar la configuración del recordatorio';

  @override
  String get journeyDay7Title => 'Resumen de la semana 1';

  @override
  String get journeyDay7Goal => 'Revisar el progreso semanal';

  @override
  String get journeyDay7Action =>
      'Abra el resumen semanal y vea el cambio en la puntuación de movilidad';

  @override
  String get journeyDay7Milestone => 'Semana 1 completa';

  @override
  String get journeyDay8Title => 'Recuperación más profunda';

  @override
  String get journeyDay8Goal => 'Recuperación profunda nocturna completa';

  @override
  String get journeyDay8Action =>
      'Sesión nocturna de 12 min antes de acostarse.';

  @override
  String get journeyDay10Title => 'Verificación de progreso';

  @override
  String get journeyDay10Goal => 'Revisa tus estadísticas semanales';

  @override
  String get journeyDay10Action =>
      'Vea sesiones y tendencias de dolor en Progress';

  @override
  String get journeyDay14Title => 'hito de 2 semanas';

  @override
  String get journeyDay14Goal => 'Racha de 14 días o más de 10 sesiones';

  @override
  String get journeyDay14Action => 'Desbloquear insignia de logro';

  @override
  String get journeyDay14Milestone => 'Guerrero de 2 semanas';

  @override
  String get journeyDay15Title => 'Punto medio';

  @override
  String get journeyDay15Goal => 'Revisar el mapa de viaje';

  @override
  String get journeyDay15Action =>
      'Ver el progreso del día 1 al 30 en el mapa del viaje';

  @override
  String get journeyDay21Title => 'Resumen de la semana 3';

  @override
  String get journeyDay21Goal => 'Resumen semanal + compartir progreso';

  @override
  String get journeyDay21Action =>
      'Revisar la tendencia de movilidad de 3 semanas';

  @override
  String get journeyDay30Title => 'graduado de 30 días';

  @override
  String get journeyDay30Goal => 'Programa completo de 30 días.';

  @override
  String get journeyDay30Action =>
      'Evaluación final + desbloqueo de prueba premium';

  @override
  String get journeyDay30Milestone => 'Graduado de 30 días';

  @override
  String get journeyDayDefaultTitle => 'Descanso diario en el escritorio';

  @override
  String get journeyDayDefaultGoal => 'Completa al menos una sesión.';

  @override
  String get journeyDayDefaultAction =>
      'Haz una pausa de movilidad de 3 a 5 minutos en tu escritorio';

  @override
  String get achievementFirstBreakTitle => 'Primer descanso';

  @override
  String get achievementFirstBreakDesc =>
      'Completó su primera sesión de escritorio';

  @override
  String get achievementStreak3Title => 'Racha de 3 días';

  @override
  String get achievementStreak3Desc => 'Se mudó 3 días seguidos';

  @override
  String get achievementWeek1Title => 'Semana 1 completa';

  @override
  String get achievementWeek1Desc => 'Terminaste tu primera semana';

  @override
  String get achievementStreak14Title => 'Guerrero de 2 semanas';

  @override
  String get achievementStreak14Desc => '14 días de recuperación de escritorio';

  @override
  String get achievementScore60Title => 'Movilidad 60+';

  @override
  String get achievementScore60Desc => 'La puntuación de movilidad alcanzó 60';

  @override
  String get achievementGraduate30Title => 'Graduado de 30 días';

  @override
  String get achievementGraduate30Desc => 'Completado el programa completo';

  @override
  String get moodStressed => 'Estresado';

  @override
  String get moodStressedSoundscape => 'Ambiente de respiración profunda';

  @override
  String get moodStressedDesc =>
      'Tonos de exhalación lenta para calmar tu sistema nervioso.';

  @override
  String get moodTired => 'Cansado';

  @override
  String get moodTiredSoundscape => 'lluvia suave';

  @override
  String get moodTiredDesc => 'Lluvias suaves para aliviar la fatiga mental';

  @override
  String get moodSore => 'Doloroso';

  @override
  String get moodSoreSoundscape => 'Tonos bajos cálidos';

  @override
  String get moodSoreDesc => 'Frecuencias relajantes para músculos tensos';

  @override
  String get moodFocused => 'enfocado';

  @override
  String get moodFocusedSoundscape => 'Panel de enfoque mínimo';

  @override
  String get moodFocusedDesc =>
      'Ritmo ligero para estar presente durante los estiramientos.';

  @override
  String get moodCalm => 'Calma';

  @override
  String get moodCalmSoundscape => 'escritorio zen';

  @override
  String get moodCalmDesc => 'Fondo tranquilo para la oficina.';

  @override
  String get proLockCtaDefault => 'Comience la prueba gratuita de 7 días';

  @override
  String get upsellDefaultTitle => '¿Quieres más de cada descanso?';

  @override
  String get upsellDefaultSubtitle =>
      'Desbloquee planes de IA, paisajes sonoros del estado de ánimo, escaneo de postura y más de 50 programas.';

  @override
  String get proFeature50Programs => 'Más de 50 programas';

  @override
  String get proFeature50ProgramsSub => 'Biblioteca de escritorio completa';

  @override
  String get proFeatureAiPosture => 'Postura de la IA';

  @override
  String get proFeatureAiPostureSub => 'Escanear y rastrear';

  @override
  String get proFeatureAiDailyPlan => 'Plan diario de IA';

  @override
  String get proFeatureAiDailyPlanSub => 'Personalizado';

  @override
  String get proFeatureSmartBreaks => 'Descansos inteligentes';

  @override
  String get proFeatureSmartBreaksSub => 'Recordatorios programados';

  @override
  String get proFeatureWeeklyReport => 'Informe Semanal';

  @override
  String get proFeatureWeeklyReportSub => 'Progreso de la IA';

  @override
  String get proFeatureMoodSounds => 'Sonidos de humor';

  @override
  String get proFeatureMoodSoundsSub => 'Audio ambiental';

  @override
  String get proFeatureDesktopApp => 'Aplicación de escritorio';

  @override
  String get proFeatureDesktopAppSub => 'Muy pronto';

  @override
  String get comingSoonBadge => 'Pronto';

  @override
  String get desktopCompanionComingSoon =>
      '¡Próximamente el compañero de escritorio!';

  @override
  String get aiPlanBelowHint =>
      'Su plan de IA se encuentra a continuación en las sesiones de hoy';

  @override
  String get cancelProTrialTitle => '¿Cancelar la prueba Pro?';

  @override
  String get cancelProTrialBody =>
      'Perderás el acceso a los planes de IA, al análisis de postura y a la biblioteca completa de ejercicios. Tu progreso y tu racha permanecen guardados.';

  @override
  String get keepPro => 'Manténgase profesional';

  @override
  String get proTrialCancelled =>
      'Prueba profesional cancelada. Estás en el plan gratuito.';
}
