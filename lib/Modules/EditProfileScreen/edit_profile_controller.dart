import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/API/edit_profile_api.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../API/change_password_api.dart';
import '../../Utilities/helper.dart';
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

  Future onSave(BuildContext context) async {
    setState(() {
      loading = true;
    });

    bool result = await EditProfileApi.editProfile(
      name: firstNameController.text + endNameController.text,
      img: userImage,
      phone: phoneController.text,
      email: emailController.text
    );
    setState(() {
      loading = false;
    });

    if (result) {
      Modular.to.pop();
    }
  }

  updateImage(BuildContext context) async {
    userImage = await Helper.pickImage(context: context);
  }


}
