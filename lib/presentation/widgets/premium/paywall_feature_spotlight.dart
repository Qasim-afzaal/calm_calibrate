import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

/// Auto-cycling feature spotlight — smooth cross-fade loop.
class PaywallFeatureSpotlight extends StatefulWidget {
  PaywallFeatureSpotlight({
    super.key,
    required this.features,
  });

  final List<PaywallSpotlightFeature> features;

  @override
  State<PaywallFeatureSpotlight> createState() =>
      _PaywallFeatureSpotlightState();
}

class PaywallSpotlightFeature {
  PaywallSpotlightFeature({
    required this.icon,
    required this.title,
    required this.hook,
  });

  final IconData icon;
  final String title;
  final String hook;
}

class _PaywallFeatureSpotlightState extends State<PaywallFeatureSpotlight> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _scheduleNext();
  }

  Future<void> _scheduleNext() async {
    await Future<void>.delayed(Duration(milliseconds: 3600));
    if (!mounted) return;
    setState(() => _index = (_index + 1) % widget.features.length);
    _scheduleNext();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final f = widget.features[_index];

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            ...previousChildren,
            ?currentChild,
          ],
        );
      },
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Container(
        key: ValueKey(_index),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.primary.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: c.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(f.icon, color: c.primary, size: 20),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    f.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    f.hook,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
