import 'dart:developer';

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
      // 'fcm_token': deviceToken.toString()
    }, headers: {
      "Accept": "application/json",
      "Accept-Language": SharedPref.getCurrentLang() ?? "en",
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
      {required String name,
      required String phone,
      required String email,
      required String password,
      String? referCode}) async {
    // String? deviceToken = await SharedObj().firebaseMessaging.getToken();
    String? deviceToken;
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      deviceToken = '';
    }
    var response = await API.postRequest(url: API.register, body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      // 'city': '1',
      'longitude': '23434',
      'latitude': '2323232323',
      "refer_code": referCode ?? "",

      'fcm_token': deviceToken.toString()
    });
    print(response);
    if (response == null) return false;
    if (response['status'] == 200) {
      ToastHelper.showSuccess(message: response['message']);
      return true;
    } else if (response['status'] == 422) {
      ToastHelper.showError(message: response['message'][0].toString());
      return false;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }

  static Future<bool> otpVerifying({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String otpNumber,
    String? referCode,
  }) async {
    String? deviceToken;
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      deviceToken = '';
    }
    var response = await API.postRequest(url: API.register, body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      // 'city': '1',
      'longitude': '29.32232444',
      'latitude': '29.3 2232644',
      "otp_number": otpNumber,
      "refer_code": referCode ?? "",

      'fcm': deviceToken.toString()
    });
    print('REsponse ya saad: ${response}');
    if (response == null) return false;
    if (response['status'] == 200) {
      ToastHelper.showSuccess(message: response['message']);
      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }

  static Future<bool> sendEmailForForgotPass({
    required String email,
  }) async {
    var response = await API.postRequest(url: API.forgetPassword, body: {
      'email': email,
    });
    print(response);
    if (response == null) return false;
    if (response['status'] == true) {
      ToastHelper.showSuccess(message: response['message']);
      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }

  static Future<bool> confirmEmailForForgotPass({
    required String email,
    required String otp,
    // required String password,
  }) async {
    var response = await API.postRequest(url: API.verifyForgetPassCode, body: {
      'email': email, 'code': otp,
      // 'password': password
    });
    print(response);
    if (response == null) return false;
    if (response['status'] == true) {
      ToastHelper.showSuccess(message: response['message']);
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

  static Future<bool> loginSocial({
    required token,
    required provider,
  }) async {
    log('!!!!!!!! $token');
    String? deviceToken;
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      deviceToken = '';
    }
    // print(deviceToken.toString());
    var response = await API.postRequest(url: API.loginSocial, body: {
      // 'code': code,
      'access_token': token,
      'provider': provider,
      'fcm_token': deviceToken.toString()
    });
    print('pop: login: ---> ${response.toString()}<-------');
    if (response == null) return false;
    if (response['status'] == 200) {
      ToastHelper.showSuccess(message: response['message']);

      await SharedPref.saveUserObj(user: UserModel.fromJson(response['data']));

      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }

  static Future<bool> onResendCodeApi(phoneNumber) async {
    var response = await API
        .postRequest(url: API.sendOtp, body: {'phone': phoneNumber.toString()});
    print(response);
    if (response == null) return false;
    if (response['status'] == 200) {
      ToastHelper.showSuccess(message: response['message']);
      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }
// static Future<bool> resetPassword(
//     {required String phoneNumber,
//     required String otp,
//     required String password}) async {
//   var response = await API.postRequest(
//       url: API.verifyForgetPassCode,
//       body: {'phone': phoneNumber, 'otp_number': otp, 'password': password});
//   print(response);
//   if (response == null) return false;
//   if (response['status'] == 200) {
//     ToastHelper.showSuccess(message: response['message']);
//     return true;
//   } else {
//     ToastHelper.showError(message: response['message']);
//     return false;
//   }
// }
//===========

}
