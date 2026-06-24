import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';

/// Confirms and cancels Pro / free trial — user returns to free tier.
Future<bool> cancelPremiumSubscription(BuildContext context) async {
  final l10n = context.l10n;
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final c = ctx.appColors;
      final dialogL10n = ctx.l10n;
      return AlertDialog(
        backgroundColor: c.surface,
        title: Text(dialogL10n.cancelProTrialTitle),
        content: Text(dialogL10n.cancelProTrialBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(dialogL10n.keepPro),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: c.primary),
            child: Text(dialogL10n.cancelTrial),
          ),
        ],
      );
    },
  );

  if (confirmed != true) return false;

  await SubscriptionRepository.instance.cancelPremium();

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.proTrialCancelled)),
    );
  }

  return true;
}
