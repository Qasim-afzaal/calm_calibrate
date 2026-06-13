import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_event.dart';
import 'package:calm_calibrate/presentation/blocs/assessment/assessment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AssessmentScreen extends StatelessWidget {
  AssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint('[CalmCalibrate] assessment loaded'); // auth-check-debug
    final c = context.appColors;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text('Mobility Assessment'),
      ),
      body: BlocConsumer<AssessmentBloc, AssessmentState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == AssessmentStatus.complete) {
            context.push('/onboarding/score');
          }
        },
        builder: (context, state) {
          final isScanning = state.status == AssessmentStatus.scanning;
          final m = context.metrics;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: m.horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: m.isCompact ? 8 : 16),
                Text(
                  isScanning ? 'Analyzing posture...' : 'Mobility Score',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: m.isCompact ? 22 : null,
                      ),
                ),
                SizedBox(height: m.isCompact ? 4 : 8),
                Text(
                  isScanning
                      ? 'Stand in profile view. Keep your whole body in frame.'
                      : 'We\'ll use your camera to measure posture alignment. '
                          'Processing happens on-device for privacy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: c.textSecondary,
                    fontSize: m.isCompact ? 13 : 14,
                  ),
                ),
                SizedBox(height: m.isCompact ? 16 : 32),
                Expanded(
                  child: Center(
                    child: _CameraFrame(
                      progress: state.scanProgress,
                      compact: m.isCompact,
                    ),
                  ),
                ),
                if (isScanning) ...[
                  LinearProgressIndicator(
                    value: state.scanProgress,
                    backgroundColor: c.border,
                    color: c.primary,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${(state.scanProgress * 100).round()}% complete',
                    style: TextStyle(
                      color: c.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                SizedBox(height: 24),
                PrimaryButton(
                  label: isScanning ? 'Scanning...' : 'Start Scan',
                  isLoading: isScanning,
                  onPressed: isScanning
                      ? null
                      : () => context
                          .read<AssessmentBloc>()
                          .add(const AssessmentScanStarted()),
                ),
                SizedBox(height: 12),
                if (!isScanning)
                  PrimaryButton(
                    label: 'Skip for now',
                    variant: PrimaryButtonVariant.outlined,
                    onPressed: () => context.push('/onboarding/plan'),
                  ),
                SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CameraFrame extends StatelessWidget {
  _CameraFrame({required this.progress, this.compact = false});

  final double progress;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: c.navy.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: progress > 0 ? c.primary : c.border,
            width: progress > 0 ? 2 : 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: compact ? 120 : 160,
              color: c.textMuted,
            ),
            Positioned(
              top: 100,
              left: 24,
              right: 24,
              child: Container(
                height: 2,
                color: c.primary.withValues(alpha: 0.7),
              ),
            ),
            Positioned(
              top: 60,
              bottom: 60,
              child: Container(
                width: 1,
                color: c.primary.withValues(alpha: 0.4),
              ),
            ),
            if (progress > 0)
              Positioned(
                bottom: 16,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: c.navy.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Align shoulders with guide',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
