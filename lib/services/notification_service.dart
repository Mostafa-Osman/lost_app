import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lost_app/services/navigation_services.dart';
import 'package:notification_permissions/notification_permissions.dart';

late AndroidNotificationChannel? channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class NotificationsService {
  final firebaseMessaging = FirebaseMessaging.instance;
  final _navigationService = locator<NavigationService>();
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  String? pushToken;

  Future<NotificationsService> init() async {
    //android icon init
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_notify');
    //ios init for FLN
    final initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {},
    );
    //platform init
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    //FLN init
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );

    _flutterLocalNotificationsPlugin.cancelAll();

    //setup firebase notification
    await setupNotifications();
    log('Notification Intiated ...');
    return this;
  }

  Future setupNotifications() async {
    //request permission for IOS
    NotificationPermissions.requestNotificationPermissions();

    //request permission (تااااني) for IOS
    await firebaseMessaging.requestPermission();

    if (!FirebaseMessaging.instance.isSupported()) {
      return;
    }
    await firebaseMessaging.subscribeToTopic('all');
    if (kDebugMode) {
      await firebaseMessaging.subscribeToTopic('test');
    }
    pushToken = await firebaseMessaging.getToken();
    FirebaseMessaging.instance.getInitialMessage().then((event) async {
      if (event != null) {
        await onSelectNotification(event.data['actionID'] as String?);
      }
    });
    FirebaseMessaging.onMessage.listen(firebaseMessagingNotificationHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      log("On Message Opened called...");
      await onSelectNotification(event.data['actionID'] as String?);
    });

    log('push notification $pushToken');
    return pushToken;
  }

  static Future<void> firebaseMessagingNotificationHandler(
    RemoteMessage event,
  ) async {
    try {
      log('local Notification Handler called');
      final notification = event.notification;
      if (notification != null &&
          notification.android != null &&
          channel != null) {
        final notificationDetails = NotificationDetails(
          android: getAndroidNotificationDetails(),
          iOS: const IOSNotificationDetails(),
        );
        await FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          notificationDetails,
          payload: event.data['actionID'].toString(),
        );
      }
    } catch (e, s) {
      log('Message data  ', error: e, stackTrace: s);
    }
  }

  static AndroidNotificationDetails getAndroidNotificationDetails() {
    return AndroidNotificationDetails(
      channel!.id,
      channel!.name,
      channelDescription: channel!.description,
      priority: Priority.high,
      importance: Importance.max,
    );
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      log("hi$payload");
      // _navigationService.navigateTo(
      //   Routes.OFFER_DETAILS,
      //   NotificationModel(
      //     offerId: int.parse(payload),
      //   ),
      // );
    } else {
      _navigationService.openApp();
    }
  }
}

Future<void> initializeNotification() async {
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel!);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}
