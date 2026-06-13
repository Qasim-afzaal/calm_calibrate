import 'package:calm_calibrate/core/constants/app_spacing.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/widgets.dart';
import 'package:calm_calibrate/presentation/widgets/feature_widgets.dart';
import 'package:calm_calibrate/data/repositories/engagement_repository.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyCheckInScreen extends StatefulWidget {
  DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  int _painScore = 3;
  final Set<String> _areas = {};

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final repo = EngagementRepository.instance;
    final day = repo.currentDay;
    final isPremium = SubscriptionRepository.instance.isPremium;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeSlideIn(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: c.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Day $day check-in',
                    style: TextStyle(
                      color: c.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeSlideIn(
                delay: Duration(milliseconds: 80),
                child: Text(
                  'How does your body feel today?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 8),
              FadeSlideIn(
                delay: Duration(milliseconds: 120),
                child: Text(
                  'This helps us pick the right routine for you.',
                  style: TextStyle(color: c.textSecondary),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Overall pain level',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              FadeSlideIn(
                delay: Duration(milliseconds: 160),
                child: PainScalePicker(
                  value: _painScore,
                  onChanged: (v) => setState(() => _painScore = v),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Trouble areas today',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    ['Neck', 'Back', 'Hips', 'Shoulders', 'Eyes'].map((area) {
                  final selected = _areas.contains(area);
                  return FilterChip(
                    label: Text(area),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        if (selected) {
                          _areas.remove(area);
                        } else {
                          _areas.add(area);
                        }
                      });
                    },
                    selectedColor: c.primaryLight,
                    checkmarkColor: c.primary,
                  );
                }).toList(),
              ),
              SizedBox(height: 28),
              if (isPremium)
                AiPostureSection(compact: true)
              else
                AiPostureLockedTeaser(),
              SizedBox(height: 28),
              FadeSlideIn(
                delay: Duration(milliseconds: 240),
                child: AppButton(
                  label: 'Continue to today\'s session',
                  onPressed: () {
                    repo.recordCheckIn(painScore: _painScore);
                    context.go('/home');
                  },
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
