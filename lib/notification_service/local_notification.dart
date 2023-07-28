import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotidficationService{
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
  // }

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print(details);
      },
     
    );

  }


  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

   



}

class FirebaseApi{

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken =await _firebaseMessaging.getToken();
    print('Token value ${fCMToken}');
    log(fCMToken.toString());
    // FirebaseMessaging.onBackgroundMessage((message) => handleBackroundMessage(message));
    // initPushNotification();
  }
}