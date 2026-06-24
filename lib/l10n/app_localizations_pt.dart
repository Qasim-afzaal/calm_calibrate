// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'CalmaCalibrar';

  @override
  String get navHome => 'Lar';

  @override
  String get navProgress => 'Progresso';

  @override
  String get navSessions => 'Sessões';

  @override
  String get navProfile => 'Perfil';

  @override
  String get continueButton => 'Continuar';

  @override
  String get getStarted => 'Comece';

  @override
  String get back => 'Voltar';

  @override
  String get done => 'Feito';

  @override
  String get skip => 'Pular';

  @override
  String get close => 'Fechar';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get welcomeTitle => 'Mova-se melhor\nno trabalho';

  @override
  String get welcomeSubtitle =>
      'Alivie a rigidez, corrija a postura e sinta-se energizado com intervalos de 90 segundos na mesa feitos para você.';

  @override
  String get painSelectorTitle => 'Onde sentar dói?';

  @override
  String get goalsRemindersTitle => 'Metas e lembretes';

  @override
  String get goalsRemindersSubtitle =>
      'Iremos cutucá-lo na hora certa, nunca durante reuniões.';

  @override
  String get yourGoals => 'Seus objetivos';

  @override
  String get reminderFrequency => 'Frequência do lembrete';

  @override
  String reminderMinutesLabel(int minutes) {
    return '$minutes minutos';
  }

  @override
  String get smartReminders => 'Lembretes inteligentes';

  @override
  String get smartRemindersHint =>
      'Ignore os toques quando estiver em uma reunião ou chamada.';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get appearance => 'Aparência';

  @override
  String get appearanceHint =>
      'Escolha a aparência do CalmCalibrate neste dispositivo.';

  @override
  String get language => 'Linguagem';

  @override
  String get languageHint => 'Idioma de exibição do aplicativo';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get themeLight => 'Luz';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get reminders => 'Lembretes';

  @override
  String remindersEveryMinutes(int minutes) {
    return 'A cada $minutes min';
  }

  @override
  String get journeyTitle => 'Jornada de 30 dias';

  @override
  String get journeySubtitle => 'Veja seu programa completo';

  @override
  String get achievements => 'Conquistas';

  @override
  String get achievementsSubtitle => 'Selos e marcos';

  @override
  String get retakeAssessment => 'Refazer avaliação';

  @override
  String get retakeAssessmentSubtitle => 'Atualize sua pontuação de mobilidade';

  @override
  String get proSubscription => 'Assinatura profissional';

  @override
  String get upgradeToPro => 'Atualizar para Pro';

  @override
  String get proBenefitsSubtitle =>
      'Planos de IA, verificação de postura e biblioteca completa';

  @override
  String trialDaysLeft(int count) {
    return '$count dias de teste restantes';
  }

  @override
  String get viewProBenefits => 'Veja os benefícios do Pro';

  @override
  String get cancelFreeTrial => 'Cancelar teste gratuito';

  @override
  String get returnToFreePlan => 'Voltar ao plano gratuito';

  @override
  String get painNeck => 'Pescoço';

  @override
  String get painShoulders => 'Ombros';

  @override
  String get painUpperBack => 'Parte superior das costas';

  @override
  String get painLowerBack => 'Parte inferior das costas';

  @override
  String get painHips => 'Quadris';

  @override
  String get breakMorning => 'Manhã';

  @override
  String get breakLunch => 'Almoço';

  @override
  String get breakAfternoon => 'Tarde';

  @override
  String get breakEvening => 'Noite';

  @override
  String get goalReduceNeckPain => 'Reduzir a dor no pescoço';

  @override
  String get goalFixPosture => 'Corrigir postura';

  @override
  String get goalMoreEnergy => 'Mais energia';

  @override
  String get goalPreventInjury => 'Prevenir lesões';

  @override
  String get sittingFourToSix => '4 a 6 horas';

  @override
  String get sittingSixToEight => '6 a 8 horas';

  @override
  String get sittingEightPlus => '8 horas ou mais';

  @override
  String get hours => 'horas';

  @override
  String get localeEnglish => 'Inglês';

  @override
  String get localeUrdu => 'urdu';

  @override
  String get localeHindi => 'hindi';

  @override
  String get localeBengali => 'bengali';

  @override
  String get localeSpanish => 'Espanhol';

  @override
  String get localeFrench => 'Francês';

  @override
  String get localeArabic => 'árabe';

  @override
  String get localePortuguese => 'Português';

  @override
  String get localeGerman => 'Alemão';

  @override
  String get greetingMorning => 'Bom dia';

  @override
  String get greetingAfternoon => 'Boa tarde';

  @override
  String get greetingEvening => 'Boa noite';

  @override
  String get proBadge => 'PRÓ';

  @override
  String get aiBadge => 'IA';

  @override
  String postureScoreLabel(int score) {
    return 'Postura $score/100';
  }

  @override
  String trialDaysShort(int days) {
    return '$days d teste';
  }

  @override
  String get journeyDefaultGoal => 'Mantenha-se consistente';

  @override
  String get journeyDefaultAction => 'Conclua uma pausa na mesa hoje';

  @override
  String aiPickedForIssue(String issue) {
    return 'IA escolhida para seu $issue';
  }

  @override
  String get proLockSmartBreakFeature => 'Lembretes de intervalo inteligente';

  @override
  String get proLockSmartBreakBenefit =>
      'Tempos profissionais quebram sua postura e padrão de assento. A IA escolhe a redefinição certa de 90 segundos quando você precisa.';

  @override
  String get yourProFeatures => 'Seus recursos profissionais';

  @override
  String get proLockExtraSessionsFeature => 'Sessões diárias extras';

  @override
  String get proLockExtraSessionsBenefit =>
      'O plano gratuito inclui 1 sessão por dia. O Pro desbloqueia seu plano completo de IA: intervalos da manhã, do meio-dia e da noite.';

  @override
  String get todaysAiPlan => 'O plano de IA de hoje';

  @override
  String get todaysSessions => 'Sessões de hoje';

  @override
  String get browseProgramsTitle => 'Navegue por mais de 50 programas';

  @override
  String get browseProgramsSubtitle =>
      'Pescoço, costas, quadris e muito mais. Tudo desbloqueado';

  @override
  String get unlockProTitle => 'Desbloquear profissional';

  @override
  String get unlockProSubtitle =>
      'Postura de IA · sons de humor · mais de 50 programas';

  @override
  String get checkInBannerTitle => 'Check-in diário';

  @override
  String get checkInBannerSubtitle => 'Como está seu corpo hoje?';

  @override
  String get smartBreakTitle => 'Pausa Inteligente';

  @override
  String smartBreakNextIn(int minutes) {
    return 'Próximo intervalo em ~$minutes min';
  }

  @override
  String get smartBreakPremiumHint =>
      'Cronometrado de acordo com sua postura e padrão de assento';

  @override
  String get smartBreakFreeHint => 'Com base no seu padrão de sentar';

  @override
  String get journeyCardTodaysGoal => 'O objetivo de hoje';

  @override
  String get journeyCardDayLabel => 'DIA';

  @override
  String journeyCardStreak(int days) {
    return 'Sequência de $days dias';
  }

  @override
  String streakBadgeFull(int days) {
    return 'Sequência de $days dias';
  }

  @override
  String get noProgressDataYet => 'Ainda não há dados de progresso';

  @override
  String get weeklyProgressTitle => 'Progresso Semanal';

  @override
  String get weeklyProgressEmptyHint =>
      'Conclua sua primeira sessão para iniciar o rastreamento.';

  @override
  String weeklyProgressSummary(int sessions, int minutes) {
    return '$sessions sessões · $minutes min total';
  }

  @override
  String weeklyProgressAvgRelief(int relief) {
    return 'alívio médio +$relief';
  }

  @override
  String get beforeLabel => 'Antes';

  @override
  String get nowLabel => 'Agora';

  @override
  String get areaImprovementsTitle => 'Melhorias de área';

  @override
  String improvementPercent(int percent) {
    return '+$percent%';
  }

  @override
  String get sessionsTitle => 'Sessões';

  @override
  String get sessionsSubtitlePro =>
      'Biblioteca Pro desbloqueada · programas por área';

  @override
  String get sessionsSubtitleFree => 'Programas por área de dor na sua mesa';

  @override
  String get filterAll => 'Todos';

  @override
  String get todaysPlan => 'O plano de hoje';

  @override
  String get allPrograms => 'Todos os programas';

  @override
  String playingSoundscape(String label) {
    return 'Jogando: $label';
  }

  @override
  String stepProgress(int current, int total) {
    return 'Etapa $current de $total';
  }

  @override
  String get previous => 'Anterior';

  @override
  String get pause => 'Pausa';

  @override
  String get resume => 'Retomar';

  @override
  String get next => 'Próximo';

  @override
  String get defaultStretchTip =>
      'Dica: expire enquanto se alonga. Nunca force a dor.';

  @override
  String get niceWork => 'Bom trabalho!';

  @override
  String get sessionCompleteMessage =>
      'Seu corpo agradece. Mantenha a sequência amanhã.';

  @override
  String get statMinutes => 'Minutos';

  @override
  String get statMobilityPts => 'Pontos de mobilidade';

  @override
  String get statStreak => 'Onda';

  @override
  String statStreakValue(int days) {
    return '${days}d';
  }

  @override
  String get upsellMoodSoundsTitle =>
      'Desbloqueie sons de humor e planos de IA';

  @override
  String get upsellMoodSoundsSubtitle =>
      'O Pro combina o áudio ambiente com o que você sente e cria seu plano de recuperação diário completo.';

  @override
  String get backToHome => 'De volta para casa';

  @override
  String get howDoYouFeel => 'Como você está se sentindo?';

  @override
  String get painNowTitle => 'Como está sua dor agora?';

  @override
  String get painNowSubtitle =>
      'Isso nos ajuda a personalizar sua próxima sessão.';

  @override
  String get thanksAdjustPlan => 'Obrigado! Ajustaremos seu plano.';

  @override
  String get workPatternTitle => 'Seu padrão de trabalho';

  @override
  String get workPatternSubtitle =>
      'Isso nos ajuda a agendar intervalos quando você mais precisa deles.';

  @override
  String get whatShouldWeCallYou => 'Como devemos chamá-lo?';

  @override
  String get firstNameHint => 'Primeiro nome';

  @override
  String get hoursSittingPerDay => 'Horas sentado por dia';

  @override
  String get bestBreakTimes => 'Melhores horários de descanso?';

  @override
  String get workPatternValidationAll =>
      'Adicione seu nome, horário de sessão e intervalo';

  @override
  String get workPatternValidationHours =>
      'Selecione horas de sessão e pelo menos um intervalo';

  @override
  String get stayOnTrackTitle => 'Fique no caminho certo';

  @override
  String get stayOnTrackSubtitle =>
      'Lembretes inteligentes avisam você na hora certa, nunca durante reuniões.';

  @override
  String get notificationBenefitBreaks =>
      'Quebre lembretes durante o horário de trabalho';

  @override
  String get notificationBenefitSlump => 'Alertas de queda às 15h';

  @override
  String get notificationBenefitStreak => 'Cutucas de proteção contra riscos';

  @override
  String get enableNotifications => 'Habilitar notificações';

  @override
  String get maybeLater => 'Talvez mais tarde';

  @override
  String get mobilityAssessmentTitle => 'Avaliação de mobilidade';

  @override
  String get analyzingPosture => 'Analisando a postura...';

  @override
  String get mobilityScoreTitle => 'Pontuação de mobilidade';

  @override
  String get scanningInstructions =>
      'Fique na vista de perfil. Mantenha todo o seu corpo enquadrado.';

  @override
  String get scanPrivacyNote =>
      'Usaremos sua câmera para medir o alinhamento da postura. O processamento acontece no seu dispositivo para fins de privacidade.';

  @override
  String scanProgress(int percent) {
    return '$percent% concluído';
  }

  @override
  String get scanningEllipsis => 'Digitalizando...';

  @override
  String get startScan => 'Iniciar verificação';

  @override
  String get skipForNow => 'Pular por enquanto';

  @override
  String get alignShouldersGuide => 'Alinhe os ombros com guia';

  @override
  String get yourMobilityScore => 'Sua pontuação de mobilidade';

  @override
  String get scoreBasedOnScan =>
      'Com base na sua varredura de postura e áreas de dor';

  @override
  String get seeMyPlan => 'Veja meu plano';

  @override
  String potentialGain(int gain) {
    return '+$gain';
  }

  @override
  String get yourPlanAppBar => 'Seu plano';

  @override
  String get personalizedForYou => 'Personalizado para você';

  @override
  String get planSubtitleDefault =>
      '3 sessões diárias adaptadas aos trabalhadores de escritório.';

  @override
  String planSubtitleFocused(String areas) {
    return 'Focado em $areas com tempo de intervalo inteligente.';
  }

  @override
  String get startMyPlan => 'Iniciar meu plano';

  @override
  String sessionDurationMin(int minutes) {
    return '$minutes minutos';
  }

  @override
  String dayCheckIn(int day) {
    return 'Dia $day check-in';
  }

  @override
  String get howDoesBodyFeelToday => 'Como está seu corpo hoje?';

  @override
  String get checkInHelpsPickRoutine =>
      'Isso nos ajuda a escolher a rotina certa para você.';

  @override
  String get overallPainLevel => 'Nível geral de dor';

  @override
  String get troubleAreasToday => 'Áreas problemáticas hoje';

  @override
  String get troubleAreaEyes => 'Olhos';

  @override
  String get continueToTodaysSession => 'Continuar para a sessão de hoje';

  @override
  String get proLockPremiumProgramFeature => 'Programa premium';

  @override
  String get proLockPremiumProgramBenefit =>
      'Este programa de mesa faz parte da biblioteca Pro. Mais de 50 sessões direcionadas para pescoço, costas, quadris e muito mais.';

  @override
  String get defaultSessionTitle => 'Pausa na mesa';

  @override
  String get defaultSessionSubtitle => 'Reinicialização rápida da mobilidade';

  @override
  String get beforeWeStart => 'Antes de começarmos';

  @override
  String get howDoesBodyFeel => 'Como está seu corpo?';

  @override
  String get painScaleGreat => 'Ótimo';

  @override
  String get painScaleSore => 'Dolorido';

  @override
  String get startSession => 'Iniciar sessão';

  @override
  String get skipCheckIn => 'Pular check-in';

  @override
  String get smartBreakPromptTitle => 'Pausa Inteligente';

  @override
  String smartBreakAiMessage(String issue) {
    return 'AI escolheu esta pausa para o seu $issue. Você está sentado há 47 minutos. 90 segundos vão ajudar.';
  }

  @override
  String get smartBreakProMessage =>
      'Pausa profissional inteligente: seu pescoço precisa de uma reinicialização após 47 minutos sentado.';

  @override
  String get smartBreakFreeMessage =>
      'Você está sentado há 47 minutos. Seu pescoço precisa de uma reinicialização de 90 segundos.';

  @override
  String get start90SecBreak => 'Comece um intervalo de 90 segundos';

  @override
  String get snooze15Min => 'Soneca 15 minutos';

  @override
  String get achievementUnlocked => 'Conquista desbloqueada';

  @override
  String get milestoneReachedFallback => 'Marco alcançado!';

  @override
  String daysStrong(int days) {
    return '$days dias fortes';
  }

  @override
  String get unlockProFreeTrial => 'Desbloquear teste gratuito Pro';

  @override
  String get continueToHome => 'Continuar para casa';

  @override
  String get keepGoing => 'Continue';

  @override
  String get milestoneMessageDay3 =>
      'Três dias seguidos. Pequenas pausas estão aumentando.';

  @override
  String get milestoneMessageDay7 => 'Uma semana inteira mostrando seu corpo.';

  @override
  String get milestoneMessageDay14 =>
      'Duas semanas de consistência – sua mobilidade está melhorando.';

  @override
  String get milestoneMessageDay30 =>
      'Trinta dias. Você construiu um verdadeiro hábito de recuperação de mesa.';

  @override
  String get milestoneMessageDefault =>
      'Continue aparecendo. Seu corpo está mudando.';

  @override
  String weekRecapTitle(int week) {
    return 'Recapitulação da semana $week';
  }

  @override
  String get yourWeekInReview => 'Sua semana em análise';

  @override
  String get weekRecapSubtitle =>
      'Pequenas pausas se somam. Aqui está o seu progresso.';

  @override
  String get recapSessions => 'Sessões';

  @override
  String get recapStreak => 'Onda';

  @override
  String get recapMinutes => 'Minutos';

  @override
  String get aiWeeklyInsightTitle => 'Insight semanal de IA';

  @override
  String get aiInsightEmpty => 'Conclua sessões para obter insights de IA.';

  @override
  String get unlockAiWeeklyInsights =>
      'Desbloqueie insights semanais de IA com o Pro';

  @override
  String get weMissYou => 'Que saudades de você!';

  @override
  String get reEngagementBody =>
      'Seu pescoço e costas não tiram dias de folga. Uma pausa de 90 segundos é o suficiente para voltar aos trilhos.';

  @override
  String get quickComebackSession => 'Sessão de retorno rápido';

  @override
  String get comebackSessionDetails =>
      'Alívio do pescoço · 3 min · Sem equipamento';

  @override
  String get do3MinComeback => 'Faça um retorno de 3 minutos';

  @override
  String get remindMeTomorrow => 'Lembre-me amanhã';

  @override
  String get journeyMapTitle => 'Jornada de 30 dias';

  @override
  String dayOf30(int day) {
    return 'Dia $day de 30';
  }

  @override
  String get achievementsTitle => 'Conquistas';

  @override
  String achievementsUnlockedCount(int unlocked, int total) {
    return '$unlocked / $total desbloqueado';
  }

  @override
  String achievementUnlockDay(int day) {
    return 'Dia $day';
  }

  @override
  String get remindersTitle => 'Lembretes';

  @override
  String get breakFrequency => 'Frequência de quebra';

  @override
  String breakFrequencyMin(int minutes) {
    return '$minutes minutos';
  }

  @override
  String get activeHours => 'Horário ativo';

  @override
  String get smartRemindersSubtitle => 'Pule reuniões, adapte-se à atividade';

  @override
  String get calmCalibratePro => 'CalmCalibrate Pro';

  @override
  String get fullDeskRecoverySystem =>
      'Sistema completo de recuperação de mesa';

  @override
  String get unlockFullRecovery => 'Desbloqueie a recuperação completa';

  @override
  String get paywallTagline =>
      'Intervalos de 90 segundos que realmente funcionam na sua mesa.';

  @override
  String get startFreeTrial => 'Comece o teste gratuito';

  @override
  String get cancelTrial => 'Cancelar teste';

  @override
  String get trialDisclaimer =>
      'Teste gratuito de 7 dias · Cancele a qualquer momento';

  @override
  String get welcomeProTrialStarted =>
      'Bem-vindo ao Pró! Teste gratuito de 7 dias iniciado.';

  @override
  String get aiDailyPlanComingSoon => 'Plano diário de IA em breve';

  @override
  String get generateAiPlanToday => 'Gere um plano de IA para hoje';

  @override
  String aiFocus(String focus) {
    return 'Foco de IA: $focus';
  }

  @override
  String get planSlotMorning => 'Manhã';

  @override
  String get planSlotMidday => 'Meio-dia';

  @override
  String get planSlotEvening => 'Noite';

  @override
  String get aiDailyPlanLockedTeaser =>
      'Pró: IA cria seu plano de manhã, meio-dia e noite';

  @override
  String get howAreYouFeeling => 'Como você está se sentindo?';

  @override
  String get moodSoundPremiumHint =>
      'Tocaremos uma paisagem sonora correspondente durante sua sessão';

  @override
  String get moodSoundFreeHint =>
      'Pro desbloqueia áudio ambiente compatível com o humor';

  @override
  String get proLockMoodFeature => 'Paisagens sonoras de humor';

  @override
  String get moodSoundLockedTeaser =>
      'Pró: paisagens sonoras que combinam com o seu humor';

  @override
  String featureComingSoon(String feature) {
    return '$feature em breve';
  }

  @override
  String get aiNotConnectedYet =>
      'A IA ainda não está conectada. Isso usará um LLM sem servidor quando estiver pronto. Não é necessário fazer login.';

  @override
  String get sessionMorningResetTitle => 'Reinicialização matinal';

  @override
  String get sessionMorningResetSubtitle => 'Acorde sua coluna';

  @override
  String get sessionMiddayBreakTitle => 'Pausa na mesa do meio-dia';

  @override
  String get sessionMiddayBreakSubtitle => 'Combate a rigidez da tarde';

  @override
  String get sessionEveningRecoveryTitle => 'Recuperação profunda noturna';

  @override
  String get sessionEveningRecoverySubtitle => 'Libere a tensão do dia';

  @override
  String get sessionNeckReliefTitle => 'Alívio do pescoço';

  @override
  String get sessionNeckReliefSubtitle =>
      'Correção da postura da cabeça para frente';

  @override
  String get sessionBackSaverTitle => 'Protetor traseiro';

  @override
  String get sessionBackSaverSubtitle => 'Descompressão lombar';

  @override
  String get sessionUpperBackReliefTitle =>
      'Alívio da parte superior das costas';

  @override
  String get sessionUpperBackReliefSubtitle => 'Liberação torácica e armadilha';

  @override
  String get sessionHipOpenerTitle => 'Abridor de quadril';

  @override
  String get sessionHipOpenerSubtitle => 'Flexores do quadril tensos';

  @override
  String get sessionEyeResetTitle => 'Redefinição de olho';

  @override
  String get sessionEyeResetSubtitle => 'Alívio de tensão da tela';

  @override
  String get sessionShoulderMeltTitle => 'Derretimento de Ombro';

  @override
  String get sessionShoulderMeltSubtitle => 'Liberação da armadilha superior';

  @override
  String get stepNeckRollsName => 'Rolos de pescoço';

  @override
  String get stepNeckRollsInstruction =>
      'Role lentamente o pescoço em um círculo. Respire profundamente.';

  @override
  String get stepNeckRollsTip => 'Mova-se lentamente. Sem solavancos.';

  @override
  String get stepShoulderShrugsName => 'Encolhimento de ombros';

  @override
  String get stepShoulderShrugsInstruction =>
      'Levante os ombros até as orelhas, segure por 3 segundos e solte.';

  @override
  String get stepShoulderShrugsTip => 'Segure no topo por 3 segundos.';

  @override
  String get stepSeatedTwistName => 'Torção Sentada';

  @override
  String get stepSeatedTwistInstruction =>
      'Gire suavemente para a esquerda e para a direita. Mantenha os quadris voltados para a frente.';

  @override
  String get stepSeatedTwistTip =>
      'Mantenha os quadris imóveis. Torça a partir da cintura.';

  @override
  String get stepChestOpenerName => 'Abridor de baú';

  @override
  String get stepChestOpenerInstruction =>
      'Junte as mãos atrás das costas. Abra o peito suavemente.';

  @override
  String get stepChestOpenerTip => 'Aperte as omoplatas.';

  @override
  String get stepNeckSideReleaseName => 'Liberação lateral do pescoço';

  @override
  String get stepNeckSideReleaseInstruction =>
      'Incline a orelha em direção ao ombro. Segure cada lado por 20 segundos.';

  @override
  String get stepNeckSideReleaseTip => 'Mantenha o ombro oposto relaxado.';

  @override
  String get stepSeatedCatCowName => 'Vaca Gato Sentada';

  @override
  String get stepSeatedCatCowInstruction =>
      'Arqueie e arredonde as costas lentamente com a respiração.';

  @override
  String get stepSeatedCatCowTip => 'Sincronize o movimento com a respiração.';

  @override
  String get stepHipFlexorStretchName => 'Alongamento flexor do quadril';

  @override
  String get stepHipFlexorStretchInstruction =>
      'Fique de pé, dê um passo para trás. Incline-se suavemente para a frente.';

  @override
  String get stepHipFlexorStretchTip =>
      'Mantenha o joelho da frente sobre o tornozelo.';

  @override
  String get stepStandingBackExtensionName => 'Extensão em pé';

  @override
  String get stepStandingBackExtensionInstruction =>
      'Mãos na parte inferior das costas. Incline-se ligeiramente para trás.';

  @override
  String get stepStandingBackExtensionTip => 'Alcance pequeno. Sem forçar.';

  @override
  String get stepThoracicExtensionName => 'Extensão Torácica';

  @override
  String get stepThoracicExtensionInstruction =>
      'Mãos atrás da cabeça. Arqueie a parte superior das costas sobre a cadeira.';

  @override
  String get stepThoracicExtensionTip =>
      'Lidere com o peito, não com o pescoço.';

  @override
  String get stepFigure4StretchName => 'Figura 4 Alongamento';

  @override
  String get stepFigure4StretchInstruction =>
      'Tornozelo no joelho oposto. Incline-se suavemente para a frente.';

  @override
  String get stepFigure4StretchTip => 'Flexione o pé para proteger o joelho.';

  @override
  String get stepChildsPoseChairName => 'Pose de criança (cadeira)';

  @override
  String get stepChildsPoseChairInstruction =>
      'Sente-se e dobre-se para a frente sobre os joelhos. Respirar.';

  @override
  String get stepChildsPoseChairTip => 'Deixe seu pescoço pesado.';

  @override
  String get stepDeepBreathingName => 'Respiração Profunda';

  @override
  String get stepDeepBreathingInstruction =>
      '4 contagens de entrada, 6 contagens de saída. Relaxe os ombros.';

  @override
  String get stepDeepBreathingTip =>
      'Uma expiração mais longa acalma o sistema nervoso.';

  @override
  String get stepDeskStretchName => 'Alongamento de mesa';

  @override
  String get stepDeskStretchInstruction => 'Alongamento suave em sua mesa.';

  @override
  String get stepDeskStretchTip => 'Mova-se dentro de uma faixa confortável.';

  @override
  String get journeyDay1Title => 'Primeira sessão';

  @override
  String get journeyDay1Goal => 'Integração completa + 1 intervalo';

  @override
  String get journeyDay1Action =>
      'Conclua a avaliação da dor e faça o Morning Reset';

  @override
  String get journeyDay2Title => 'Crie o hábito';

  @override
  String get journeyDay2Goal => '2 sessões + check-in diário';

  @override
  String get journeyDay2Action =>
      'Registre como está seu pescoço, faça o Midday Desk Break';

  @override
  String get journeyDay3Title => 'sequência de 3 dias';

  @override
  String get journeyDay3Goal => 'Acerte uma sequência de 3 dias';

  @override
  String get journeyDay3Action =>
      'Conclua qualquer sessão antes do final do dia';

  @override
  String get journeyDay3Milestone => 'Sequência de 3 dias';

  @override
  String get journeyDay4Title => 'Queda da tarde';

  @override
  String get journeyDay4Goal => 'Experimente o Smart Break às 15h';

  @override
  String get journeyDay4Action => 'Responda ao prompt de intervalo inteligente';

  @override
  String get journeyDay5Title => 'Explorar biblioteca';

  @override
  String get journeyDay5Goal =>
      'Experimente um novo programa para áreas de dor';

  @override
  String get journeyDay5Action => 'Abra sessões e escolha Neck Relief';

  @override
  String get journeyDay6Title => 'Preparação para o fim de semana';

  @override
  String get journeyDay6Goal => 'Definir cronograma de lembretes';

  @override
  String get journeyDay6Action => 'Revise as configurações do lembrete';

  @override
  String get journeyDay7Title => 'Recapitulação da semana 1';

  @override
  String get journeyDay7Goal => 'Revise o progresso semanal';

  @override
  String get journeyDay7Action =>
      'Abra o resumo semanal e veja a mudança na pontuação de mobilidade';

  @override
  String get journeyDay7Milestone => 'Semana 1 concluída';

  @override
  String get journeyDay8Title => 'Recuperação mais profunda';

  @override
  String get journeyDay8Goal => 'Recuperação profunda noturna completa';

  @override
  String get journeyDay8Action =>
      'Sessão noturna de 12 minutos antes de dormir';

  @override
  String get journeyDay10Title => 'Verificação de progresso';

  @override
  String get journeyDay10Goal => 'Revise suas estatísticas semanais';

  @override
  String get journeyDay10Action =>
      'Veja sessões e tendências de dor no Progress';

  @override
  String get journeyDay14Title => 'Marco de 2 semanas';

  @override
  String get journeyDay14Goal => 'Sequência de 14 dias ou mais de 10 sessões';

  @override
  String get journeyDay14Action => 'Desbloquear selo de conquista';

  @override
  String get journeyDay14Milestone => 'Guerreiro de 2 semanas';

  @override
  String get journeyDay15Title => 'Meio caminho';

  @override
  String get journeyDay15Goal => 'Revise o mapa da jornada';

  @override
  String get journeyDay15Action =>
      'Veja o progresso do dia 1 ao 30 no mapa da jornada';

  @override
  String get journeyDay21Title => 'Recapitulação da semana 3';

  @override
  String get journeyDay21Goal =>
      'Recapitulação semanal + compartilhar progresso';

  @override
  String get journeyDay21Action =>
      'Revise a tendência de mobilidade de 3 semanas';

  @override
  String get journeyDay30Title => 'Pós-graduação 30 dias';

  @override
  String get journeyDay30Goal => 'Programa completo de 30 dias';

  @override
  String get journeyDay30Action =>
      'Avaliação final + desbloqueio de avaliação premium';

  @override
  String get journeyDay30Milestone => 'Graduação de 30 dias';

  @override
  String get journeyDayDefaultTitle => 'Pausa diária na mesa';

  @override
  String get journeyDayDefaultGoal => 'Conclua pelo menos uma sessão';

  @override
  String get journeyDayDefaultAction =>
      'Faça uma pausa para mobilidade de 3 a 5 minutos em sua mesa';

  @override
  String get achievementFirstBreakTitle => 'Primeira pausa';

  @override
  String get achievementFirstBreakDesc =>
      'Concluiu sua primeira sessão de mesa';

  @override
  String get achievementStreak3Title => 'Sequência de 3 dias';

  @override
  String get achievementStreak3Desc => 'Mudei 3 dias seguidos';

  @override
  String get achievementWeek1Title => 'Semana 1 concluída';

  @override
  String get achievementWeek1Desc => 'Terminou sua primeira semana';

  @override
  String get achievementStreak14Title => 'Guerreiro de 2 semanas';

  @override
  String get achievementStreak14Desc => '14 dias de recuperação de mesa';

  @override
  String get achievementScore60Title => 'Mobilidade 60+';

  @override
  String get achievementScore60Desc => 'A pontuação de mobilidade atingiu 60';

  @override
  String get achievementGraduate30Title => 'Graduação de 30 dias';

  @override
  String get achievementGraduate30Desc => 'Concluiu o programa completo';

  @override
  String get moodStressed => 'Estressado';

  @override
  String get moodStressedSoundscape => 'Ambiente de respiração profunda';

  @override
  String get moodStressedDesc =>
      'Tons de expiração lenta para acalmar o sistema nervoso';

  @override
  String get moodTired => 'Cansado';

  @override
  String get moodTiredSoundscape => 'Chuva suave';

  @override
  String get moodTiredDesc => 'Chuvas suaves para aliviar a fadiga mental';

  @override
  String get moodSore => 'Dolorido';

  @override
  String get moodSoreSoundscape => 'Tons baixos quentes';

  @override
  String get moodSoreDesc => 'Frequências calmantes para músculos tensos';

  @override
  String get moodFocused => 'Focado';

  @override
  String get moodFocusedSoundscape => 'Painel de foco mínimo';

  @override
  String get moodFocusedDesc =>
      'Ritmo leve para permanecer presente durante os alongamentos';

  @override
  String get moodCalm => 'Calma';

  @override
  String get moodCalmSoundscape => 'Secretária zen';

  @override
  String get moodCalmDesc => 'Fundo tranquilo para o escritório';

  @override
  String get proLockCtaDefault => 'Comece um teste gratuito de 7 dias';

  @override
  String get upsellDefaultTitle => 'Quer mais de cada pausa?';

  @override
  String get upsellDefaultSubtitle =>
      'Desbloqueie planos de IA, paisagens sonoras de humor, verificação de postura e mais de 50 programas.';

  @override
  String get proFeature50Programs => 'Mais de 50 programas';

  @override
  String get proFeature50ProgramsSub => 'Biblioteca de mesa completa';

  @override
  String get proFeatureAiPosture => 'Postura de IA';

  @override
  String get proFeatureAiPostureSub => 'Digitalize e rastreie';

  @override
  String get proFeatureAiDailyPlan => 'Plano diário de IA';

  @override
  String get proFeatureAiDailyPlanSub => 'Personalizado';

  @override
  String get proFeatureSmartBreaks => 'Pausas Inteligentes';

  @override
  String get proFeatureSmartBreaksSub => 'Lembretes cronometrados';

  @override
  String get proFeatureWeeklyReport => 'Relatório Semanal';

  @override
  String get proFeatureWeeklyReportSub => 'Progresso da IA';

  @override
  String get proFeatureMoodSounds => 'Sons de humor';

  @override
  String get proFeatureMoodSoundsSub => 'Áudio ambiente';

  @override
  String get proFeatureDesktopApp => 'Aplicativo de desktop';

  @override
  String get proFeatureDesktopAppSub => 'Em breve';

  @override
  String get comingSoonBadge => 'Breve';

  @override
  String get desktopCompanionComingSoon => 'Companheiro de desktop em breve!';

  @override
  String get aiPlanBelowHint =>
      'Seu plano de IA está abaixo nas sessões de hoje';

  @override
  String get cancelProTrialTitle => 'Cancelar a avaliação do Pro?';

  @override
  String get cancelProTrialBody =>
      'Você perderá o acesso aos planos de IA, à análise de postura e à biblioteca completa de exercícios. Seu progresso e sequência permanecem salvos.';

  @override
  String get keepPro => 'Mantenha-se profissional';

  @override
  String get proTrialCancelled =>
      'Avaliação profissional cancelada. Você está no plano gratuito.';
}
