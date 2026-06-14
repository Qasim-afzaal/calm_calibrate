import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/core/widgets/selectable_chip.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkPatternScreen extends StatefulWidget {
  const WorkPatternScreen({super.key});

  @override
  State<WorkPatternScreen> createState() => _WorkPatternScreenState();
}

class _WorkPatternScreenState extends State<WorkPatternScreen> {
  static const _chipMinHeight = 72.0;

  late final TextEditingController _nameController;
  late final FocusNode _nameFocus;

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] work_pattern loaded'); // auth-check-debug
    _nameController = TextEditingController();
    _nameFocus = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final name = context.read<OnboardingBloc>().state.name;
      if (name.isNotEmpty) {
        _nameController.text = name;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    final gap = m.sectionGap + 2;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          final canContinue = state.canContinueWork;

          return ResponsiveScrollBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your work pattern',
                  style: m.headlineStyle(Theme.of(context).textTheme),
                ),
                SizedBox(height: m.onboardingTitleGap),
                Text(
                  'This helps us schedule breaks when you need them most.',
                  style: TextStyle(
                    color: c.textSecondary,
                    height: 1.45,
                  ),
                ),
                SizedBox(height: m.blockSpacing),
                Text(
                  'What should we call you?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: m.sectionGap + 4),
                TextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => bloc.add(OnboardingNameSet(value)),
                  onSubmitted: (_) => _nameFocus.unfocus(),
                  decoration: InputDecoration(
                    hintText: 'First name',
                    filled: true,
                    fillColor: c.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: c.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: c.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: c.primary, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
                SizedBox(height: m.blockSpacing),
                Text(
                  'Hours sitting per day',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: m.sectionGap + 4),
                Row(
                  children: [
                    for (var i = 0; i < SittingHours.values.length; i++) ...[
                      if (i > 0) SizedBox(width: gap),
                      Expanded(
                        child: SelectableChip(
                          label: SittingHours.values[i].chipTitle,
                          subtitle: SittingHours.values[i].chipSubtitle,
                          centered: true,
                          minHeight: _chipMinHeight,
                          selected: state.sittingHours == SittingHours.values[i],
                          onTap: () => bloc.add(
                            OnboardingSittingHoursSet(SittingHours.values[i]),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: m.blockSpacing),
                Text(
                  'Best break times?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                SizedBox(height: m.sectionGap + 4),
                _BreakTimeGrid(
                  gap: gap,
                  minHeight: _chipMinHeight,
                  selected: state.preferredBreakTimes,
                  onToggle: (time) => bloc.add(OnboardingBreakTimeToggled(time)),
                ),
                SizedBox(height: m.largeSpacing),
                if (!canContinue)
                  Padding(
                    padding: EdgeInsets.only(bottom: m.sectionGap + 4),
                    child: Center(
                      child: Text(
                        state.name.trim().isEmpty
                            ? 'Add your name, sitting hours, and a break time'
                            : 'Select sitting hours and at least one break time',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: c.textMuted,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ),
                PrimaryButton(
                  label: 'Continue',
                  onPressed: canContinue
                      ? () {
                          bloc.add(const OnboardingPartialProfileSaveRequested());
                          context.push('/onboarding/goals');
                        }
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BreakTimeGrid extends StatelessWidget {
  const _BreakTimeGrid({
    required this.gap,
    required this.minHeight,
    required this.selected,
    required this.onToggle,
  });

  final double gap;
  final double minHeight;
  final Set<BreakTime> selected;
  final ValueChanged<BreakTime> onToggle;

  @override
  Widget build(BuildContext context) {
    final times = BreakTime.values;
    return Column(
      children: [
        for (var row = 0; row < times.length; row += 2) ...[
          if (row > 0) SizedBox(height: gap),
          Row(
            children: [
              Expanded(
                child: _breakChip(times[row]),
              ),
              SizedBox(width: gap),
              Expanded(
                child: row + 1 < times.length
                    ? _breakChip(times[row + 1])
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _breakChip(BreakTime time) {
    return SelectableChip(
      label: time.label,
      centered: true,
      minHeight: minHeight,
      selected: selected.contains(time),
      onTap: () => onToggle(time),
    );
  }
}
