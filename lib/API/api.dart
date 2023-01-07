import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';

class API {
  // static const String baseServerURL =
  //     "https://customer-api.mr-mussllaha.tecbadia.com";

  static const String baseServerURL = "http://api.7alan.app";

  //static const String baseServerURL = "http://192.168.1.30:8000";
  static const String _baseURL = "$baseServerURL/api/v1/";

  //=========================== api parameters ====================================
  // static const String authToken = "check_token";

  static const String login = "login";
  static const String sendOtp = "valid-otp";
  static const String addAddress = "add-address";
  static const String sendMessage = "";

  static const String loginSocial = "";
  static const String logout = "";

  static const String changePassword = "employee/reset_password";
  static const String reChangePassword = "employee/rechangepass";
  static const String register = "signup";
  static const String forgetPassword = "employee/forgetpassword";

  static const String verifyForgetPassCode = "employee/activcode";
  static const String resetForgetPassword =
      "user/forget-password/change-password";

  static const String editProfile =
      "user/update-user-profile?include=user_details";

  static Future postRequest({
    required String url,
    required Map<String, String> body,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint("$_baseURL$url");
    debugPrint(body.toString());
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$_baseURL$url'));
      request.fields.addAll(body);
      for (int i = 0; i < files.length; i++) {
        request.files.add(files[i]);
      }
      if (SharedPref.getDeviceData() != null) {
        request.headers.addAll(SharedPref.getDeviceData()!.toMap());
      }
      if (headers != null) {
        request.headers.addAll(headers);
      } else {
        request.headers.addAll({
          // "Accept": "application/json",
          "access-language": SharedPref.getCurrentLang() ?? "en",
          "Authorization": 'Bearer ${SharedPref.getUserObg()?.token}',
        });
      }
      print(request.headers);
      http.StreamedResponse response = await request.send();
      print('code : ' + response.statusCode.toString());
      debugPrint('statusCode : ${response.statusCode.toString()}');
      var res = await response.stream.bytesToString();
      debugPrint('response : ${res.toString()}');
      return json.decode(res);
    } catch (e) {
      ToastHelper.showError(message: 'please try again later');
      log('error : ' + e.toString());
      return null;
    }
  }

  static Future getRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    debugPrint("$_baseURL$url");
    try {
      var request = http.Request('GET', Uri.parse('$_baseURL$url'));
      if (SharedPref.getDeviceData() != null) {
        request.headers.addAll(SharedPref.getDeviceData()!.toMap());
      }
      if (headers != null) {
        request.headers.addAll(headers);
      } else {
        request.headers.addAll({
          "Accept": "application/json",
          "accept-language": SharedPref.getCurrentLang() ?? "en",
          "Authorization": 'Bearer ${SharedPref.getUserObg()?.token}',
        });
      }

      http.StreamedResponse response = await request.send();
      var res = json.decode(await response.stream.bytesToString());
      debugPrint(res.toString());
      return res;
    } catch (e) {
      ToastHelper.showError(message: 'please try again later');
      log('error : ' + e.toString());
      return null;
    }
  }
}
