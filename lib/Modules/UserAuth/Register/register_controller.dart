import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/API/api.dart';

import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/toast_helper.dart';
import '../../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';

class RegistrationController extends ControllerMVC {
  factory RegistrationController() {
    _this ??= RegistrationController._();
    return _this!;
  }

  static RegistrationController? _this;

  RegistrationController._();

  bool loading = false, autoValidate = false, showPassword = false;

  // final GlobalKey<FormState> formKey = GlobalKey();
  int type = 2;
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

  Future register(BuildContext context) async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));

    // bool result = await AuthApi.register(
    //
    //   password: passwordController.text,
    //   phone: phoneController.text,
    //   email: emailController.text, name: '',
    //   // referCode: referCodeController.text,
    // );
    setState(() {
      loading = false;
    });

    // if (result) {

    // }
  }

  Future onConfirmOtp(String otp) async {
    // bool result = await OptApi.otp(
    //   // name: userNameController.text,
    //   password: passwordController.text,
    //   phone: phoneController.text,
    //   email: emailController.text,
    //   otpCode: otp, name: '',
    //   // referCode: referCodeController.text,
    // );
    // if (result) {


      // Modular.to.pushNamed(AddressDetailsScreen.routeName);

    // }
  }

  Future registration() async {
    var response = await API.postRequest(
      url: API.register,
      body: {
        'email': emailController.text ?? '',
        'phoneNumber': phoneController.text ?? '',
        'password': passwordController.text ?? '',
        'confirm_password': confirmPasswordController.text ?? '',
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
