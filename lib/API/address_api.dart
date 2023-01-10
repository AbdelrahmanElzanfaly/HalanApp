import 'dart:convert';
import 'dart:developer';
import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import '../Models/user_model.dart';
import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class AddressApi {
  static Future<bool> addAddress({
    required String addressName,
    required String street,
    required String city,
    required String stateProvince,
    required String country,
    required String specialMark,
    required String locationName,
    required String lat,
    required String lng,
  }) async {

    final location = {
      "fullName": locationName,
      "cordinates": [lat, lng]
    };

    var response = await API.postRequest(
      url: API.addAddress,
      body: {
        'name': addressName,
        'street': street,
        'city': city,
        'postal': stateProvince,
        'country': country,
        // 'specialMark':specialMark,
        "location": json.encode(location).toString()
      },
    );
    if (response == null) return false;

    if (response['status'] == true) {
      ToastHelper.showSuccess(message: response['message']);
      await SharedPref.saveUserObj(user: User.fromJson(response["data"]["user"]));
      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }
}
