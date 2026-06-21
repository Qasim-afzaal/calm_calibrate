import 'dart:async';

import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/exercise/exercise_pose_animation.dart';
import 'package:calm_calibrate/data/models/exercise.dart';
import 'package:flutter/material.dart';

class PaywallExerciseSlide {
  PaywallExerciseSlide({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.pose,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String duration;
  final ExercisePose pose;
  final IconData icon;
}

/// Auto-advancing exercise carousel for paywall.
class PaywallExerciseSlider extends StatefulWidget {
  PaywallExerciseSlider({
    super.key,
    this.slideHeight,
    this.poseSize,
  });

  static bool globallyEnabled = true;

  final double? slideHeight;
  final double? poseSize;

  static final slides = [
    PaywallExerciseSlide(
      title: 'Neck Rolls',
      subtitle: 'Morning Reset · at your desk',
      duration: '3 min',
      pose: ExercisePose.neckRoll,
      icon: Icons.wb_twilight_rounded,
    ),
    PaywallExerciseSlide(
      title: 'Seated Cat Cow',
      subtitle: 'Midday Desk Break',
      duration: '5 min',
      pose: ExercisePose.seatedCatCow,
      icon: Icons.wb_sunny_rounded,
    ),
    PaywallExerciseSlide(
      title: 'Hip Flexor Stretch',
      subtitle: 'Hip Opener program',
      duration: '6 min',
      pose: ExercisePose.hipFlexorStretch,
      icon: Icons.accessibility_new_outlined,
    ),
    PaywallExerciseSlide(
      title: 'Shoulder Shrugs',
      subtitle: 'Shoulder Melt release',
      duration: '4 min',
      pose: ExercisePose.shoulderShrug,
      icon: Icons.self_improvement_outlined,
    ),
    PaywallExerciseSlide(
      title: 'Chest Opener',
      subtitle: 'Back Saver · posture fix',
      duration: '5 min',
      pose: ExercisePose.chestOpener,
      icon: Icons.chair_outlined,
    ),
    PaywallExerciseSlide(
      title: 'Deep Breathing',
      subtitle: 'Evening recovery',
      duration: '12 min',
      pose: ExercisePose.deepBreathing,
      icon: Icons.nightlight_round,
    ),
  ];

  @override
  State<PaywallExerciseSlider> createState() => _PaywallExerciseSliderState();
}

class _PaywallExerciseSliderState extends State<PaywallExerciseSlider> {
  static const _slideDuration = Duration(milliseconds: 4500);
  static const _pageAnimDuration = Duration(milliseconds: 700);

  final _pageController = PageController(viewportFraction: 0.88);
  Timer? _autoTimer;
  bool _userDragging = false;

  @override
  void initState() {
    super.initState();
    if (PaywallExerciseSlider.globallyEnabled) {
      _autoTimer = Timer.periodic(_slideDuration, (_) => _next());
    }
  }

  void _next() {
    if (!mounted || !_pageController.hasClients || _userDragging) return;
    final current = _pageController.page?.round() ?? 0;
    final next = (current + 1) % PaywallExerciseSlider.slides.length;
    _pageController.animateToPage(
      next,
      duration: _pageAnimDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final metrics = MediaQuery.sizeOf(context);
    final slideH = widget.slideHeight ??
        (metrics.height < 640
            ? 112.0
            : metrics.height < 700
                ? 132.0
                : 156.0);
    final poseSize = widget.poseSize ??
        (metrics.height < 640
            ? 72.0
            : metrics.height < 700
                ? 86.0
                : 96.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: slideH,
          child: NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n is ScrollStartNotification && n.dragDetails != null) {
                _userDragging = true;
              } else if (n is ScrollEndNotification) {
                _userDragging = false;
              }
              return false;
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: PaywallExerciseSlider.slides.length,
              itemBuilder: (context, i) {
                final slide = PaywallExerciseSlider.slides[i];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    var scale = 1.0;
                    if (_pageController.hasClients) {
                      final page = _pageController.page ?? i.toDouble();
                      scale = (1 - (page - i).abs() * 0.06).clamp(0.94, 1.0);
                    }
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: _SlideCard(slide: slide, poseSize: poseSize),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        AnimatedBuilder(
          animation: _pageController,
          builder: (context, _) {
        final c = context.appColors;
            final page = _pageController.hasClients
                ? (_pageController.page ?? 0.0)
                : 0.0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(PaywallExerciseSlider.slides.length, (i) {
                final dist = (page - i).abs();
                final width = 6 + (1 - dist.clamp(0.0, 1.0)) * 12;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  width: width,
                  height: 6,
                  decoration: BoxDecoration(
                    color: dist < 0.5
                        ? c.primary
                        : Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

class _SlideCard extends StatelessWidget {
  _SlideCard({required this.slide, required this.poseSize});

  final PaywallExerciseSlide slide;
  final double poseSize;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(slide.icon, size: 20, color: c.primary),
                  SizedBox(height: 4),
                  Text(
                    slide.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    slide.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: c.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      slide.duration,
                      style: TextStyle(
                        color: c.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ExercisePoseAnimation(
              key: ValueKey(slide.pose.name),
              pose: slide.pose,
              size: poseSize,
            ),
          ),
        ],
      ),
    );
  }
}
