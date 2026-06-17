import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.showBack = true,
    this.bottom,
    this.topWidget,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final bool showBack;
  final Widget? bottom;
  final Widget? topWidget;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    return Scaffold(
      appBar: showBack
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                onPressed: () => context.pop(),
              ),
            )
          : null,
      body: SafeArea(
        child: ResponsiveContent(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: m.horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (topWidget != null) ...[
                  topWidget!,
                  SizedBox(height: m.stackSpacing),
                ],
                Text(title, style: m.headlineStyle(Theme.of(context).textTheme)),
                if (subtitle != null) ...[
                  SizedBox(height: m.onboardingTitleGap),
                  Text(
                    subtitle!,
                    style: TextStyle(color: c.textSecondary),
                  ),
                ],
                SizedBox(height: m.stackSpacing),
                Expanded(child: child),
                if (bottom != null) ...[
                  bottom!,
                  SizedBox(height: m.onboardingBottomGap),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
