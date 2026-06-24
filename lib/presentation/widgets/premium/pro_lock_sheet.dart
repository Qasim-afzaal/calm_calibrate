import 'package:calm_calibrate/core/config/subscription_features.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/buttons/app_button.dart';
import 'package:calm_calibrate/core/widgets/layout/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Bottom sheet upsell — use at Pro gates in the user flow.
Future<void> showProLockSheet(
  BuildContext context, {
  required String feature,
  required String benefit,
  String? ctaLabel,
}) {
  if (!SubscriptionFeatures.enabled) return Future.value();
  return AppBottomSheet.show(
    context,
    children: [
      Builder(
        builder: (ctx) {
          final c = ctx.appColors;
          final l10n = ctx.l10n;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: c.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_rounded,
                    color: c.primary,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                feature,
                textAlign: TextAlign.center,
                style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                benefit,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: c.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              AppButton(
                label: ctaLabel ?? l10n.proLockCtaDefault,
                onPressed: () {
                  Navigator.pop(ctx);
                  context.push('/premium');
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(l10n.maybeLater),
              ),
            ],
          );
        },
      ),
    ],
  );
}
