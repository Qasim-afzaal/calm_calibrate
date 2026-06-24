import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
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
    final l10n = context.l10n;
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
              l10n.weMissYou,
              style: m.headlineLargeStyle(Theme.of(context).textTheme),
            ),
            SizedBox(height: m.sectionGap + 4),
            Text(
              l10n.reEngagementBody,
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
                    l10n.quickComebackSession,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    l10n.comebackSessionDetails,
                    style: TextStyle(color: c.textSecondary),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            PrimaryButton(
              label: l10n.do3MinComeback,
              onPressed: () => context.push('/pre-workout/morning_reset'),
            ),
            SizedBox(height: m.sectionGap + 4),
            PrimaryButton(
              label: l10n.remindMeTomorrow,
              variant: PrimaryButtonVariant.outlined,
              onPressed: () => context.go('/home'),
            ),
          ],
        ),
      ),
    );
  }
}
