import 'package:calm_calibrate/core/animations/scale_tap.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

class SelectableChip extends StatelessWidget {
  SelectableChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.subtitle,
    this.expanded = false,
    this.centered = false,
    this.minHeight,
  });

  final String label;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;
  final bool expanded;

  /// Center label/subtitle — use in equal-width rows.
  final bool centered;

  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final child = ScaleTap(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        constraints: minHeight != null
            ? BoxConstraints(minHeight: minHeight!)
            : null,
        width: expanded ? double.infinity : null,
        padding: EdgeInsets.symmetric(
          horizontal: centered ? 12 : 20,
          vertical: centered ? 14 : 16,
        ),
        decoration: BoxDecoration(
          color: selected ? c.primaryLight : c.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? c.primary : c.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment:
              centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              textAlign: centered ? TextAlign.center : TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: centered ? 16 : 15,
                height: 1.15,
                color: selected ? c.primary : c.textPrimary,
              ),
            ),
            if (subtitle != null) ...[
              SizedBox(height: 2),
              Text(
                subtitle!,
                textAlign: centered ? TextAlign.center : TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  color: selected ? c.primary.withValues(alpha: 0.75) : c.textMuted,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    if (expanded) {
      return SizedBox(width: double.infinity, child: child);
    }
    return child;
  }
}
