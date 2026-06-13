import 'dart:async';

import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';

class PaywallFeatureItem {
  PaywallFeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}

/// Swipeable Pro feature cards — compact on small screens.
class PaywallFeaturesCarousel extends StatefulWidget {
  PaywallFeaturesCarousel({
    super.key,
    required this.features,
    this.cardHeight,
    this.compact = false,
    this.showTitle = true,
  });

  static bool globallyEnabled = true;

  final List<PaywallFeatureItem> features;
  final double? cardHeight;
  final bool compact;
  final bool showTitle;

  @override
  State<PaywallFeaturesCarousel> createState() =>
      _PaywallFeaturesCarouselState();
}

class _PaywallFeaturesCarouselState extends State<PaywallFeaturesCarousel> {
  final _controller = PageController(viewportFraction: 0.9);
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    if (PaywallFeaturesCarousel.globallyEnabled) {
      _timer = Timer.periodic(Duration(seconds: 4), (_) => _next());
    }
  }

  void _next() {
    if (!mounted || !_controller.hasClients || widget.features.isEmpty) return;
    final next = (_index + 1) % widget.features.length;
    _controller.animateToPage(
      next,
      duration: Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final cardH = widget.cardHeight ?? (widget.compact ? 88.0 : 96.0);
    final iconSize = widget.compact ? 36.0 : 40.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          Padding(
            padding: EdgeInsets.only(left: 4, bottom: widget.compact ? 6 : 8),
            child: Text(
              'Everything in Pro',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: widget.compact ? 13 : 14,
              ),
            ),
          ),
        SizedBox(
          height: cardH,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.features.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) {
              final f = widget.features[i];
              return _FeatureCard(
                feature: f,
                compact: widget.compact,
                iconSize: iconSize,
              );
            },
          ),
        ),
        SizedBox(height: widget.compact ? 6 : 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.features.length, (i) {
            final active = i == _index;
            return AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 2),
              width: active ? (widget.compact ? 12.0 : 14.0) : 5,
              height: 5,
              decoration: BoxDecoration(
                color: active
                    ? c.primary
                    : Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  _FeatureCard({
    required this.feature,
    required this.compact,
    required this.iconSize,
  });

  final PaywallFeatureItem feature;
  final bool compact;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: compact ? 8 : 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.primary.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  c.primary.withValues(alpha: 0.35),
                  c.primary.withValues(alpha: 0.12),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              feature.icon,
              color: c.primary,
              size: iconSize * 0.5,
            ),
          ),
          SizedBox(width: compact ? 8 : 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  feature.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: compact ? 13 : 14,
                  ),
                ),
                SizedBox(height: compact ? 2 : 3),
                Text(
                  feature.description,
                  maxLines: compact ? 2 : 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: compact ? 11 : 12,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
