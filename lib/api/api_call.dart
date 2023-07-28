import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Api_call {
  PushNotification() async {
    var response = await Dio().post("https://fcm.googleapis.com/fcm/send",
        data: {
          {
            "registration_ids": [
              "Your Device ID"
            ],
            "notification": {
              "body": "New Appoinment has been Schedule",
              "title": "Appointment",
              "android_channel_id": "firebase_push_notification",
              "sound": true
            }
          }
        },
        options: Options(headers: {
          'Authorization':
              'key={Your Server key with Out parenthesis}',
          'Content-Type': 'application/json'
        }));
    print(response.toString());
  }
}

final notificationProvider = Provider<Api_call>((ref) => Api_call());
