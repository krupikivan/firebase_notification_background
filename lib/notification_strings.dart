import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//* Channel PUSH notifications
const channelId = 'example_channel_id';
const channelKey = 'example_channel_key';
const channelName = 'example Notifications';
const channelDescription = 'example notifications';

//* IOS Settings
final iosInitializationSettings = DarwinInitializationSettings(
  notificationCategories: [
    DarwinNotificationCategory(
      channelId,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.plain(
          channelKey,
          'Tienes una nueva notificacion',
          options: {
            DarwinNotificationActionOption.foreground,
          },
        ),
      ],
    ),
  ],
  onDidReceiveLocalNotification:
      (int id, String? title, String? body, String? payload) {},
);

//* Android Settings
const androidInitializationSettings =
    AndroidInitializationSettings('res_app_icon');

const androidChannel = AndroidNotificationChannel(
  channelId,
  channelName,
  description: channelDescription,
  importance: Importance.max,
  enableLights: true,
  ledColor: Colors.red,
);

const pushNotificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: channelDescription,
    color: Colors.red,
    ledColor: Colors.red,
    visibility: NotificationVisibility.public,
    importance: Importance.max,
    ledOnMs: 100,
    ledOffMs: 1000,
    category: AndroidNotificationCategory.message,
  ),
  iOS: DarwinNotificationDetails(
    presentSound: true,
    presentAlert: true,
    presentBadge: true,
  ),
);
