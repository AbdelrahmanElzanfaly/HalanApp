import 'dart:convert';

import '../Models/device_data.dart';
import '../Models/user_model.dart';
import 'shared_obj.dart';

class SharedPref {
  static const String _userObj = "userObj";
  static const String _language = "language_code";
  static const String _intro = "intro";
  static const String _rolls = "rolls";
  static const String _pinCode = "pinCode";
  static const String _lat = "lat";
  static const String _long = "long";
  static const String _deviceData = "_deviceData";
  static const String _breakId = "breakId";
  static const String _userCity = "city";
  static const String _lastStatus = "lastStatus";

  static Future<bool?> saveUserObj({required UserModel user}) async {
    return await SharedObj()
        .prefs
        ?.setString(_userObj, jsonEncode(user.toJson()));
  }

  static UserModel? getUserObg() {
    String? userStringData = SharedObj().prefs?.getString(_userObj);
    if (userStringData == null) return null;
    return UserModel.fromJson(jsonDecode(userStringData));
  }

  static bool isUserLogIn() {
    return SharedObj().prefs?.getString(_userObj) != null;
  }

  static Future<void> logOut() async {
    await SharedObj().prefs?.remove(_userObj);
    await SharedObj().prefs?.remove(_pinCode);
    await SharedObj().prefs?.remove(_lastStatus);

  }

  static String? getCurrentLang() {
    return SharedObj().prefs?.getString(_language);
  }

  static Future<void> setCurrentLang({required String lang}) async {
    await SharedObj().prefs?.setString(_language, lang);
  }

  static bool isWatchIntro() {
    return SharedObj().prefs?.getBool(_intro) ?? false;
  }
  static bool isWatchRolls() {
    return SharedObj().prefs?.getBool(_rolls) ?? false;
  }

  static Future<void> saveWatchIntro() async {
    await SharedObj().prefs?.setBool(_intro, true);
  }

  static Future<void> saveWatchRolls() async {
    await SharedObj().prefs?.setBool(_rolls, true);
  }


  static Future<void> saveBreakId({required String id}) async {
    await SharedObj().prefs?.setString(_breakId, id);

  }
  static String? getBreakId() {
    return SharedObj().prefs?.getString(_breakId);
  }





  static String? getPinCode() {
    return SharedObj().prefs?.getString(_pinCode);
  }

  static Future<void> savePinCode(String pin) async {
    await SharedObj().prefs?.setString(_pinCode, pin);
  }

  static Future<bool?> saveDeviceData({required DeviceDataModel deviceData}) async {
    return await SharedObj()
        .prefs
        ?.setString(_deviceData, jsonEncode(deviceData.toMap()));
  }
  static DeviceDataModel? getDeviceData() {
    String? userStringData = SharedObj().prefs?.getString(_deviceData);
    if (userStringData == null) return null;
    return DeviceDataModel.fromMap(jsonDecode(userStringData));
  }


  static Future<bool?> saveLastStatus({required int status}) async {
    return await SharedObj().prefs?.setInt(_lastStatus, status);
  }
  static int? getLstStatus() {
    return SharedObj().prefs?.getInt(_lastStatus);
  }



}
