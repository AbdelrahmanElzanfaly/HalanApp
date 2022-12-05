import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


import '../../../modules/Main_Screen/main_screen.dart';
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

  late TextEditingController userNameController,
      userEmailController,
      passwordController,
      pinCodeController,
      confirmPinCodeController,
      codeController,
      confirmPasswordController;

  @override
  void initState() {
    userEmailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    pinCodeController = TextEditingController();
    confirmPinCodeController = TextEditingController();
    codeController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    pinCodeController.dispose();
    confirmPinCodeController.dispose();
    codeController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future logIn(BuildContext context) async {
    // final provider = Provider.of<SharedDataProvider>(context, listen: false);

    setState(() {
      loading = true;
    });
    // bool result = await AuthApi.login(
    //     userName: userEmailController.text,
    //     password: passwordController.text);
    // if (result) {
      Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName,(Route<dynamic> route) => false);
    // }

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