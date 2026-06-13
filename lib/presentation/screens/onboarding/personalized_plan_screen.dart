import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:calm_calibrate/data/repositories/session_repository.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalizedPlanScreen extends StatelessWidget {
  PersonalizedPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final profile = MockUserRepository.instance.profile;
    final sessions =
        MockSessionRepository.instance.getTodaySessions(profile);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Plan'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalized for you',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              _planSubtitle(profile),
              style: TextStyle(color: c.textSecondary),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: sessions.length,
                separatorBuilder: (_, _) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _SessionPlanCard(session: sessions[index]);
                },
              ),
            ),
            PrimaryButton(
              label: 'Start My Plan',
              onPressed: () async {
                await MockUserRepository.instance.saveProfile(
                  profile.copyWith(onboardingComplete: true),
                );
                if (context.mounted) context.go('/home');
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  String _planSubtitle(UserProfile profile) {
    final areas = profile.painAreas.map((a) => a.label.toLowerCase()).join(', ');
    if (areas.isEmpty) return '3 daily sessions tailored to desk workers.';
    return 'Focused on $areas with smart break timing.';
  }
}

class _SessionPlanCard extends StatelessWidget {
  _SessionPlanCard({required this.session});

  final ExerciseSession session;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: c.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(session.icon, style: TextStyle(fontSize: 24)),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  session.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: c.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: c.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${session.durationMinutes} min',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: c.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
