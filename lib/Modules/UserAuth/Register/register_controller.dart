import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:halan/API/api.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../API/auth_api.dart';
import '../../../Utilities/toast_helper.dart';

class RegistrationController extends ControllerMVC {
  factory RegistrationController() {
    _this ??= RegistrationController._();
    return _this!;
  }

  static RegistrationController? _this;

  RegistrationController._();

   bool loading = false, autoValidate = false, showPassword = false;

  // final GlobalKey<FormState> formKey = GlobalKey();


  late TextEditingController passwordController,
      confirmPasswordController,
      emailController,
      phoneController;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future  register() async {
    setState(() {
      loading = true;
    });
    bool result = await AuthApi.register(
      email: emailController.text,
      password: phoneController.text, name: '', phone: '',
    );
    setState(() {
      loading = false;
    });
    if(result) {

    }
  }

  onConfirm(String code) async {
    setState(() {
      loading = true;
    }); //
    bool result = await AuthApi.otpVerifying(
      email: emailController.text,
       name: '', phone: '', password: '', otpNumber: '',
    );
    setState(() {
      loading = false;
    });
    if (result) {
      log(result.toString());
      // Navigator.pushNamed(context,HomeScreen.routeName);
    }
  }


   Future registration() async {
    var response = await API.postRequest(
      url: API.register,
      body: {
        'email': emailController.text??'',
        'phoneNumber': phoneController.text??'',
        'password': passwordController.text??'',
        'confirm_password': confirmPasswordController.text??'',
      },
    );
    if (response == null) return false;
    debugPrint(response.toString());
    if (response["status"] == "success") {
      ToastHelper.showSuccess(message: "otp_sent".tr);
    } else {
      ToastHelper.showError(message: response["message"]);
    }
  }

}
