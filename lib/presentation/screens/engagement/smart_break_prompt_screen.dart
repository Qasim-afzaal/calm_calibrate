import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/content_l10n.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/data/local/app_cache.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:calm_calibrate/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartBreakPromptScreen extends StatelessWidget {
  const SmartBreakPromptScreen({super.key});

  String _breakMessage(AppLocalizations l10n) {
    if (SubscriptionRepository.instance.hasProAccess) {
      final posture = AppCache.instance.latestPostureAnalysis;
      if (posture != null && posture.issues.isNotEmpty) {
        return l10n.smartBreakAiMessage(posture.issues.first.toLowerCase());
      }
      return l10n.smartBreakProMessage;
    }
    return l10n.smartBreakFreeMessage;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[CalmCalibrate] smart_break loaded'); // auth-check-debug
    final c = context.appColors;
    final m = context.metrics;
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: m.contentMaxWidth),
          child: Container(
            margin: m.screenPaddingAll,
            padding: m.screenPaddingAll,
            decoration: BoxDecoration(
              color: c.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(m.stackSpacing),
                  decoration: BoxDecoration(
                    color: c.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.bolt,
                    color: c.primary,
                    size: m.isCompact ? 30 : 36,
                  ),
                ),
                SizedBox(height: m.stackSpacing),
                Text(
                  l10n.smartBreakPromptTitle,
                  style: TextStyle(
                    fontSize: m.headlineSize - 2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  _breakMessage(l10n),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: c.textSecondary),
                ),
                SizedBox(height: m.onboardingSectionGap),
                PrimaryButton(
                  label: l10n.start90SecBreak,
                  onPressed: () {
                    Navigator.pop(context);
                    context.push('/pre-workout/midday_break');
                  },
                ),
                SizedBox(height: m.sectionGap + 2),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.snooze15Min),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
