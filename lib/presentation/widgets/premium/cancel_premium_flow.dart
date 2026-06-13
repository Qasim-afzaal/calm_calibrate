import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/data/repositories/subscription_repository.dart';
import 'package:flutter/material.dart';

/// Confirms and cancels Pro / free trial — user returns to free tier.
Future<bool> cancelPremiumSubscription(BuildContext context) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final c = ctx.appColors;
      return AlertDialog(
      backgroundColor: c.surface,
      title: Text('Cancel Pro trial?'),
      content: Text(
        'You\'ll lose access to AI plans, posture analysis, '
        'and the full exercise library. Your progress and streak stay saved.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text('Keep Pro'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          style: TextButton.styleFrom(foregroundColor: c.primary),
          child: Text('Cancel trial'),
        ),
      ],
    );
    },
  );

  if (confirmed != true) return false;

  await SubscriptionRepository.instance.cancelPremium();

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pro trial cancelled. You\'re on the free plan.'),
      ),
    );
  }

  return true;
}
