import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/base/local_notifications_service.dart';
import 'package:reading_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    if (token != null) {
      sendTokenToServer(token);
      log(token);
    } else {
      log("Token is null");
    }

    messaging.onTokenRefresh.listen((value) {
      sendTokenToServer(value);
    });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    //foreground
    handleForegroundMessage();
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // show local notification
      LocalNotificationService.showBasicNotification(
        message,
      );


//تعديل
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? fcmToken = prefs.getString('fcm_token');
      if (fcmToken != null && message.data['userId'] == fcmToken) {
        log("Showing dialog for user");
        _showDialog(message.notification?.title, message.notification?.body);
      } else {
        log("UserId does not match, fcmToken: $fcmToken");
      }
    });
  }

  static void sendTokenToServer(String token) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm_token', token);
  }
}

void _showDialog(String? title, String? body) {
  if (navigatorKey.currentContext != null) {
    showDialog(
      context: navigatorKey.currentContext!, // الوصول إلى السياق
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Notification'),
          content: Text(body ?? 'You have a new notification'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ Dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  } else {
    log("Context is null. Cannot show dialog.");
  }
}
