import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'helper.dart';

class FireBaseOperations {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static bool isInit = false;
  static StreamSubscription? messageListenSubscription;

  static Future init(
      {Function(
              //TripModel
              )?
          onDriverAccept,

      Function()? onCarBreakdown}) async {
    // if(!isInit){
    //   MapHelper.onLocationChange(onChange: updateDriverLocation);
    // }
    if (!isInit ||
        onDriverAccept != null ||

        onCarBreakdown != null) {
      await messageListenSubscription?.cancel();
      await messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint('>>>>> notification message <<<<<: ');
        debugPrint('Message data: ${message.data}');
        if (message.data["type"] == "NEW_ORDER" ||
            message.data["type"] == "STATUS_UPDATED") {}
        if (message.notification != null) {
          debugPrint(
              'Message also contained a notification title: ${message.notification!.title}');
          debugPrint(
              'Message also contained a notification body: ${message.notification!.body}');
        }
      });
      messageListenSubscription =
          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
            HapticFeedback.heavyImpact();

            debugPrint('>>>>> notification message <<<<<: ');
        debugPrint('Message data: ${message.data}');
        if (message.data["type"] == "TRIP") {
          if (onDriverAccept != null) {
            HapticFeedback.heavyImpact();
            // onDriverAccept(
            //     TripModel.fromJson(json.decode(message.data["trip"])));
          }
        } else if (message.data["type"] == "MESSAGE") {
          HapticFeedback.heavyImpact();



        } else if (message.data["type"] == "CARBREAKDOWN") {
          HapticFeedback.heavyImpact();

          if (onCarBreakdown != null) {
            onCarBreakdown();
          }
        }
      });
      isInit = true;
    }
  }
}
