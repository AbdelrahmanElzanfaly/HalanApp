import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Models/user_model.dart';
import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class EditProfileApi {
  static Future<bool> editProfile({
    String? name,
    String? email,
    String? phone,
    String? nationality,
    String? experience,
    File? img,
    String? notes,
  }) async {
    try {
      List<http.MultipartFile> files = [
        if (img != null) await http.MultipartFile.fromPath('photo', img.path)
      ];

      var response =
          await API.patchRequest(url: API.editProfile, files: files, body: {
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (nationality != null) 'nationality': nationality,
        if (experience != null) 'experience': experience,
        if (notes != null) 'notes': notes,
      },);
      if (response == null) return false;
      if (response['status'] == true) {


        await SharedPref.saveUserObj(user: User.fromJson(response['data']));

        ToastHelper.showSuccess(message: response['message']);
        return true;
      } else {
        if (response["msg"] != null) Helper.handleError(response['message']);

        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

// static Future<bool> updatePicture({
//   File? file,
// }) async {
//   var decodeData = await API
//       .postRequest(url: API.updatePicture, body: {}, files: [
//     if (file != null) await http.MultipartFile.fromPath("profile", file.path)
//   ]);
//   if (decodeData == null) return false;
//   if (decodeData['status'] == true) {
//     // await SharedPref.saveUserObj(
//     //     user: SharedPref.getUserObg()!
//     //       ..employee = Employee.fromJson(decodeData['data']['employee']));
//     return true;
//   } else {
//     return false;
//   }
// }
}
