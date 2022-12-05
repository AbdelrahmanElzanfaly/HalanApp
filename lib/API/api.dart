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

  static const String baseServerURL = "https://manager.mwardi.com";

  //static const String baseServerURL = "http://192.168.1.30:8000";
  static const String _baseURL = "$baseServerURL/api/v1/";

  //=========================== api parameters ====================================
  // static const String authToken = "check_token";

  static const String login = "employee/login";
  static const String sendOtp = "sendOtp";
  static const String chat = "message/get-messages-user/";
  static const String sendMessage = "message/push-message-user";

  static const String loginSocial = "user/social-login";
  static const String logout = "employee/logout";
  static const String historyPoint = "usersearch/get-search-history";
  static const String orderHistory = "trip/user-order-history";
  static const String changePassword = "employee/reset_password";
  static const String reChangePassword = "employee/rechangepass";
  static const String register = "user/register";
  static const String forgetPassword = "employee/forgetpassword";

  static const String verifyForgetPassCode = "employee/activcode";
  static const String resetForgetPassword =
      "user/forget-password/change-password";

  static const String myReferCode =
      "referuser/get-refer-information?include=user_from";

  static const String payrollApi = "employee/payroll?type=current";
  static const String personal = "employee/personal";
  static const String documents = "employee/documents";
  static const String financial = "employee/financial";
  static const String organization = "employee/organization";
  static const String assets = "employee/assets";
  static const String meetings = "employee/meetings";
  static const String events = "employee/events";
  static const String noted = "employee/note_event?id=";
  static const String home = "employee/home?fcm_token=";
  static const String attendance = "employee/attendance";
  static const String attendanceByDate = "employee/attendance?date=";
  static const String analytics = "employee/analytics";
  static const String startWork = "employee/start_work";
  static const String endWork = "employee/end_work";
  static const String notification = "employee/notifications";
  static const String holidayRequestTypes = "employee/request-type";
  static const String leaveRequest = "employee/leave/store";
  static const String leavesHistory = "employee/leave/get-leaves";
  static const String updatePicture = "employee/update_picture";
  static const String breakApi = "employee/breaks";
  static const String breakStartApi = "employee/breaks/start";
  static const String breakEndApi = "employee/breaks/end";

  static const String tripRequestOrder = "triprequest/user/order";
  static const String sharedTripRequestOrder = "sharetrip/user/join-trip";
  static const String userCurrentTrip =
      "triprequest/user/get-user-current-trip/";

  static const String acceptTripRequest = "triprequest/user/accept/";
  static const String rateTripRequest = "triprequest/user/user-rate-trip";
  static const String userCancelTrip = 'triprequest/user/cancel/';
  static const String userCancelAfterBreakdown =
      'triprequest/user/user-cant-wait-new-driver';
  static const String editProfile =
      "user/update-user-profile?include=user_details";
  static const String getUserTicket =
      "ticket/get-user-tickets?include=ticket_problem_images,ticket_replays";
  static const String addUserTicket = "ticket/store-user-ticket";
  static const String addReplayTicket = "ticket/store-user-ticket-replay";
  static const String closeTicket = "ticket/close-ticket-by-user/";
  static const String wallet = "user/wallet-info";
  static const String faq = "faq/get_faqs";
  static const String userWaitNewTripApi =
      "triprequest/user/user-wait-new-driver";
  static const String sharedTripsApi = "sharetrip/user/fetch-shared-trips";
  static const String chargeWallet = "user/charge-wallet";

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
      if (headers != null) request.headers.addAll(headers);
      request.headers.addAll({
        "Accept": "application/json",
        "Accept-Language": SharedPref.getCurrentLang() ?? "en",
        "Authorization": 'Bearer ${SharedPref.getUserObg()?.token} ',
      });
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
      if (headers != null) request.headers.addAll(headers);
      request.headers.addAll({
        "Accept": "application/json",
        "Accept-Language": SharedPref.getCurrentLang() ?? "en",
        "Authorization": 'Bearer ${SharedPref.getUserObg()?.token} ',
      });

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
