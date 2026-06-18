import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReEngagementScreen extends StatelessWidget {
  const ReEngagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] re_engagement loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    return Scaffold(
      body: ResponsiveScrollBody(
        fillViewport: true,
        child: Column(
          children: [
            const Spacer(),
            Container(
              padding: EdgeInsets.all(m.onboardingSectionGap),
              decoration: BoxDecoration(
                color: c.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.waving_hand_outlined,
                size: m.isCompact ? 40 : 48,
                color: c.primary,
              ),
            ),
            SizedBox(height: m.onboardingSectionGap),
            Text(
              'We miss you!',
              style: m.headlineLargeStyle(Theme.of(context).textTheme),
            ),
            SizedBox(height: m.sectionGap + 4),
            Text(
              'Your neck and back don\'t take days off. '
              'One 90 second break is all it takes to get back on track.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: c.textSecondary,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: m.blockSpacing),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(m.stackSpacing),
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
            const Spacer(flex: 2),
            PrimaryButton(
              label: 'Do a 3 min comeback',
              onPressed: () => context.push('/pre-workout/morning_reset'),
            ),
            SizedBox(height: m.sectionGap + 4),
            PrimaryButton(
              label: 'Remind me tomorrow',
              variant: PrimaryButtonVariant.outlined,
              onPressed: () => context.go('/home'),
            ),
          ],
        ),
      ),
    );
  }
}
