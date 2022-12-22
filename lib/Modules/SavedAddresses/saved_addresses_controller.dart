import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../API/change_password_api.dart';

class SavedAddressesController extends ControllerMVC {
  // singleton
  factory SavedAddressesController() {
    _this ??= SavedAddressesController._();
    return _this!;
  }

  static SavedAddressesController? _this;

  SavedAddressesController._();

  bool loading = false,
      autoValidate = false;





}
