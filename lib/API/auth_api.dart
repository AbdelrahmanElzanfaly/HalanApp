import 'dart:developer';
import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import '../Models/user_model.dart';
import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class AuthApi {
  static Future<bool> login({
    required userName,
    required password,
  }) async {
    String? deviceToken;
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      deviceToken = '';
    }
    var response = await API.postRequest(url: API.login, body: {
      'username': userName,
      'password': password,
      'DToken': deviceToken.toString(),
      'DType': Platform.operatingSystem.toString(),
    }, headers: {
      "Accept": "application/json",
      "access-language": SharedPref.getCurrentLang() ?? "en",
    });
    print('pop: login: ---> ${response.toString()}<-------');
    if (response == null) return false;
    if (response['status'] == true) {
      ToastHelper.showSuccess(message: response['message']);
      await SharedPref.saveUserObj(user: UserModel.fromJson(response['data']));
      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }

  static Future<bool> logOut(BuildContext context) async {
    var response = await API.getRequest(url: API.logout);
    if (response['status'] == true) {
      return true;
    } else {
      ToastHelper.showError(message: response['message'].toString());
      return false;
    }
  }

  static Future<bool> register(
      {required String phone,
      required String email,
      required String password,
      required String api,
      String? referCode}) async {
    // String? deviceToken = await SharedObj().firebaseMessaging.getToken();
    String? deviceToken;
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      deviceToken = '';
    }
    var response = await API.postRequest(url: api, body: {
      'phone': phone,
      'email': email,
      'password': password,
      'DToken': deviceToken.toString(),
      'DType': Platform.operatingSystem.toString(),
    }, headers: {
      "access-language": SharedPref.getCurrentLang() ?? "en",
    });

    if (response == null) return false;
    if (response['status'] == true) {
      ToastHelper.showSuccess(message: response['message']);
      await SharedPref.saveUserObj(user: UserModel.fromJson(response["data"]));

      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }

  static Future<bool> resetPassword(
      {required String email,
      required String otp,
      required String password}) async {
    var response = await API.postRequest(
        url: API.resetForgetPassword,
        body: {'email': email, 'otp_number': otp, 'password': password});
    print(response);
    if (response == null) return false;
    if (response['status'] == 200) {
      ToastHelper.showSuccess(message: response['message']);
      return true;
    } else {
      if (response['message'] != null) Helper.handleError(response['message']);
      return false;
    }
  }
}
