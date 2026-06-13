import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReEngagementScreen extends StatelessWidget {
  ReEngagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Text('👋', style: TextStyle(fontSize: 64)),
              SizedBox(height: 24),
              Text(
                'We miss you!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 12),
              Text(
                'Your neck and back don\'t take days off. '
                'One 90-second break is all it takes to get back on track.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: c.textSecondary,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: c.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Quick comeback session',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Neck Relief · 3 min · No equipment',
                      style: TextStyle(color: c.textSecondary),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
              PrimaryButton(
                label: 'Do a 3-min comeback',
                onPressed: () =>
                    context.push('/pre-workout/morning_reset'),
              ),
              SizedBox(height: 12),
              PrimaryButton(
                label: 'Remind me tomorrow',
                variant: PrimaryButtonVariant.outlined,
                onPressed: () => context.go('/home'),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
