import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

String constructFCMPayload({String? token, String? title, String? body}) {
  return jsonEncode({
    "to": token,
    "notification": {
      "title": title,
      "body": body,
      "android_channel_id": "high_importance_channel",
      "sound": "default"
    },
    "android": {
      "priority": "MAX",
      "notification": {
        "notification_priority": "PRIORITY_MAX",
        "sound": "default",
        "default_sound": true,
        "default_vibrate_timings": true,
        "default_light_settings": true
      }
    },
    // "data": {
    //   "type": "order",
    //   "id": "87",
    //   "click_action": "FLUTTER_NOTIFICATION_CLICK"
    // }
  });
}

Future<void> sendPushMessage({
  required String uId,
  required String title,
  required String body,
}) async {
  String? token = await FirebaseFirestore.instance
      .collection('users')
      .doc(uId)
      .get()
      .then((value) => value.data()!['tokens'])
      .catchError((e) => print(e));
  if (token == null) {
    print('token is null');
    return;
  } else {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAANuhWz4w:APA91bGi1cQW1QiZKsjImCI-t4ZyR_Fogld7Bb0HEJBlRdJtyFH6aGXx-UMZTh7jitTB37p1ye7oUXNvBv10ZS9P7pAABZd5rdR4O579zFnvoOhtJM4sDgNy8U2-feuo2KAi4cPtb27U',
        },
        body: constructFCMPayload(token: token, title: title, body: body),
      );
      // add notification to firebase
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('notifications')
          .add({
            'title': title,
            'body': body,
            'time': Timestamp.now(),
          })
          .then((value) => print('notification added'))
          .catchError((e) => print(e));
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
