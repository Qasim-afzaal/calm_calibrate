import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenScaffold extends StatelessWidget {
  ScreenScaffold({
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
    return Scaffold(
      appBar: showBack
          ? AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, size: 20),
                onPressed: () => context.pop(),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (topWidget != null) ...[topWidget!, SizedBox(height: 16)],
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              if (subtitle != null) ...[
                SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: TextStyle(color: c.textSecondary),
                ),
              ],
              SizedBox(height: 20),
              Expanded(child: child),
              if (bottom != null) ...[bottom!, SizedBox(height: 24)],
            ],
          ),
        ),
      ),
    );
  }
}
