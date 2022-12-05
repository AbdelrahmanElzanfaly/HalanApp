import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/toast_helper.dart';

class RegistrationController extends ControllerMVC {
  factory RegistrationController() {
    _this ??= RegistrationController._();
    return _this!;
  }

  static RegistrationController? _this;

  RegistrationController._();

   bool loading = false, autoValidate = false, showPassword = false;

  final GlobalKey<FormState> formKey = GlobalKey();


  late TextEditingController nameController,
      emailController,
      phoneController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // Future  register() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   bool result = await UserApi.registration(
  //     userName: nameController.text,
  //     email: emailController.text,
  //     password: phoneController.text,
  //   );
  //   setState(() {
  //     loading = false;
  //   });
  //   if(result) {
  //
  //   }
  // }
  //
  // onConfirm(String code) async {
  //   setState(() {
  //     loading = true;
  //   }); //
  //   bool result = await UserApi.otp(
  //     email: emailController.text,
  //     code: code,
  //   );
  //   setState(() {
  //     loading = false;
  //   });
  //   if (result) {
  //     log(result.toString());
  //     // Navigator.pushNamed(context,HomeScreen.routeName);
  //   }
  // }
  //
  //
  //  Future registration({
  //   required String userName,
  //   required String email,
  //   required String password,
  // }) async {
  //   var response = await API.postRequest(
  //     url: API.register,
  //     body: {
  //       'email': email,
  //       'name': userName,
  //       'password': password,
  //     },
  //   );
  //   if (response == null) return false;
  //   debugPrint(response.toString());
  //   if (response["status"] == "success") {
  //     ToastHelper.showSuccess(message: "otp_sent".tr);
  //   } else {
  //     ToastHelper.showError(message: response["message"]);
  //   }
  // }

}
