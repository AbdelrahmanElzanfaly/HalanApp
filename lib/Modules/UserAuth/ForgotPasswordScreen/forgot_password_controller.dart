import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../API/change_password_api.dart';
import '../../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import '../ResetPasswordScreen/reset_password_screen.dart';

class ForgotPasswordController extends ControllerMVC {
  // singleton
  factory ForgotPasswordController() {
    _this ??= ForgotPasswordController._();
    return _this!;
  }

  static ForgotPasswordController? _this;

  ForgotPasswordController._();

  bool loading = false,
      autoValidate = false,
      showPassword = true,
      showConfirmPassword = true;
  late TextEditingController phoneController,
      oldPasswordController,
      passwordController,
      confirmPasswordController;

  String? otpCode, email;

  @override
  void initState() {
    phoneController = TextEditingController();
    oldPasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  Future forgotPass(BuildContext context) async {
    setState(() {
      loading = true;
    });
    // bool result =
    // await AuthApi.sendEmailForForgotPass(email: phoneController.text);

    // if (result) {
      Navigator.of(context).pushNamed(OtpScreen.routeName,
          arguments: [onConfirmOtp, phoneController.text]);
    // }
    setState(() {
      loading = false;
    });
  }

  Future onConfirmOtp(String otp) async {
    otpCode = otp;
    // bool result = await AuthApi.confirmEmailForForgotPass(
    //   email: phoneController.text,
    //   otp: otp,
    // );
    // if (result) {
      email = phoneController.text;
      log(phoneController.text.toString());
      log(email.toString());

      Modular.to.pushNamed(ResetPasswordScreen.routeName,
          arguments: [true, phoneController.text]);
    // }
  }

  Future resetPassword(BuildContext context) async {
    setState(() {
      loading = true;
    });
    bool result = await ChangePasswordApi.changePassword(
      oldPassword: oldPasswordController.text,
      newPassword: passwordController.text,
      newPasswordConfirmation: confirmPasswordController.text,
    );
    setState(() {
      loading = false;
    });
    if (result) {
      // Navigator.of(context).pushNamed(SettingScreen.routeName);
    }
  }

  Future resetNewPassword(BuildContext context, email) async {
    setState(() {
      loading = true;
    });
    // bool result = await ChangePasswordApi.changeNewPassword(
    //   newPassword: passwordController.text,
    //   email: email,
    // );
    setState(() {
      loading = false;
    });
    // if (result) {
      Navigator.of(context).pushNamed(BottomNavigationBarScreen.routeName);
    // }
  }
}
