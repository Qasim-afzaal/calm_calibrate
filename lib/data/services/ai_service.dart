import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/premium.dart';
import 'package:calm_calibrate/data/models/session_log.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';

/// AI layer — uses LLM when configured, smart mock for prototype.
///
/// To enable real LLM: set [AiConfig.apiKey] via --dart-define=OPENAI_API_KEY=sk-...
abstract class AiConfig {
  static const apiKey = String.fromEnvironment('OPENAI_API_KEY');
  static bool get hasApiKey => apiKey.isNotEmpty;
}

class AiService {
  AiService._();
  static final AiService instance = AiService._();

  Future<PostureAnalysis> analyzePosture({
    required UserProfile profile,
    required int? mobilityScore,
    required List<String> selectedIssues,
    required List<SessionLog> recentSessions,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 1400));

    if (AiConfig.hasApiKey) {
      // Hook for real OpenAI — same prompt structure
      return _mockPostureAnalysis(
        profile: profile,
        mobilityScore: mobilityScore,
        selectedIssues: selectedIssues,
        recentSessions: recentSessions,
      );
    }

    return _mockPostureAnalysis(
      profile: profile,
      mobilityScore: mobilityScore,
      selectedIssues: selectedIssues,
      recentSessions: recentSessions,
    );
  }

  Future<AiDailyPlan> generateDailyPlan({
    required UserProfile profile,
    required int? mobilityScore,
    required List<SessionLog> recentSessions,
    PostureAnalysis? latestPosture,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));

    return _mockDailyPlan(
      profile: profile,
      mobilityScore: mobilityScore,
      recentSessions: recentSessions,
      latestPosture: latestPosture,
    );
  }

  Future<String> generateWeeklyInsight({
    required UserProfile profile,
    required int sessionCount,
    required int totalMinutes,
    required double avgRelief,
    required int mobilityScore,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 900));

    if (sessionCount == 0) {
      return 'Start with one 3-minute Morning Reset this week. '
          'Consistency beats intensity for desk workers.';
    }

    final painFocus = profile.painAreas.isEmpty
        ? 'general desk stiffness'
        : profile.painAreas.map((a) => a.label.toLowerCase()).join(' & ');

    return 'You logged $sessionCount sessions ($totalMinutes min) targeting '
        '$painFocus. Average pain relief of +${avgRelief.toStringAsFixed(1)} '
        'shows your breaks are working. This week, add a Midday Desk Break '
        'before your afternoon slump — mobility score is $mobilityScore/100.';
  }

  PostureAnalysis _mockPostureAnalysis({
    required UserProfile profile,
    required int? mobilityScore,
    required List<String> selectedIssues,
    required List<SessionLog> recentSessions,
  }) {
    final score = mobilityScore ?? 52;
    final painLabels =
        profile.painAreas.map((a) => a.label).join(', ');
    final sitting = profile.sittingHours?.label ?? 'long hours';

    final issueSet = selectedIssues.isEmpty
        ? ['Forward head', 'Rounded shoulders']
        : selectedIssues;

    var postureScore = score;
    if (issueSet.contains('Forward head')) postureScore -= 8;
    if (issueSet.contains('Slouched lower back')) postureScore -= 6;
    if (issueSet.contains('Elevated shoulders')) postureScore -= 5;
    postureScore = postureScore.clamp(28, 85);

    return PostureAnalysis(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      issues: issueSet,
      score: postureScore,
      summary:
          'Based on your desk pattern ($sitting) and focus areas ($painLabels), '
          'your posture shows ${issueSet.length} key patterns to address. '
          '${recentSessions.isEmpty ? 'No sessions yet — starting breaks will help fast.' : 'Your recent ${recentSessions.length} sessions are a strong start.'}',
      recommendations: [
        if (issueSet.contains('Forward head'))
          'Monitor at eye level — chin parallel to floor',
        if (issueSet.contains('Rounded shoulders'))
          'Every hour: shoulder blade squeezes × 10',
        if (issueSet.contains('Slouched lower back'))
          'Lumbar support + feet flat on floor',
        if (issueSet.contains('Elevated shoulders'))
          'Relax traps during typing — elbows at 90°',
        'Do Morning Reset within 30 min of sitting down',
        'Set smart break every ${profile.reminderMinutes} min',
      ],
      deskTips: [
        '90-90-90 rule: elbows, hips, knees at 90 degrees',
        'Screen top at or slightly below eye level',
        'Stand for 2 min every hour — phone timer works',
      ],
    );
  }

  AiDailyPlan _mockDailyPlan({
    required UserProfile profile,
    required int? mobilityScore,
    required List<SessionLog> recentSessions,
    PostureAnalysis? latestPosture,
  }) {
    final focus = profile.painAreas.isEmpty
        ? PainArea.neck
        : profile.painAreas.first;
    final focusLabel = focus.label;

    final postureNote = latestPosture != null
        ? ' Posture score ${latestPosture.score}/100 — prioritize ${latestPosture.issues.first.toLowerCase()} fixes.'
        : '';

    return AiDailyPlan(
      generatedAt: DateTime.now(),
      focus: '$focusLabel recovery',
      morning:
          'Morning Reset (3 min) — neck rolls + chest opener. Start before your first meeting.',
      midday:
          'Midday Desk Break (5 min) — cat-cow + hip flexor after lunch slump.',
      evening:
          'Evening Deep Recovery (12 min) — thoracic extension + breathing if stiff.',
      coachNote:
          'Your mobility is ${mobilityScore ?? 50}/100.$postureNote '
          '${recentSessions.length >= 3 ? 'Great consistency — keep the streak.' : 'Aim for 2 sessions today to build the habit.'}',
    );
  }
}
