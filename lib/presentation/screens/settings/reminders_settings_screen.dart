import 'package:calm_calibrate/core/constants/screen_metrics.dart';
import 'package:calm_calibrate/core/l10n/l10n_extensions.dart';
import 'package:calm_calibrate/core/l10n/model_labels.dart';
import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:calm_calibrate/core/widgets/layout/responsive_padding.dart';
import 'package:calm_calibrate/core/widgets/primary_button.dart';
import 'package:calm_calibrate/core/widgets/selectable_chip.dart';
import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RemindersSettingsScreen extends StatefulWidget {
  RemindersSettingsScreen({super.key});

  @override
  State<RemindersSettingsScreen> createState() =>
      _RemindersSettingsScreenState();
}

class _RemindersSettingsScreenState extends State<RemindersSettingsScreen> {
  late int _minutes;
  late bool _smartReminders;
  late Set<BreakTime> _breakTimes;

  @override
  void initState() {
    super.initState();
    debugPrint('[CalmCalibrate] reminders_settings loaded'); // auth-check-debug

    final p = MockUserRepository.instance.profile;
    _minutes = p.reminderMinutes;
    _smartReminders = p.smartReminders;
    _breakTimes = Set.from(p.preferredBreakTimes);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final m = context.metrics;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.remindersTitle)),
      body: ResponsiveScrollBody(
        fillViewport: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.breakFrequency,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: m.sectionGap + 4),
            Row(
              children: [30, 45, 60].map((mins) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: m.sectionGap),
                    child: SelectableChip(
                      label: l10n.breakFrequencyMin(mins),
                      selected: _minutes == mins,
                      onTap: () => setState(() => _minutes = mins),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: m.onboardingSectionGap),
            Text(
              l10n.activeHours,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: m.sectionGap + 4),
            Wrap(
              spacing: m.sectionGap,
              runSpacing: m.sectionGap,
              children: BreakTime.values.map((t) {
                return SelectableChip(
                  label: t.localized(l10n),
                  selected: _breakTimes.contains(t),
                  onTap: () {
                    setState(() {
                      if (_breakTimes.contains(t)) {
                        _breakTimes.remove(t);
                      } else {
                        _breakTimes.add(t);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: m.onboardingSectionGap),
            Container(
              padding: EdgeInsets.all(m.stackSpacing),
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: c.border),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.smartReminders,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          l10n.smartRemindersSubtitle,
                          style: TextStyle(
                            fontSize: 13,
                            color: c.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _smartReminders,
                    onChanged: (v) => setState(() => _smartReminders = v),
                  ),
                ],
              ),
            ),
            Spacer(),
            PrimaryButton(
              label: l10n.save,
              onPressed: () async {
                final repo = MockUserRepository.instance;
                await repo.saveProfile(
                  repo.profile.copyWith(
                    reminderMinutes: _minutes,
                    smartReminders: _smartReminders,
                    preferredBreakTimes: _breakTimes,
                  ),
                );
                if (context.mounted) context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
