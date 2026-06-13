import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Standard bottom sheet chrome — drag handle + padded body.
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.fromLTRB(24, 12, 24, 24),
  });

  final List<Widget> children;
  final EdgeInsets padding;

  static Future<T?> show<T>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets padding = const EdgeInsets.fromLTRB(24, 12, 24, 24),
  }) {
    return showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => AppBottomSheet(
        padding: padding,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return SafeArea(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: c.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }
}
