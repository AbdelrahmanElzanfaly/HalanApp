import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../API/change_password_api.dart';
import '../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import '../UserAuth/ResetPasswordScreen/reset_password_screen.dart';

class EditProfileController extends ControllerMVC {
  // singleton
  factory EditProfileController() {
    _this ??= EditProfileController._();
    return _this!;
  }

  static EditProfileController? _this;

  EditProfileController._();

  bool loading = false,
      autoValidate = false;
  late TextEditingController phoneController,
      firstNameController,
      endNameController,
      emailController;

  String? otpCode, email;
File? userImage;
  @override
  void initState() {
    firstNameController = TextEditingController();
    endNameController = TextEditingController();
    emailController = TextEditingController();

    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    endNameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }




}
