import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_push_notification/firebase_options.dart';
import 'package:firebase_push_notification/notification_service/local_notification.dart';
import 'package:firebase_push_notification/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log(message.data.toString());
  log(message.notification!.title.toString());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotidficationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
