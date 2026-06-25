import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('pt'),
    Locale('ur'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CalmCalibrate'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get navProgress;

  /// No description provided for @navSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get navSessions;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Move better\nat work'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Relieve stiffness, fix posture, and feel energized with 90 second desk breaks made for you.'**
  String get welcomeSubtitle;

  /// No description provided for @painSelectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Where does sitting hurt?'**
  String get painSelectorTitle;

  /// No description provided for @goalsRemindersTitle.
  ///
  /// In en, this message translates to:
  /// **'Goals & reminders'**
  String get goalsRemindersTitle;

  /// No description provided for @goalsRemindersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll nudge you at the right time, never during meetings.'**
  String get goalsRemindersSubtitle;

  /// No description provided for @yourGoals.
  ///
  /// In en, this message translates to:
  /// **'Your goals'**
  String get yourGoals;

  /// No description provided for @reminderFrequency.
  ///
  /// In en, this message translates to:
  /// **'Reminder frequency'**
  String get reminderFrequency;

  /// No description provided for @reminderMinutesLabel.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String reminderMinutesLabel(int minutes);

  /// No description provided for @smartReminders.
  ///
  /// In en, this message translates to:
  /// **'Smart reminders'**
  String get smartReminders;

  /// No description provided for @smartRemindersHint.
  ///
  /// In en, this message translates to:
  /// **'Skip nudges when you\'re in a meeting or on a call.'**
  String get smartRemindersHint;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @appearanceHint.
  ///
  /// In en, this message translates to:
  /// **'Choose how CalmCalibrate looks on this device.'**
  String get appearanceHint;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageHint.
  ///
  /// In en, this message translates to:
  /// **'App display language'**
  String get languageHint;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @remindersEveryMinutes.
  ///
  /// In en, this message translates to:
  /// **'Every {minutes} min'**
  String remindersEveryMinutes(int minutes);

  /// No description provided for @journeyTitle.
  ///
  /// In en, this message translates to:
  /// **'30 Day Journey'**
  String get journeyTitle;

  /// No description provided for @journeySubtitle.
  ///
  /// In en, this message translates to:
  /// **'See your full program'**
  String get journeySubtitle;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @achievementsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Badges and milestones'**
  String get achievementsSubtitle;

  /// No description provided for @retakeAssessment.
  ///
  /// In en, this message translates to:
  /// **'Retake Assessment'**
  String get retakeAssessment;

  /// No description provided for @retakeAssessmentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update your mobility score'**
  String get retakeAssessmentSubtitle;

  /// No description provided for @proSubscription.
  ///
  /// In en, this message translates to:
  /// **'Pro subscription'**
  String get proSubscription;

  /// No description provided for @upgradeToPro.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Pro'**
  String get upgradeToPro;

  /// No description provided for @proBenefitsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI plans, posture scan & full library'**
  String get proBenefitsSubtitle;

  /// No description provided for @trialDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} trial days remaining'**
  String trialDaysLeft(int count);

  /// No description provided for @viewProBenefits.
  ///
  /// In en, this message translates to:
  /// **'View Pro benefits'**
  String get viewProBenefits;

  /// No description provided for @cancelFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'Cancel free trial'**
  String get cancelFreeTrial;

  /// No description provided for @returnToFreePlan.
  ///
  /// In en, this message translates to:
  /// **'Return to free plan'**
  String get returnToFreePlan;

  /// No description provided for @painNeck.
  ///
  /// In en, this message translates to:
  /// **'Neck'**
  String get painNeck;

  /// No description provided for @painShoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get painShoulders;

  /// No description provided for @painUpperBack.
  ///
  /// In en, this message translates to:
  /// **'Upper Back'**
  String get painUpperBack;

  /// No description provided for @painLowerBack.
  ///
  /// In en, this message translates to:
  /// **'Lower Back'**
  String get painLowerBack;

  /// No description provided for @painHips.
  ///
  /// In en, this message translates to:
  /// **'Hips'**
  String get painHips;

  /// No description provided for @breakMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get breakMorning;

  /// No description provided for @breakLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get breakLunch;

  /// No description provided for @breakAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get breakAfternoon;

  /// No description provided for @breakEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get breakEvening;

  /// No description provided for @goalReduceNeckPain.
  ///
  /// In en, this message translates to:
  /// **'Reduce neck pain'**
  String get goalReduceNeckPain;

  /// No description provided for @goalFixPosture.
  ///
  /// In en, this message translates to:
  /// **'Fix posture'**
  String get goalFixPosture;

  /// No description provided for @goalMoreEnergy.
  ///
  /// In en, this message translates to:
  /// **'More energy'**
  String get goalMoreEnergy;

  /// No description provided for @goalPreventInjury.
  ///
  /// In en, this message translates to:
  /// **'Prevent injury'**
  String get goalPreventInjury;

  /// No description provided for @sittingFourToSix.
  ///
  /// In en, this message translates to:
  /// **'4 to 6 hrs'**
  String get sittingFourToSix;

  /// No description provided for @sittingSixToEight.
  ///
  /// In en, this message translates to:
  /// **'6 to 8 hrs'**
  String get sittingSixToEight;

  /// No description provided for @sittingEightPlus.
  ///
  /// In en, this message translates to:
  /// **'8+ hrs'**
  String get sittingEightPlus;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @localeEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get localeEnglish;

  /// No description provided for @localeUrdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get localeUrdu;

  /// No description provided for @localeHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get localeHindi;

  /// No description provided for @localeBengali.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get localeBengali;

  /// No description provided for @localeSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get localeSpanish;

  /// No description provided for @localeFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get localeFrench;

  /// No description provided for @localeArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get localeArabic;

  /// No description provided for @localePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get localePortuguese;

  /// No description provided for @localeGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get localeGerman;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @proBadge.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get proBadge;

  /// No description provided for @aiBadge.
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get aiBadge;

  /// No description provided for @postureScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Posture {score}/100'**
  String postureScoreLabel(int score);

  /// No description provided for @trialDaysShort.
  ///
  /// In en, this message translates to:
  /// **'{days} d trial'**
  String trialDaysShort(int days);

  /// No description provided for @journeyDefaultGoal.
  ///
  /// In en, this message translates to:
  /// **'Stay consistent'**
  String get journeyDefaultGoal;

  /// No description provided for @journeyDefaultAction.
  ///
  /// In en, this message translates to:
  /// **'Complete a desk break today'**
  String get journeyDefaultAction;

  /// No description provided for @aiPickedForIssue.
  ///
  /// In en, this message translates to:
  /// **'AI picked for your {issue}'**
  String aiPickedForIssue(String issue);

  /// No description provided for @proLockSmartBreakFeature.
  ///
  /// In en, this message translates to:
  /// **'Smart Break reminders'**
  String get proLockSmartBreakFeature;

  /// No description provided for @proLockSmartBreakBenefit.
  ///
  /// In en, this message translates to:
  /// **'Pro times breaks from your posture & sitting pattern. AI picks the right 90 sec reset when you need it.'**
  String get proLockSmartBreakBenefit;

  /// No description provided for @yourProFeatures.
  ///
  /// In en, this message translates to:
  /// **'Your Pro features'**
  String get yourProFeatures;

  /// No description provided for @proLockExtraSessionsFeature.
  ///
  /// In en, this message translates to:
  /// **'Extra daily sessions'**
  String get proLockExtraSessionsFeature;

  /// No description provided for @proLockExtraSessionsBenefit.
  ///
  /// In en, this message translates to:
  /// **'Free plan includes 1 session per day. Pro unlocks your full AI plan: morning, midday & evening breaks.'**
  String get proLockExtraSessionsBenefit;

  /// No description provided for @todaysAiPlan.
  ///
  /// In en, this message translates to:
  /// **'Today\'s AI Plan'**
  String get todaysAiPlan;

  /// No description provided for @todaysSessions.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Sessions'**
  String get todaysSessions;

  /// No description provided for @browseProgramsTitle.
  ///
  /// In en, this message translates to:
  /// **'Browse 50+ programs'**
  String get browseProgramsTitle;

  /// No description provided for @browseProgramsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Neck, back, hips & more. All unlocked'**
  String get browseProgramsSubtitle;

  /// No description provided for @unlockProTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock Pro'**
  String get unlockProTitle;

  /// No description provided for @unlockProSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI posture · mood sounds · 50+ programs'**
  String get unlockProSubtitle;

  /// No description provided for @checkInBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily check-in'**
  String get checkInBannerTitle;

  /// No description provided for @checkInBannerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How\'s your body today?'**
  String get checkInBannerSubtitle;

  /// No description provided for @smartBreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Break'**
  String get smartBreakTitle;

  /// No description provided for @smartBreakNextIn.
  ///
  /// In en, this message translates to:
  /// **'Next break in ~{minutes} min'**
  String smartBreakNextIn(int minutes);

  /// No description provided for @smartBreakPremiumHint.
  ///
  /// In en, this message translates to:
  /// **'Timed from your posture & sitting pattern'**
  String get smartBreakPremiumHint;

  /// No description provided for @smartBreakFreeHint.
  ///
  /// In en, this message translates to:
  /// **'Based on your sitting pattern'**
  String get smartBreakFreeHint;

  /// No description provided for @journeyCardTodaysGoal.
  ///
  /// In en, this message translates to:
  /// **'Today\'s goal'**
  String get journeyCardTodaysGoal;

  /// No description provided for @journeyCardDayLabel.
  ///
  /// In en, this message translates to:
  /// **'DAY'**
  String get journeyCardDayLabel;

  /// No description provided for @journeyCardStreak.
  ///
  /// In en, this message translates to:
  /// **'{days} day streak'**
  String journeyCardStreak(int days);

  /// No description provided for @streakBadgeFull.
  ///
  /// In en, this message translates to:
  /// **'{days} day streak'**
  String streakBadgeFull(int days);

  /// No description provided for @noProgressDataYet.
  ///
  /// In en, this message translates to:
  /// **'No progress data yet'**
  String get noProgressDataYet;

  /// No description provided for @weeklyProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Progress'**
  String get weeklyProgressTitle;

  /// No description provided for @weeklyProgressEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Complete your first session to start tracking.'**
  String get weeklyProgressEmptyHint;

  /// No description provided for @weeklyProgressSummary.
  ///
  /// In en, this message translates to:
  /// **'{sessions} sessions · {minutes} min total'**
  String weeklyProgressSummary(int sessions, int minutes);

  /// No description provided for @weeklyProgressAvgRelief.
  ///
  /// In en, this message translates to:
  /// **'avg relief +{relief}'**
  String weeklyProgressAvgRelief(int relief);

  /// No description provided for @beforeLabel.
  ///
  /// In en, this message translates to:
  /// **'Before'**
  String get beforeLabel;

  /// No description provided for @nowLabel.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get nowLabel;

  /// No description provided for @areaImprovementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Area improvements'**
  String get areaImprovementsTitle;

  /// No description provided for @improvementPercent.
  ///
  /// In en, this message translates to:
  /// **'+{percent}%'**
  String improvementPercent(int percent);

  /// No description provided for @sessionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessionsTitle;

  /// No description provided for @sessionsSubtitlePro.
  ///
  /// In en, this message translates to:
  /// **'Pro library unlocked · programs by area'**
  String get sessionsSubtitlePro;

  /// No description provided for @sessionsSubtitleFree.
  ///
  /// In en, this message translates to:
  /// **'Programs by pain area at your desk'**
  String get sessionsSubtitleFree;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @todaysPlan.
  ///
  /// In en, this message translates to:
  /// **'Today\'s plan'**
  String get todaysPlan;

  /// No description provided for @allPrograms.
  ///
  /// In en, this message translates to:
  /// **'All programs'**
  String get allPrograms;

  /// No description provided for @playingSoundscape.
  ///
  /// In en, this message translates to:
  /// **'Playing: {label}'**
  String playingSoundscape(String label);

  /// No description provided for @stepProgress.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepProgress(int current, int total);

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @defaultStretchTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: Breathe out as you stretch. Never force pain.'**
  String get defaultStretchTip;

  /// No description provided for @niceWork.
  ///
  /// In en, this message translates to:
  /// **'Nice work!'**
  String get niceWork;

  /// No description provided for @sessionCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Your body thanks you. Keep the streak going tomorrow.'**
  String get sessionCompleteMessage;

  /// No description provided for @statMinutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get statMinutes;

  /// No description provided for @statMobilityPts.
  ///
  /// In en, this message translates to:
  /// **'Mobility pts'**
  String get statMobilityPts;

  /// No description provided for @statStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get statStreak;

  /// No description provided for @statStreakValue.
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String statStreakValue(int days);

  /// No description provided for @upsellMoodSoundsTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock mood sounds & AI plans'**
  String get upsellMoodSoundsTitle;

  /// No description provided for @upsellMoodSoundsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pro matches ambient audio to how you feel and builds your full daily recovery plan.'**
  String get upsellMoodSoundsSubtitle;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @howDoYouFeel.
  ///
  /// In en, this message translates to:
  /// **'How do you feel?'**
  String get howDoYouFeel;

  /// No description provided for @painNowTitle.
  ///
  /// In en, this message translates to:
  /// **'How\'s your pain now?'**
  String get painNowTitle;

  /// No description provided for @painNowSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us personalize your next session.'**
  String get painNowSubtitle;

  /// No description provided for @thanksAdjustPlan.
  ///
  /// In en, this message translates to:
  /// **'Thanks! We\'ll adjust your plan.'**
  String get thanksAdjustPlan;

  /// No description provided for @workPatternTitle.
  ///
  /// In en, this message translates to:
  /// **'Your work pattern'**
  String get workPatternTitle;

  /// No description provided for @workPatternSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us schedule breaks when you need them most.'**
  String get workPatternSubtitle;

  /// No description provided for @whatShouldWeCallYou.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get whatShouldWeCallYou;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstNameHint;

  /// No description provided for @hoursSittingPerDay.
  ///
  /// In en, this message translates to:
  /// **'Hours sitting per day'**
  String get hoursSittingPerDay;

  /// No description provided for @bestBreakTimes.
  ///
  /// In en, this message translates to:
  /// **'Best break times?'**
  String get bestBreakTimes;

  /// No description provided for @workPatternValidationAll.
  ///
  /// In en, this message translates to:
  /// **'Add your name, sitting hours, and a break time'**
  String get workPatternValidationAll;

  /// No description provided for @workPatternValidationHours.
  ///
  /// In en, this message translates to:
  /// **'Select sitting hours and at least one break time'**
  String get workPatternValidationHours;

  /// No description provided for @stayOnTrackTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay on track'**
  String get stayOnTrackTitle;

  /// No description provided for @stayOnTrackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Smart reminders nudge you at the right time, never during meetings.'**
  String get stayOnTrackSubtitle;

  /// No description provided for @notificationBenefitBreaks.
  ///
  /// In en, this message translates to:
  /// **'Break reminders during work hours'**
  String get notificationBenefitBreaks;

  /// No description provided for @notificationBenefitSlump.
  ///
  /// In en, this message translates to:
  /// **'3pm slump alerts'**
  String get notificationBenefitSlump;

  /// No description provided for @notificationBenefitStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak protection nudges'**
  String get notificationBenefitStreak;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get enableNotifications;

  /// No description provided for @maybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get maybeLater;

  /// No description provided for @mobilityAssessmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobility Assessment'**
  String get mobilityAssessmentTitle;

  /// No description provided for @analyzingPosture.
  ///
  /// In en, this message translates to:
  /// **'Analyzing posture...'**
  String get analyzingPosture;

  /// No description provided for @mobilityScoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobility Score'**
  String get mobilityScoreTitle;

  /// No description provided for @scanningInstructions.
  ///
  /// In en, this message translates to:
  /// **'Stand in profile view. Keep your whole body in frame.'**
  String get scanningInstructions;

  /// No description provided for @scanPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'We\'ll use your camera to measure posture alignment. Processing happens on your device for privacy.'**
  String get scanPrivacyNote;

  /// No description provided for @scanProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent}% complete'**
  String scanProgress(int percent);

  /// No description provided for @scanningEllipsis.
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get scanningEllipsis;

  /// No description provided for @startScan.
  ///
  /// In en, this message translates to:
  /// **'Start Scan'**
  String get startScan;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @alignShouldersGuide.
  ///
  /// In en, this message translates to:
  /// **'Align shoulders with guide'**
  String get alignShouldersGuide;

  /// No description provided for @yourMobilityScore.
  ///
  /// In en, this message translates to:
  /// **'Your Mobility Score'**
  String get yourMobilityScore;

  /// No description provided for @scoreBasedOnScan.
  ///
  /// In en, this message translates to:
  /// **'Based on your posture scan and pain areas'**
  String get scoreBasedOnScan;

  /// No description provided for @seeMyPlan.
  ///
  /// In en, this message translates to:
  /// **'See My Plan'**
  String get seeMyPlan;

  /// No description provided for @potentialGain.
  ///
  /// In en, this message translates to:
  /// **'+{gain}'**
  String potentialGain(int gain);

  /// No description provided for @yourPlanAppBar.
  ///
  /// In en, this message translates to:
  /// **'Your Plan'**
  String get yourPlanAppBar;

  /// No description provided for @personalizedForYou.
  ///
  /// In en, this message translates to:
  /// **'Personalized for you'**
  String get personalizedForYou;

  /// No description provided for @planSubtitleDefault.
  ///
  /// In en, this message translates to:
  /// **'3 daily sessions tailored to desk workers.'**
  String get planSubtitleDefault;

  /// No description provided for @planSubtitleFocused.
  ///
  /// In en, this message translates to:
  /// **'Focused on {areas} with smart break timing.'**
  String planSubtitleFocused(String areas);

  /// No description provided for @startMyPlan.
  ///
  /// In en, this message translates to:
  /// **'Start My Plan'**
  String get startMyPlan;

  /// No description provided for @sessionDurationMin.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String sessionDurationMin(int minutes);

  /// No description provided for @dayCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Day {day} check in'**
  String dayCheckIn(int day);

  /// No description provided for @howDoesBodyFeelToday.
  ///
  /// In en, this message translates to:
  /// **'How does your body feel today?'**
  String get howDoesBodyFeelToday;

  /// No description provided for @checkInHelpsPickRoutine.
  ///
  /// In en, this message translates to:
  /// **'This helps us pick the right routine for you.'**
  String get checkInHelpsPickRoutine;

  /// No description provided for @overallPainLevel.
  ///
  /// In en, this message translates to:
  /// **'Overall pain level'**
  String get overallPainLevel;

  /// No description provided for @troubleAreasToday.
  ///
  /// In en, this message translates to:
  /// **'Trouble areas today'**
  String get troubleAreasToday;

  /// No description provided for @troubleAreaEyes.
  ///
  /// In en, this message translates to:
  /// **'Eyes'**
  String get troubleAreaEyes;

  /// No description provided for @continueToTodaysSession.
  ///
  /// In en, this message translates to:
  /// **'Continue to today\'s session'**
  String get continueToTodaysSession;

  /// No description provided for @proLockPremiumProgramFeature.
  ///
  /// In en, this message translates to:
  /// **'Premium program'**
  String get proLockPremiumProgramFeature;

  /// No description provided for @proLockPremiumProgramBenefit.
  ///
  /// In en, this message translates to:
  /// **'This desk program is part of the Pro library. 50+ targeted sessions for neck, back, hips & more.'**
  String get proLockPremiumProgramBenefit;

  /// No description provided for @defaultSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Desk break'**
  String get defaultSessionTitle;

  /// No description provided for @defaultSessionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick mobility reset'**
  String get defaultSessionSubtitle;

  /// No description provided for @beforeWeStart.
  ///
  /// In en, this message translates to:
  /// **'Before we start'**
  String get beforeWeStart;

  /// No description provided for @howDoesBodyFeel.
  ///
  /// In en, this message translates to:
  /// **'How does your body feel?'**
  String get howDoesBodyFeel;

  /// No description provided for @painScaleGreat.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get painScaleGreat;

  /// No description provided for @painScaleSore.
  ///
  /// In en, this message translates to:
  /// **'Sore'**
  String get painScaleSore;

  /// No description provided for @startSession.
  ///
  /// In en, this message translates to:
  /// **'Start session'**
  String get startSession;

  /// No description provided for @skipCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Skip check-in'**
  String get skipCheckIn;

  /// No description provided for @smartBreakPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Break'**
  String get smartBreakPromptTitle;

  /// No description provided for @smartBreakAiMessage.
  ///
  /// In en, this message translates to:
  /// **'AI picked this break for your {issue}. You\'ve been sitting 47 min. 90 seconds will help.'**
  String smartBreakAiMessage(String issue);

  /// No description provided for @smartBreakProMessage.
  ///
  /// In en, this message translates to:
  /// **'Pro smart break: your neck needs a reset after 47 min of sitting.'**
  String get smartBreakProMessage;

  /// No description provided for @smartBreakFreeMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been sitting 47 min. Your neck could use a 90 second reset.'**
  String get smartBreakFreeMessage;

  /// No description provided for @start90SecBreak.
  ///
  /// In en, this message translates to:
  /// **'Start 90 sec break'**
  String get start90SecBreak;

  /// No description provided for @snooze15Min.
  ///
  /// In en, this message translates to:
  /// **'Snooze 15 min'**
  String get snooze15Min;

  /// No description provided for @achievementUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Achievement unlocked'**
  String get achievementUnlocked;

  /// No description provided for @milestoneReachedFallback.
  ///
  /// In en, this message translates to:
  /// **'Milestone reached!'**
  String get milestoneReachedFallback;

  /// No description provided for @daysStrong.
  ///
  /// In en, this message translates to:
  /// **'{days} days strong'**
  String daysStrong(int days);

  /// No description provided for @unlockProFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'Unlock Pro free trial'**
  String get unlockProFreeTrial;

  /// No description provided for @continueToHome.
  ///
  /// In en, this message translates to:
  /// **'Continue to Home'**
  String get continueToHome;

  /// No description provided for @keepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get keepGoing;

  /// No description provided for @milestoneMessageDay3.
  ///
  /// In en, this message translates to:
  /// **'Three days in a row. Small breaks are adding up.'**
  String get milestoneMessageDay3;

  /// No description provided for @milestoneMessageDay7.
  ///
  /// In en, this message translates to:
  /// **'One full week of showing up for your body.'**
  String get milestoneMessageDay7;

  /// No description provided for @milestoneMessageDay14.
  ///
  /// In en, this message translates to:
  /// **'Two weeks of consistency — your mobility is improving.'**
  String get milestoneMessageDay14;

  /// No description provided for @milestoneMessageDay30.
  ///
  /// In en, this message translates to:
  /// **'Thirty days. You built a real desk recovery habit.'**
  String get milestoneMessageDay30;

  /// No description provided for @milestoneMessageDefault.
  ///
  /// In en, this message translates to:
  /// **'Keep showing up. Your body is changing.'**
  String get milestoneMessageDefault;

  /// No description provided for @weekRecapTitle.
  ///
  /// In en, this message translates to:
  /// **'Week {week} Recap'**
  String weekRecapTitle(int week);

  /// No description provided for @yourWeekInReview.
  ///
  /// In en, this message translates to:
  /// **'Your week in review'**
  String get yourWeekInReview;

  /// No description provided for @weekRecapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Small breaks add up. Here\'s your progress.'**
  String get weekRecapSubtitle;

  /// No description provided for @recapSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get recapSessions;

  /// No description provided for @recapStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get recapStreak;

  /// No description provided for @recapMinutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get recapMinutes;

  /// No description provided for @aiWeeklyInsightTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Weekly Insight'**
  String get aiWeeklyInsightTitle;

  /// No description provided for @aiInsightEmpty.
  ///
  /// In en, this message translates to:
  /// **'Complete sessions to get AI insights.'**
  String get aiInsightEmpty;

  /// No description provided for @unlockAiWeeklyInsights.
  ///
  /// In en, this message translates to:
  /// **'Unlock AI weekly insights with Pro'**
  String get unlockAiWeeklyInsights;

  /// No description provided for @weMissYou.
  ///
  /// In en, this message translates to:
  /// **'We miss you!'**
  String get weMissYou;

  /// No description provided for @reEngagementBody.
  ///
  /// In en, this message translates to:
  /// **'Your neck and back don\'t take days off. One 90 second break is all it takes to get back on track.'**
  String get reEngagementBody;

  /// No description provided for @quickComebackSession.
  ///
  /// In en, this message translates to:
  /// **'Quick comeback session'**
  String get quickComebackSession;

  /// No description provided for @comebackSessionDetails.
  ///
  /// In en, this message translates to:
  /// **'Neck Relief · 3 min · No equipment'**
  String get comebackSessionDetails;

  /// No description provided for @do3MinComeback.
  ///
  /// In en, this message translates to:
  /// **'Do a 3 min comeback'**
  String get do3MinComeback;

  /// No description provided for @remindMeTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Remind me tomorrow'**
  String get remindMeTomorrow;

  /// No description provided for @journeyMapTitle.
  ///
  /// In en, this message translates to:
  /// **'30 Day Journey'**
  String get journeyMapTitle;

  /// No description provided for @dayOf30.
  ///
  /// In en, this message translates to:
  /// **'Day {day} of 30'**
  String dayOf30(int day);

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @achievementsUnlockedCount.
  ///
  /// In en, this message translates to:
  /// **'{unlocked} / {total} unlocked'**
  String achievementsUnlockedCount(int unlocked, int total);

  /// No description provided for @achievementUnlockDay.
  ///
  /// In en, this message translates to:
  /// **'Day {day}'**
  String achievementUnlockDay(int day);

  /// No description provided for @remindersTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get remindersTitle;

  /// No description provided for @breakFrequency.
  ///
  /// In en, this message translates to:
  /// **'Break frequency'**
  String get breakFrequency;

  /// No description provided for @breakFrequencyMin.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String breakFrequencyMin(int minutes);

  /// No description provided for @activeHours.
  ///
  /// In en, this message translates to:
  /// **'Active hours'**
  String get activeHours;

  /// No description provided for @smartRemindersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Skip meetings, adapt to activity'**
  String get smartRemindersSubtitle;

  /// No description provided for @calmCalibratePro.
  ///
  /// In en, this message translates to:
  /// **'CalmCalibrate Pro'**
  String get calmCalibratePro;

  /// No description provided for @fullDeskRecoverySystem.
  ///
  /// In en, this message translates to:
  /// **'Full desk recovery system'**
  String get fullDeskRecoverySystem;

  /// No description provided for @unlockFullRecovery.
  ///
  /// In en, this message translates to:
  /// **'Unlock Full Recovery'**
  String get unlockFullRecovery;

  /// No description provided for @paywallTagline.
  ///
  /// In en, this message translates to:
  /// **'90 sec breaks that actually work at your desk.'**
  String get paywallTagline;

  /// No description provided for @startFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'Start Free Trial'**
  String get startFreeTrial;

  /// No description provided for @cancelTrial.
  ///
  /// In en, this message translates to:
  /// **'Cancel trial'**
  String get cancelTrial;

  /// No description provided for @trialDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'7 day free trial · Cancel anytime'**
  String get trialDisclaimer;

  /// No description provided for @welcomeProTrialStarted.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Pro! 7 day free trial started.'**
  String get welcomeProTrialStarted;

  /// No description provided for @aiDailyPlanComingSoon.
  ///
  /// In en, this message translates to:
  /// **'AI daily plan coming soon'**
  String get aiDailyPlanComingSoon;

  /// No description provided for @generateAiPlanToday.
  ///
  /// In en, this message translates to:
  /// **'Generate AI plan for today'**
  String get generateAiPlanToday;

  /// No description provided for @aiFocus.
  ///
  /// In en, this message translates to:
  /// **'AI focus: {focus}'**
  String aiFocus(String focus);

  /// No description provided for @planSlotMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get planSlotMorning;

  /// No description provided for @planSlotMidday.
  ///
  /// In en, this message translates to:
  /// **'Midday'**
  String get planSlotMidday;

  /// No description provided for @planSlotEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get planSlotEvening;

  /// No description provided for @aiDailyPlanLockedTeaser.
  ///
  /// In en, this message translates to:
  /// **'Pro: AI builds your morning, midday & evening plan'**
  String get aiDailyPlanLockedTeaser;

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling?'**
  String get howAreYouFeeling;

  /// No description provided for @moodSoundPremiumHint.
  ///
  /// In en, this message translates to:
  /// **'We\'ll play a matching soundscape during your session'**
  String get moodSoundPremiumHint;

  /// No description provided for @moodSoundFreeHint.
  ///
  /// In en, this message translates to:
  /// **'Pro unlocks mood matched ambient audio'**
  String get moodSoundFreeHint;

  /// No description provided for @proLockMoodFeature.
  ///
  /// In en, this message translates to:
  /// **'Mood soundscapes'**
  String get proLockMoodFeature;

  /// No description provided for @moodSoundLockedTeaser.
  ///
  /// In en, this message translates to:
  /// **'Pro: soundscapes matched to your mood'**
  String get moodSoundLockedTeaser;

  /// No description provided for @featureComingSoon.
  ///
  /// In en, this message translates to:
  /// **'{feature} coming soon'**
  String featureComingSoon(String feature);

  /// No description provided for @aiNotConnectedYet.
  ///
  /// In en, this message translates to:
  /// **'AI is not connected yet. This will use a serverless LLM when ready. No login required.'**
  String get aiNotConnectedYet;

  /// No description provided for @sessionMorningResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Morning Reset'**
  String get sessionMorningResetTitle;

  /// No description provided for @sessionMorningResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Wake up your spine'**
  String get sessionMorningResetSubtitle;

  /// No description provided for @sessionMiddayBreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Midday Desk Break'**
  String get sessionMiddayBreakTitle;

  /// No description provided for @sessionMiddayBreakSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Combat afternoon stiffness'**
  String get sessionMiddayBreakSubtitle;

  /// No description provided for @sessionEveningRecoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Evening Deep Recovery'**
  String get sessionEveningRecoveryTitle;

  /// No description provided for @sessionEveningRecoverySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Release the day\'s tension'**
  String get sessionEveningRecoverySubtitle;

  /// No description provided for @sessionNeckReliefTitle.
  ///
  /// In en, this message translates to:
  /// **'Neck Relief'**
  String get sessionNeckReliefTitle;

  /// No description provided for @sessionNeckReliefSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Forward head posture fix'**
  String get sessionNeckReliefSubtitle;

  /// No description provided for @sessionBackSaverTitle.
  ///
  /// In en, this message translates to:
  /// **'Back Saver'**
  String get sessionBackSaverTitle;

  /// No description provided for @sessionBackSaverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lower back decompression'**
  String get sessionBackSaverSubtitle;

  /// No description provided for @sessionUpperBackReliefTitle.
  ///
  /// In en, this message translates to:
  /// **'Upper Back Relief'**
  String get sessionUpperBackReliefTitle;

  /// No description provided for @sessionUpperBackReliefSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Thoracic & trap release'**
  String get sessionUpperBackReliefSubtitle;

  /// No description provided for @sessionHipOpenerTitle.
  ///
  /// In en, this message translates to:
  /// **'Hip Opener'**
  String get sessionHipOpenerTitle;

  /// No description provided for @sessionHipOpenerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tight hip flexors'**
  String get sessionHipOpenerSubtitle;

  /// No description provided for @sessionEyeResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Eye Reset'**
  String get sessionEyeResetTitle;

  /// No description provided for @sessionEyeResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Screen strain relief'**
  String get sessionEyeResetSubtitle;

  /// No description provided for @sessionShoulderMeltTitle.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Melt'**
  String get sessionShoulderMeltTitle;

  /// No description provided for @sessionShoulderMeltSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Upper trap release'**
  String get sessionShoulderMeltSubtitle;

  /// No description provided for @stepNeckRollsName.
  ///
  /// In en, this message translates to:
  /// **'Neck Rolls'**
  String get stepNeckRollsName;

  /// No description provided for @stepNeckRollsInstruction.
  ///
  /// In en, this message translates to:
  /// **'Slowly roll your neck in a circle. Breathe deeply.'**
  String get stepNeckRollsInstruction;

  /// No description provided for @stepNeckRollsTip.
  ///
  /// In en, this message translates to:
  /// **'Move slowly. No jerking.'**
  String get stepNeckRollsTip;

  /// No description provided for @stepShoulderShrugsName.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Shrugs'**
  String get stepShoulderShrugsName;

  /// No description provided for @stepShoulderShrugsInstruction.
  ///
  /// In en, this message translates to:
  /// **'Lift shoulders to ears, hold 3 sec, release.'**
  String get stepShoulderShrugsInstruction;

  /// No description provided for @stepShoulderShrugsTip.
  ///
  /// In en, this message translates to:
  /// **'Hold at the top for 3 seconds.'**
  String get stepShoulderShrugsTip;

  /// No description provided for @stepSeatedTwistName.
  ///
  /// In en, this message translates to:
  /// **'Seated Twist'**
  String get stepSeatedTwistName;

  /// No description provided for @stepSeatedTwistInstruction.
  ///
  /// In en, this message translates to:
  /// **'Twist gently left and right. Keep hips facing forward.'**
  String get stepSeatedTwistInstruction;

  /// No description provided for @stepSeatedTwistTip.
  ///
  /// In en, this message translates to:
  /// **'Keep hips still. Twist from the waist.'**
  String get stepSeatedTwistTip;

  /// No description provided for @stepChestOpenerName.
  ///
  /// In en, this message translates to:
  /// **'Chest Opener'**
  String get stepChestOpenerName;

  /// No description provided for @stepChestOpenerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Clasp hands behind back. Open chest gently.'**
  String get stepChestOpenerInstruction;

  /// No description provided for @stepChestOpenerTip.
  ///
  /// In en, this message translates to:
  /// **'Squeeze shoulder blades together.'**
  String get stepChestOpenerTip;

  /// No description provided for @stepNeckSideReleaseName.
  ///
  /// In en, this message translates to:
  /// **'Neck Side Release'**
  String get stepNeckSideReleaseName;

  /// No description provided for @stepNeckSideReleaseInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tilt ear toward shoulder. Hold each side 20 sec.'**
  String get stepNeckSideReleaseInstruction;

  /// No description provided for @stepNeckSideReleaseTip.
  ///
  /// In en, this message translates to:
  /// **'Keep opposite shoulder relaxed.'**
  String get stepNeckSideReleaseTip;

  /// No description provided for @stepSeatedCatCowName.
  ///
  /// In en, this message translates to:
  /// **'Seated Cat Cow'**
  String get stepSeatedCatCowName;

  /// No description provided for @stepSeatedCatCowInstruction.
  ///
  /// In en, this message translates to:
  /// **'Arch and round your back slowly with breath.'**
  String get stepSeatedCatCowInstruction;

  /// No description provided for @stepSeatedCatCowTip.
  ///
  /// In en, this message translates to:
  /// **'Sync movement with your breath.'**
  String get stepSeatedCatCowTip;

  /// No description provided for @stepHipFlexorStretchName.
  ///
  /// In en, this message translates to:
  /// **'Hip Flexor Stretch'**
  String get stepHipFlexorStretchName;

  /// No description provided for @stepHipFlexorStretchInstruction.
  ///
  /// In en, this message translates to:
  /// **'Stand, step one foot back. Lean forward gently.'**
  String get stepHipFlexorStretchInstruction;

  /// No description provided for @stepHipFlexorStretchTip.
  ///
  /// In en, this message translates to:
  /// **'Keep front knee over ankle.'**
  String get stepHipFlexorStretchTip;

  /// No description provided for @stepStandingBackExtensionName.
  ///
  /// In en, this message translates to:
  /// **'Standing Back Extension'**
  String get stepStandingBackExtensionName;

  /// No description provided for @stepStandingBackExtensionInstruction.
  ///
  /// In en, this message translates to:
  /// **'Hands on lower back. Lean back slightly.'**
  String get stepStandingBackExtensionInstruction;

  /// No description provided for @stepStandingBackExtensionTip.
  ///
  /// In en, this message translates to:
  /// **'Small range. No forcing.'**
  String get stepStandingBackExtensionTip;

  /// No description provided for @stepThoracicExtensionName.
  ///
  /// In en, this message translates to:
  /// **'Thoracic Extension'**
  String get stepThoracicExtensionName;

  /// No description provided for @stepThoracicExtensionInstruction.
  ///
  /// In en, this message translates to:
  /// **'Hands behind head. Arch upper back over chair.'**
  String get stepThoracicExtensionInstruction;

  /// No description provided for @stepThoracicExtensionTip.
  ///
  /// In en, this message translates to:
  /// **'Lead with your chest, not your neck.'**
  String get stepThoracicExtensionTip;

  /// No description provided for @stepFigure4StretchName.
  ///
  /// In en, this message translates to:
  /// **'Figure 4 Stretch'**
  String get stepFigure4StretchName;

  /// No description provided for @stepFigure4StretchInstruction.
  ///
  /// In en, this message translates to:
  /// **'Ankle on opposite knee. Lean forward gently.'**
  String get stepFigure4StretchInstruction;

  /// No description provided for @stepFigure4StretchTip.
  ///
  /// In en, this message translates to:
  /// **'Flex foot to protect the knee.'**
  String get stepFigure4StretchTip;

  /// No description provided for @stepChildsPoseChairName.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Pose (Chair)'**
  String get stepChildsPoseChairName;

  /// No description provided for @stepChildsPoseChairInstruction.
  ///
  /// In en, this message translates to:
  /// **'Sit back, fold forward over knees. Breathe.'**
  String get stepChildsPoseChairInstruction;

  /// No description provided for @stepChildsPoseChairTip.
  ///
  /// In en, this message translates to:
  /// **'Let your neck hang heavy.'**
  String get stepChildsPoseChairTip;

  /// No description provided for @stepDeepBreathingName.
  ///
  /// In en, this message translates to:
  /// **'Deep Breathing'**
  String get stepDeepBreathingName;

  /// No description provided for @stepDeepBreathingInstruction.
  ///
  /// In en, this message translates to:
  /// **'4 counts in, 6 counts out. Relax shoulders.'**
  String get stepDeepBreathingInstruction;

  /// No description provided for @stepDeepBreathingTip.
  ///
  /// In en, this message translates to:
  /// **'Longer exhale calms the nervous system.'**
  String get stepDeepBreathingTip;

  /// No description provided for @stepDeskStretchName.
  ///
  /// In en, this message translates to:
  /// **'Desk Stretch'**
  String get stepDeskStretchName;

  /// No description provided for @stepDeskStretchInstruction.
  ///
  /// In en, this message translates to:
  /// **'Gentle stretch at your desk.'**
  String get stepDeskStretchInstruction;

  /// No description provided for @stepDeskStretchTip.
  ///
  /// In en, this message translates to:
  /// **'Move within a comfortable range.'**
  String get stepDeskStretchTip;

  /// No description provided for @journeyDay1Title.
  ///
  /// In en, this message translates to:
  /// **'First session'**
  String get journeyDay1Title;

  /// No description provided for @journeyDay1Goal.
  ///
  /// In en, this message translates to:
  /// **'Complete onboarding + 1 break'**
  String get journeyDay1Goal;

  /// No description provided for @journeyDay1Action.
  ///
  /// In en, this message translates to:
  /// **'Finish pain assessment and do Morning Reset'**
  String get journeyDay1Action;

  /// No description provided for @journeyDay2Title.
  ///
  /// In en, this message translates to:
  /// **'Build the habit'**
  String get journeyDay2Title;

  /// No description provided for @journeyDay2Goal.
  ///
  /// In en, this message translates to:
  /// **'2 sessions + daily check in'**
  String get journeyDay2Goal;

  /// No description provided for @journeyDay2Action.
  ///
  /// In en, this message translates to:
  /// **'Log how your neck feels, do Midday Desk Break'**
  String get journeyDay2Action;

  /// No description provided for @journeyDay3Title.
  ///
  /// In en, this message translates to:
  /// **'3 day streak'**
  String get journeyDay3Title;

  /// No description provided for @journeyDay3Goal.
  ///
  /// In en, this message translates to:
  /// **'Hit 3 day streak'**
  String get journeyDay3Goal;

  /// No description provided for @journeyDay3Action.
  ///
  /// In en, this message translates to:
  /// **'Complete any session before end of day'**
  String get journeyDay3Action;

  /// No description provided for @journeyDay3Milestone.
  ///
  /// In en, this message translates to:
  /// **'3 Day Streak'**
  String get journeyDay3Milestone;

  /// No description provided for @journeyDay4Title.
  ///
  /// In en, this message translates to:
  /// **'Afternoon slump'**
  String get journeyDay4Title;

  /// No description provided for @journeyDay4Goal.
  ///
  /// In en, this message translates to:
  /// **'Try Smart Break at 3pm'**
  String get journeyDay4Goal;

  /// No description provided for @journeyDay4Action.
  ///
  /// In en, this message translates to:
  /// **'Respond to smart break prompt'**
  String get journeyDay4Action;

  /// No description provided for @journeyDay5Title.
  ///
  /// In en, this message translates to:
  /// **'Explore library'**
  String get journeyDay5Title;

  /// No description provided for @journeyDay5Goal.
  ///
  /// In en, this message translates to:
  /// **'Try a new pain area program'**
  String get journeyDay5Goal;

  /// No description provided for @journeyDay5Action.
  ///
  /// In en, this message translates to:
  /// **'Open Sessions and pick Neck Relief'**
  String get journeyDay5Action;

  /// No description provided for @journeyDay6Title.
  ///
  /// In en, this message translates to:
  /// **'Weekend prep'**
  String get journeyDay6Title;

  /// No description provided for @journeyDay6Goal.
  ///
  /// In en, this message translates to:
  /// **'Set reminder schedule'**
  String get journeyDay6Goal;

  /// No description provided for @journeyDay6Action.
  ///
  /// In en, this message translates to:
  /// **'Review reminder settings'**
  String get journeyDay6Action;

  /// No description provided for @journeyDay7Title.
  ///
  /// In en, this message translates to:
  /// **'Week 1 recap'**
  String get journeyDay7Title;

  /// No description provided for @journeyDay7Goal.
  ///
  /// In en, this message translates to:
  /// **'Review weekly progress'**
  String get journeyDay7Goal;

  /// No description provided for @journeyDay7Action.
  ///
  /// In en, this message translates to:
  /// **'Open weekly recap and see mobility score change'**
  String get journeyDay7Action;

  /// No description provided for @journeyDay7Milestone.
  ///
  /// In en, this message translates to:
  /// **'Week 1 Complete'**
  String get journeyDay7Milestone;

  /// No description provided for @journeyDay8Title.
  ///
  /// In en, this message translates to:
  /// **'Deeper recovery'**
  String get journeyDay8Title;

  /// No description provided for @journeyDay8Goal.
  ///
  /// In en, this message translates to:
  /// **'Complete Evening Deep Recovery'**
  String get journeyDay8Goal;

  /// No description provided for @journeyDay8Action.
  ///
  /// In en, this message translates to:
  /// **'12 min evening session before bed'**
  String get journeyDay8Action;

  /// No description provided for @journeyDay10Title.
  ///
  /// In en, this message translates to:
  /// **'Progress check'**
  String get journeyDay10Title;

  /// No description provided for @journeyDay10Goal.
  ///
  /// In en, this message translates to:
  /// **'Review your weekly stats'**
  String get journeyDay10Goal;

  /// No description provided for @journeyDay10Action.
  ///
  /// In en, this message translates to:
  /// **'See sessions and pain trends on Progress'**
  String get journeyDay10Action;

  /// No description provided for @journeyDay14Title.
  ///
  /// In en, this message translates to:
  /// **'2 week milestone'**
  String get journeyDay14Title;

  /// No description provided for @journeyDay14Goal.
  ///
  /// In en, this message translates to:
  /// **'14 day streak or 10+ sessions'**
  String get journeyDay14Goal;

  /// No description provided for @journeyDay14Action.
  ///
  /// In en, this message translates to:
  /// **'Unlock achievement badge'**
  String get journeyDay14Action;

  /// No description provided for @journeyDay14Milestone.
  ///
  /// In en, this message translates to:
  /// **'2 Week Warrior'**
  String get journeyDay14Milestone;

  /// No description provided for @journeyDay15Title.
  ///
  /// In en, this message translates to:
  /// **'Halfway point'**
  String get journeyDay15Title;

  /// No description provided for @journeyDay15Goal.
  ///
  /// In en, this message translates to:
  /// **'Review journey map'**
  String get journeyDay15Goal;

  /// No description provided for @journeyDay15Action.
  ///
  /// In en, this message translates to:
  /// **'See Day 1 to 30 progress on journey map'**
  String get journeyDay15Action;

  /// No description provided for @journeyDay21Title.
  ///
  /// In en, this message translates to:
  /// **'Week 3 recap'**
  String get journeyDay21Title;

  /// No description provided for @journeyDay21Goal.
  ///
  /// In en, this message translates to:
  /// **'Weekly recap + share progress'**
  String get journeyDay21Goal;

  /// No description provided for @journeyDay21Action.
  ///
  /// In en, this message translates to:
  /// **'Review 3 week mobility trend'**
  String get journeyDay21Action;

  /// No description provided for @journeyDay30Title.
  ///
  /// In en, this message translates to:
  /// **'30 day graduate'**
  String get journeyDay30Title;

  /// No description provided for @journeyDay30Goal.
  ///
  /// In en, this message translates to:
  /// **'Complete 30 day program'**
  String get journeyDay30Goal;

  /// No description provided for @journeyDay30Action.
  ///
  /// In en, this message translates to:
  /// **'Final assessment + unlock premium trial'**
  String get journeyDay30Action;

  /// No description provided for @journeyDay30Milestone.
  ///
  /// In en, this message translates to:
  /// **'30 Day Graduate'**
  String get journeyDay30Milestone;

  /// No description provided for @journeyDayDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily desk break'**
  String get journeyDayDefaultTitle;

  /// No description provided for @journeyDayDefaultGoal.
  ///
  /// In en, this message translates to:
  /// **'Complete at least one session'**
  String get journeyDayDefaultGoal;

  /// No description provided for @journeyDayDefaultAction.
  ///
  /// In en, this message translates to:
  /// **'Do a 3 to 5 min mobility break at your desk'**
  String get journeyDayDefaultAction;

  /// No description provided for @achievementFirstBreakTitle.
  ///
  /// In en, this message translates to:
  /// **'First Break'**
  String get achievementFirstBreakTitle;

  /// No description provided for @achievementFirstBreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Completed your first desk session'**
  String get achievementFirstBreakDesc;

  /// No description provided for @achievementStreak3Title.
  ///
  /// In en, this message translates to:
  /// **'3 Day Streak'**
  String get achievementStreak3Title;

  /// No description provided for @achievementStreak3Desc.
  ///
  /// In en, this message translates to:
  /// **'Moved 3 days in a row'**
  String get achievementStreak3Desc;

  /// No description provided for @achievementWeek1Title.
  ///
  /// In en, this message translates to:
  /// **'Week 1 Complete'**
  String get achievementWeek1Title;

  /// No description provided for @achievementWeek1Desc.
  ///
  /// In en, this message translates to:
  /// **'Finished your first week'**
  String get achievementWeek1Desc;

  /// No description provided for @achievementStreak14Title.
  ///
  /// In en, this message translates to:
  /// **'2 Week Warrior'**
  String get achievementStreak14Title;

  /// No description provided for @achievementStreak14Desc.
  ///
  /// In en, this message translates to:
  /// **'14 days of desk recovery'**
  String get achievementStreak14Desc;

  /// No description provided for @achievementScore60Title.
  ///
  /// In en, this message translates to:
  /// **'Mobility 60+'**
  String get achievementScore60Title;

  /// No description provided for @achievementScore60Desc.
  ///
  /// In en, this message translates to:
  /// **'Mobility score reached 60'**
  String get achievementScore60Desc;

  /// No description provided for @achievementGraduate30Title.
  ///
  /// In en, this message translates to:
  /// **'30 Day Graduate'**
  String get achievementGraduate30Title;

  /// No description provided for @achievementGraduate30Desc.
  ///
  /// In en, this message translates to:
  /// **'Completed the full program'**
  String get achievementGraduate30Desc;

  /// No description provided for @moodStressed.
  ///
  /// In en, this message translates to:
  /// **'Stressed'**
  String get moodStressed;

  /// No description provided for @moodStressedSoundscape.
  ///
  /// In en, this message translates to:
  /// **'Deep breath ambient'**
  String get moodStressedSoundscape;

  /// No description provided for @moodStressedDesc.
  ///
  /// In en, this message translates to:
  /// **'Slow exhale tones to calm your nervous system'**
  String get moodStressedDesc;

  /// No description provided for @moodTired.
  ///
  /// In en, this message translates to:
  /// **'Tired'**
  String get moodTired;

  /// No description provided for @moodTiredSoundscape.
  ///
  /// In en, this message translates to:
  /// **'Soft rain'**
  String get moodTiredSoundscape;

  /// No description provided for @moodTiredDesc.
  ///
  /// In en, this message translates to:
  /// **'Gentle rainfall to ease mental fatigue'**
  String get moodTiredDesc;

  /// No description provided for @moodSore.
  ///
  /// In en, this message translates to:
  /// **'Sore'**
  String get moodSore;

  /// No description provided for @moodSoreSoundscape.
  ///
  /// In en, this message translates to:
  /// **'Warm low tones'**
  String get moodSoreSoundscape;

  /// No description provided for @moodSoreDesc.
  ///
  /// In en, this message translates to:
  /// **'Soothing frequencies for tight muscles'**
  String get moodSoreDesc;

  /// No description provided for @moodFocused.
  ///
  /// In en, this message translates to:
  /// **'Focused'**
  String get moodFocused;

  /// No description provided for @moodFocusedSoundscape.
  ///
  /// In en, this message translates to:
  /// **'Minimal focus pad'**
  String get moodFocusedSoundscape;

  /// No description provided for @moodFocusedDesc.
  ///
  /// In en, this message translates to:
  /// **'Light rhythm to stay present during stretches'**
  String get moodFocusedDesc;

  /// No description provided for @moodCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get moodCalm;

  /// No description provided for @moodCalmSoundscape.
  ///
  /// In en, this message translates to:
  /// **'Desk zen'**
  String get moodCalmSoundscape;

  /// No description provided for @moodCalmDesc.
  ///
  /// In en, this message translates to:
  /// **'Quiet background for the office'**
  String get moodCalmDesc;

  /// No description provided for @proLockCtaDefault.
  ///
  /// In en, this message translates to:
  /// **'Start 7 day free trial'**
  String get proLockCtaDefault;

  /// No description provided for @upsellDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Want more from every break?'**
  String get upsellDefaultTitle;

  /// No description provided for @upsellDefaultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock AI plans, mood soundscapes, posture scan & 50+ programs.'**
  String get upsellDefaultSubtitle;

  /// No description provided for @proFeature50Programs.
  ///
  /// In en, this message translates to:
  /// **'50+ Programs'**
  String get proFeature50Programs;

  /// No description provided for @proFeature50ProgramsSub.
  ///
  /// In en, this message translates to:
  /// **'Full desk library'**
  String get proFeature50ProgramsSub;

  /// No description provided for @proFeatureAiPosture.
  ///
  /// In en, this message translates to:
  /// **'AI Posture'**
  String get proFeatureAiPosture;

  /// No description provided for @proFeatureAiPostureSub.
  ///
  /// In en, this message translates to:
  /// **'Scan & track'**
  String get proFeatureAiPostureSub;

  /// No description provided for @proFeatureAiDailyPlan.
  ///
  /// In en, this message translates to:
  /// **'AI Daily Plan'**
  String get proFeatureAiDailyPlan;

  /// No description provided for @proFeatureAiDailyPlanSub.
  ///
  /// In en, this message translates to:
  /// **'Personalized'**
  String get proFeatureAiDailyPlanSub;

  /// No description provided for @proFeatureSmartBreaks.
  ///
  /// In en, this message translates to:
  /// **'Smart Breaks'**
  String get proFeatureSmartBreaks;

  /// No description provided for @proFeatureSmartBreaksSub.
  ///
  /// In en, this message translates to:
  /// **'Timed reminders'**
  String get proFeatureSmartBreaksSub;

  /// No description provided for @proFeatureWeeklyReport.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get proFeatureWeeklyReport;

  /// No description provided for @proFeatureWeeklyReportSub.
  ///
  /// In en, this message translates to:
  /// **'AI progress'**
  String get proFeatureWeeklyReportSub;

  /// No description provided for @proFeatureMoodSounds.
  ///
  /// In en, this message translates to:
  /// **'Mood Sounds'**
  String get proFeatureMoodSounds;

  /// No description provided for @proFeatureMoodSoundsSub.
  ///
  /// In en, this message translates to:
  /// **'Ambient audio'**
  String get proFeatureMoodSoundsSub;

  /// No description provided for @proFeatureDesktopApp.
  ///
  /// In en, this message translates to:
  /// **'Desktop App'**
  String get proFeatureDesktopApp;

  /// No description provided for @proFeatureDesktopAppSub.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get proFeatureDesktopAppSub;

  /// No description provided for @comingSoonBadge.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get comingSoonBadge;

  /// No description provided for @desktopCompanionComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Desktop companion coming soon!'**
  String get desktopCompanionComingSoon;

  /// No description provided for @aiPlanBelowHint.
  ///
  /// In en, this message translates to:
  /// **'Your AI plan is below in Today\'s Sessions'**
  String get aiPlanBelowHint;

  /// No description provided for @cancelProTrialTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Pro trial?'**
  String get cancelProTrialTitle;

  /// No description provided for @cancelProTrialBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ll lose access to AI plans, posture analysis, and the full exercise library. Your progress and streak stay saved.'**
  String get cancelProTrialBody;

  /// No description provided for @keepPro.
  ///
  /// In en, this message translates to:
  /// **'Keep Pro'**
  String get keepPro;

  /// No description provided for @proTrialCancelled.
  ///
  /// In en, this message translates to:
  /// **'Pro trial cancelled. You\'re on the free plan.'**
  String get proTrialCancelled;

  /// No description provided for @permissionNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow break reminders'**
  String get permissionNotificationsTitle;

  /// No description provided for @permissionNotificationsRationale.
  ///
  /// In en, this message translates to:
  /// **'CalmCalibrate sends desk break reminders during your work hours so you stay mobile and pain-free. You can turn these off anytime in Settings.'**
  String get permissionNotificationsRationale;

  /// No description provided for @permissionCameraTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera access for posture scan'**
  String get permissionCameraTitle;

  /// No description provided for @permissionCameraRationale.
  ///
  /// In en, this message translates to:
  /// **'CalmCalibrate uses the camera to analyze your posture during the mobility assessment. Video is processed on your device and is not uploaded.'**
  String get permissionCameraRationale;

  /// No description provided for @permissionExactAlarmRationale.
  ///
  /// In en, this message translates to:
  /// **'Allows break reminders to arrive at the exact times you schedule, even when the app is in the background.'**
  String get permissionExactAlarmRationale;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'pt',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'pt':
      return AppLocalizationsPt();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
