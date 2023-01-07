import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/API/api.dart';
import 'package:halan/API/opt_api.dart';
import 'package:halan/Modules/UserAuth/AddressDetails/address_details_screen.dart';
import 'package:halan/Modules/UserAuth/CompleteProfile/complete_profile_screen.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../Shared/shared_preferances.dart';
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

    bool result = await AuthApi.register(
      password: passwordController.text,
      phone: phoneController.text,
      email: emailController.text,
      api: API.register,
    );
    setState(() {
      loading = false;
    });

    if (result) {
      Navigator.of(context).pushNamed(
        OtpScreen.routeName,
        arguments: onConfirmOtp,
      );
    }
  }

  Future onConfirmOtp(String otp) async {
    bool result = await OptApi.otp(
      otpCode: otp,
    );
    if (result) {
      if (SharedPref.getUserObg()?.user?.role == 'maid') {
        Modular.to.pushNamedAndRemoveUntil(
          CompleteProfileScreen.routeName,
          (Route<dynamic> route) => false,
        );
      } else if (SharedPref.getUserObg()?.user?.role == 'client') {
        Modular.to.pushNamedAndRemoveUntil(
          AddressDetailsScreen.routeName,
          (Route<dynamic> route) => false,
        );
      }
    }
  }
}
