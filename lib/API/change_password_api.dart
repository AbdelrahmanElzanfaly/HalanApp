import '../Models/user_model.dart';
import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class ChangePasswordApi {
  static Future<bool> changePassword({
    String? oldPassword,
    required newPassword,
    required newPasswordConfirmation,
  }) async {
    try {
      var response = await API.postRequest(url: API.changePassword, body: {
        'old_password': oldPassword.toString(),
        'password': newPassword.toString(),
        'password_confirmation': newPasswordConfirmation.toString()
      });
      if (response == null) return false;
      if (response['status'] == true) {
        ToastHelper.showSuccess(message: response['message']);
        // await SharedPref.saveUserObj(user: UserModel.fromJson(response['data']));

        return true;
      } else {
        if (response["message"] != null) Helper.handleError(response['message']);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
  static Future<bool> changeNewPassword({
    required email,
    required newPassword,
  }) async {
    try {
      var response = await API.postRequest(url: API.reChangePassword, body: {

        'email': email.toString(),
        'password': newPassword.toString(),
      });
      if (response == null) return false;
      if (response['status'] == true) {
        ToastHelper.showSuccess(message: response['message']);
        return true;
      } else {
        if (response["message"] != null) Helper.handleError(response['message']);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
