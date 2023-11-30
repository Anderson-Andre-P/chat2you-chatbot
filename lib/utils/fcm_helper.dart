import 'dart:developer';

import 'package:chat2you/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

import '../app/data/local/my_shared_pref.dart';
import 'awesome_notifications_helper.dart';

class FcmHelper {
  FcmHelper._();

  static late FirebaseMessaging messaging;

  static Future<void> initFcm() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      messaging = FirebaseMessaging.instance;

      await _setupFcmNotificationSettings();

      await _generateFcmToken();

      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      Logger().e(error);
    }
  }

  static Future<void> _setupFcmNotificationSettings() async {
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  static Future<void> _generateFcmToken() async {
    try {
      var token = await messaging.getToken();
      log("FCMToken $token");
      if (token != null) {
        MySharedPref.setFcmToken(token);
        _sendFcmTokenToServer();
      } else {
        await Future.delayed(const Duration(seconds: 5));
        _generateFcmToken();
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  static _sendFcmTokenToServer() {
    var token = MySharedPref.getFcmToken();
  }

  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data.cast(),
    );
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data.cast(),
    );
  }
}
