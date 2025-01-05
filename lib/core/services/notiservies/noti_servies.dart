import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  // Initialize Awesome Notifications
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      null, // Default app icon (set null to use app icon)
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'General notifications',
          importance: NotificationImportance.High,
          defaultColor: const Color(0xFF9D50DD),
          ledColor: const Color(0xFF9D50DD),
        )
      ],
      debug: true,
    );
  }

  // Request notification permissions
  static Future<bool> requestPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      isAllowed =
          await AwesomeNotifications().requestPermissionToSendNotifications();
    }
    return isAllowed;
  }

  // Basic notification
  static Future<void> showBasicNotification() async {
    if (await requestPermission()) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          channelKey: 'alerts',
          title: 'Hello, World!',
          body: 'This is a simple notification.',
          notificationLayout: NotificationLayout.Default,
        ),
      );
    }
  }

  // Scheduled notification
  static Future<void> scheduleNotification(
      DateTime scheduleTime, String title, String body) async {
    if (await requestPermission()) {
      if (scheduleTime.isBefore(DateTime.now().add(const Duration(seconds: 5)))) {
        print("Scheduled time must be at least 5 seconds in the future.");
        return;
      }

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          channelKey: 'alerts',
          title: title,
          body: body,
          notificationLayout: NotificationLayout.Default,
        ),
        schedule: NotificationCalendar(
          year: scheduleTime.year,
          month: scheduleTime.month,
          day: scheduleTime.day,
          hour: scheduleTime.hour,
          minute: scheduleTime.minute,
          second: scheduleTime.second,
          repeats: false,
        ),
      );
    }
  }

  // Repeating notification
  static Future<void> scheduleRepeatingNotification(
       String title, String body) async {
    if (await requestPermission()) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          channelKey: 'alerts',
          title: title,
          body: body,
          notificationLayout: NotificationLayout.Default,
        ),
        schedule: NotificationInterval(
        interval: const Duration(minutes: 1), // Repeat every 60 seconds (1 minute)
        repeats: true,
      ),
      );
    }
  }
}