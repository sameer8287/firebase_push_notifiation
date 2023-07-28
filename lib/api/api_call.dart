import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Api_call {
  PushNotification() async {
    var response = await Dio().post("https://fcm.googleapis.com/fcm/send",
        data: {
          {
            "registration_ids": [
              "c-jxm9WQSY2zeNM4ag-oJe:APA91bEELRud2Iqm1ypJR6bX7uz59SzWG3fVoJQvhDnm-Ud9Tft_lbTJW8_e3sr-y5kubwHjB-gGZWsBo0aBUI8bJqa7Zy8eKz7LwVc4DowmjWy4umIJF8whShCQy1AaWjS-xNsexWle"
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
              'key=AAAALzgnZHs:APA91bHGsHVE25e-v22-RYVdN9WoPS2vdCWNLhy5ov3Q2pPkcJ_K-RjvzLZrAH1UQCNC6us6FY5-7yOPYbShheDZAj8JyeV4Zu38TwKtHNZrZT97-IXugeaHyWCUG-qV6o5Kts97dDSN',
          'Content-Type': 'application/json'
        }));
    print(response.toString());
  }
}

final notificationProvider = Provider<Api_call>((ref) => Api_call());
