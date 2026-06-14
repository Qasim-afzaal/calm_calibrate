import 'package:calm_calibrate/data/models/pain_area.dart';
import 'package:calm_calibrate/data/models/user_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Schedules local break reminders from the user's profile settings.
class ReminderNotificationService {
  ReminderNotificationService._();
  static final ReminderNotificationService instance =
      ReminderNotificationService._();

  static const _channelId = 'break_reminders';
  static const _channelName = 'Break Reminders';
  static const _channelDescription = 'Mobility break reminders during work hours';

  static const _anchorIdBase = 1;
  static const _streakReminderId = 10;
  static const _intervalIdBase = 1000;

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  /// Disabled in unit/widget tests to avoid platform channel hangs.
  @visibleForTesting
  static bool schedulingEnabled = true;

  Future<void> init() async {
    if (!schedulingEnabled) return;
    if (_initialized) return;

    try {
      tz_data.initializeTimeZones();
      final timeZoneInfo = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneInfo.identifier));

      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );

      await _plugin.initialize(
        settings: const InitializationSettings(
          android: androidSettings,
          iOS: iosSettings,
        ),
      );

      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
        final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
        await androidPlugin?.createNotificationChannel(
          const AndroidNotificationChannel(
            _channelId,
            _channelName,
            description: _channelDescription,
            importance: Importance.high,
          ),
        );
      }

      _initialized = true;
    } catch (e, st) {
      debugPrint('[CalmCalibrate] reminder init failed: $e\n$st');
    }
  }

  Future<bool> requestPermission() async {
    if (!schedulingEnabled) return false;
    if (!_initialized) await init();
    if (!_initialized) return false;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final ios = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
      final granted = await ios?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      final granted = await android?.requestNotificationsPermission();
      return granted ?? true;
    }

    return false;
  }

  Future<void> cancelAll() async {
    if (!_initialized) return;
    await _plugin.cancelAll();
  }

  Future<void> syncFromProfile(
    UserProfile profile, {
    required bool enabled,
  }) async {
    if (!schedulingEnabled) return;
    if (!_initialized) await init();
    await cancelAll();

    final breakTimes = profile.preferredBreakTimes.isEmpty
        ? BreakTime.values.toSet()
        : profile.preferredBreakTimes;

    for (final breakTime in breakTimes) {
      await _scheduleDailyAnchor(breakTime);
    }

    await _scheduleIntervalReminders(
      reminderMinutes: profile.reminderMinutes,
      breakTimes: breakTimes,
    );

    await _scheduleStreakReminder();
  }

  Future<void> _scheduleDailyAnchor(BreakTime breakTime) async {
    final (hour, minute) = breakTime.scheduleTime;
    final scheduled = _nextInstanceOfTime(hour, minute);

    await _plugin.zonedSchedule(
      id: _anchorIdBase + breakTime.index,
      title: breakTime.reminderTitle,
      body: 'Take a quick mobility break to reset your body.',
      scheduledDate: scheduled,
      notificationDetails: _details(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _scheduleStreakReminder() async {
    final scheduled = _nextInstanceOfTime(19, 0);

    await _plugin.zonedSchedule(
      id: _streakReminderId,
      title: 'Protect your streak',
      body: 'Take a 2-minute break today to keep your momentum going.',
      scheduledDate: scheduled,
      notificationDetails: _details(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _scheduleIntervalReminders({
    required int reminderMinutes,
    required Set<BreakTime> breakTimes,
  }) async {
    final window = _workWindow(breakTimes);
    final anchorMinutes = breakTimes
        .map((t) => t.scheduleTime.$1 * 60 + t.scheduleTime.$2)
        .toSet();

    var id = _intervalIdBase;
    final now = tz.TZDateTime.now(tz.local);

    for (var dayOffset = 0; dayOffset < 7; dayOffset++) {
      final day = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
      ).add(Duration(days: dayOffset));

      var slot = tz.TZDateTime(
        tz.local,
        day.year,
        day.month,
        day.day,
        window.startHour,
        window.startMinute,
      );
      final end = tz.TZDateTime(
        tz.local,
        day.year,
        day.month,
        day.day,
        window.endHour,
        window.endMinute,
      );

      while (!slot.isAfter(end)) {
        if (slot.isAfter(now) && !_isNearAnchor(slot, anchorMinutes)) {
          await _plugin.zonedSchedule(
            id: id++,
            title: 'Time to move',
            body:
                'You have been sitting for a while. Stand up and stretch for 2 minutes.',
            scheduledDate: slot,
            notificationDetails: _details(),
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          );
        }
        slot = slot.add(Duration(minutes: reminderMinutes));
      }
    }
  }

  NotificationDetails _details() {
    const android = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );
    const ios = DarwinNotificationDetails();
    return const NotificationDetails(android: android, iOS: ios);
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  bool _isNearAnchor(tz.TZDateTime time, Set<int> anchorMinutes) {
    final minutes = time.hour * 60 + time.minute;
    for (final anchor in anchorMinutes) {
      if ((minutes - anchor).abs() < 10) return true;
    }
    return false;
  }

  _WorkWindow _workWindow(Set<BreakTime> breakTimes) {
    final times = breakTimes.map((t) => t.scheduleTime).toList()
      ..sort((a, b) => (a.$1 * 60 + a.$2).compareTo(b.$1 * 60 + b.$2));

    final start = times.first;
    final end = times.last;

    var endHour = end.$1;
    var endMinute = end.$2 + 30;
    if (endMinute >= 60) {
      endHour++;
      endMinute -= 60;
    }

    return _WorkWindow(
      startHour: start.$1,
      startMinute: start.$2,
      endHour: endHour,
      endMinute: endMinute,
    );
  }
}

class _WorkWindow {
  const _WorkWindow({
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
  });

  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;
}

extension BreakTimeSchedule on BreakTime {
  (int hour, int minute) get scheduleTime => switch (this) {
        BreakTime.morning => (9, 0),
        BreakTime.lunch => (12, 30),
        BreakTime.afternoon => (15, 0),
        BreakTime.evening => (18, 0),
      };

  String get reminderTitle => switch (this) {
        BreakTime.morning => 'Morning reset',
        BreakTime.lunch => 'Lunch stretch',
        BreakTime.afternoon => 'Afternoon break',
        BreakTime.evening => 'Evening unwind',
      };
}
