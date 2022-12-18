import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../API/change_password_api.dart';

class  ReferAndEarnController extends ControllerMVC {
  // singleton
  factory  ReferAndEarnController() {
    _this ??=  ReferAndEarnController._();
    return _this!;
  }

  static  ReferAndEarnController? _this;

   ReferAndEarnController._();

  bool loading = false,
      autoValidate = false;





}
