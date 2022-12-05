import 'dart:io';

import 'package:http/http.dart' as http;

import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import 'api.dart';

class EditProfileApi {
  static Future<bool> editProfile({
    String? email,
    String? name,
    String? password,
    File? img,
    String? phone,
    otp,
  }) async {
    print(name);
    print(email);

    try {
      List<http.MultipartFile> files = [
        if (img != null) await http.MultipartFile.fromPath('image', img.path)
      ];

      var response = await API.postRequest(
          url: API.editProfile,
          files: files,
          body: phone != null && otp == null
              ? {
                  'phone': phone.toString(),
                  'email': email.toString(),
                  'name': name.toString(),
                  'password': password.toString(),
                }
              : phone != null && otp != null
                  ? {
                      'phone': phone.toString(),
                      'email': email.toString(),
                      'name': name.toString(),
                      'password': password.toString(),
                      'otp_number': otp.toString()
                    }
                  : {
                      'email': email.toString(),
                      'name': name.toString(),
                      'password': password.toString()
                    });
      if (response == null) return false;
      if (response['status'] == 200) {
        // ToastHelper.showSuccess(message: response['msg']);
        return true;
      } else if (response['status'] == 422) {
        Helper.handleError(response['msg']);

        return false;
      } else {
        if (response["msg"] != null) Helper.handleError(response['msg']);

        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updatePicture({
    File? file,
  }) async {
    var decodeData = await API
        .postRequest(url: API.updatePicture, body: {}, files: [
      if (file != null) await http.MultipartFile.fromPath("profile", file.path)
    ]);
    if (decodeData == null) return false;
    if (decodeData['status'] == true) {
      // await SharedPref.saveUserObj(
      //     user: SharedPref.getUserObg()!
      //       ..employee = Employee.fromJson(decodeData['data']['employee']));
      return true;
    } else {
      return false;
    }
  }
}
