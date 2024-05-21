import 'package:firebase_messaging/firebase_messaging.dart';

/*class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    // Bildirimlere izin ver
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Bildirim izni verilmişse, tokenı al ve bildirimleri dinle
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await _fcm.getToken();
      print("Firebase Messaging Token: $token");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("Got a message whilst in the foreground!");
        print("Message data: ${message.data}");

        if (message.notification != null) {
          print("Message also contained a notification: ${message.notification}");
        }
      });
    }
  }

  Future<void> sendNotification(String title, String body) async {
    await _fcm.send(
      // Bildirim bilgilerini oluştur
      RemoteMessage(
        data: {
          'title': title,
          'body': body,
        },
      ),
    );
  }
}*/
