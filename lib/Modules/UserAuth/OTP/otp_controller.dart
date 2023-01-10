import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class OtpController extends ControllerMVC {
  // singleton
  factory OtpController() {
    _this ??= OtpController._();
    return _this!;
  }

  static OtpController? _this;

  OtpController._();
  final GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController codeController;
  bool loading = false,
      autoValidate = false,
      showConfirmPassword = true,
      activeResend = false,
      showPassword = true;
  String? phoneNumber;

  Function(String)? onConfirm;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    codeController = TextEditingController();
    startTimer();
    activeResend = false;
    start = 10;
    super.initState();
  }

  Timer? timer;
  int start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            activeResend = true;
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  Future onResendCode() async {
    setState(() {loading = true;});
   // await UserApi.resendOTP(email: email!);
    activeResend = false;
    start = 10;
    startTimer();
    setState(() {
      loading = false;
    });
  }

  Future onConfirmPin() async {

    setState(() {
      loading = true;
    });

    if (onConfirm != null) {


      await onConfirm!(codeController.text);
    }
    setState(() {
      loading = false;
    });
  }
}
