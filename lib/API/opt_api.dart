import '../Models/user_model.dart';
import '../Shared/shared_preferances.dart';
import '../Utilities/helper.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class OptApi {
  static Future<bool> otp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String otpCode,
    String? latitude,
    String? longitude,
    String? referCode,
  }) async {
    var response = await API.postRequest(url: API.register, body: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'otp_number': otpCode,
      'latitude': '30.43434323',
      'longitude': "29.32232444",
      "refer_code": referCode ?? "",
    });
    if (response == null) return false;
    if (response['status'] == 200) {
      await SharedPref.saveUserObj(user: UserModel.fromJson(response["data"]));
      ToastHelper.showSuccess(message: response['msg']);
      return true;
    } else {
      if (response["msg"] != null) Helper.handleError(response['msg']);
      return false;
    }
  }
}
