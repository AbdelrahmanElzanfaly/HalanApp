import 'package:flutter/cupertino.dart';
import 'package:halan/Modules/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'package:halan/Modules/MadeScreens/HomeMadeScreen/home_made_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../Shared/shared_preferances.dart';
import 'login_screen.dart';

class LoginController extends ControllerMVC {
  // singleton
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  static LoginController? _this;

  LoginController._();

  bool loading = false,
      autoValidate = false,
      acceptTerms = false,
      showPassword = true,
      showConfirmPassword = true,
      canCheckBiometrics = false,
      authenticated = false,
      isHavePin = false;

  late TextEditingController phoneController,
      passwordController,
      confirmPinCodeController,
      codeController,
      confirmPasswordController;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPinCodeController = TextEditingController();
    codeController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPinCodeController.dispose();
    codeController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future logIn(BuildContext context) async {
    setState(() {
      loading = true;
    });

    bool result = await AuthApi.login(
        userName: phoneController.text, password: passwordController.text);
    if (result) {
      if (SharedPref.getUserObg()?.user?.role == 'maid') {
        Navigator.of(context).pushNamedAndRemoveUntil(
          HomeMadeScreen.routeName,
          (Route<dynamic> route) => false,
        );
      } else if (SharedPref.getUserObg()?.user?.role == 'client') {
        Navigator.of(context).pushNamedAndRemoveUntil(
          BottomNavigationBarScreen.routeName,
          (Route<dynamic> route) => false,
        );
      }
    }

    setState(() {
      loading = false;
    });
  }

  Future resetPassword(BuildContext context) async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }
}
