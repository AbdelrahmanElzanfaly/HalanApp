import 'package:halan/Models/user_model.dart';

import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class OptApi {
  static Future<bool> otp({

    required String otpCode,

  }) async {
    var response = await API.postRequest(url: API.sendOtp, body: {
      'otp': otpCode,
    });
    if (response == null) return false;
    if (response['status'] == true) {
      await SharedPref.setToken(token: response["data"]["token"]);
      await SharedPref.saveUserObj(user: User.fromJson(response["data"]["user"]));
      ToastHelper.showSuccess(message: response['message']);
      return true;
    } else {
      if (response["message"] != null) Helper.handleError(response['message']);
      return false;
    }
  }
}
