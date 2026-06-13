import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('Reminders')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Break frequency',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Row(
              children: [30, 45, 60].map((m) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: SelectableChip(
                      label: '$m min',
                      selected: _minutes == m,
                      onTap: () => setState(() => _minutes = m),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            Text(
              'Active hours',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: BreakTime.values.map((t) {
                return SelectableChip(
                  label: t.label,
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
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
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
                          'Smart Reminders',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Skip meetings, adapt to activity',
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
              label: 'Save',
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
