import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Theme/theme.dart';
import '../../../Utilities/Layout/background_canvas.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Utilities/toast_helper.dart';
import '../../../Widgets/animated_alert_dialog.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/pin_code.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'otp_controller.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otpScreen";

  final Function(String)? onConfirm;
  final String? email;

  const OtpScreen({Key? key, this.email, this.onConfirm}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends StateMVC<OtpScreen> {
  _OtpScreenState() : super(OtpController()) {
    con = OtpController();
  }

  late OtpController con;

  @override
  void initState() {
    con.onConfirm = widget.onConfirm;
    con.email = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: CanvasBackground(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Form(
                    key: con.formKey,
                    autovalidateMode: con.autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25.w,
                            color: ThemeClass.blackColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        FadeIn(
                          delay: 2,
                          from: SlideFrom.TOP,
                          child: Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 130.w,
                              height: 74.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        FadeIn(
                          delay: 2,
                          from: SlideFrom.TOP,
                          child: Image.asset(
                            "assets/images/auth/otp.png",
                            height: 322.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        FadeIn(
                          delay: 2,
                          from: SlideFrom.TOP,
                          child: Text(
                            "otp".tr,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: ThemeClass.blackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        FadeIn(
                          delay: 2,
                          from: SlideFrom.TOP,
                          child: Text(
                            "otp_des".tr,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeClass.blackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Text(
                                "otp".tr,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeClass.blackColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        FadeIn(
                          delay: 2,
                          from: SlideFrom.LEFT,
                          child: PinCodeWidget(
                            controller: con.codeController,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeIn(
                          delay: 2,
                          from: SlideFrom.BOTTOM,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (con.activeResend == true) {
                                      con.onResendCode();
                                    }
                                  },
                                  child: Text(
                                    "resend_otp".tr,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: con.activeResend
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        fontSize: 16.sp,
                                        color: con.activeResend
                                            ? ThemeClass.blackColor
                                            : ThemeClass.greyColor),
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "00:${con.start}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: ThemeClass.blackColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomButton(
                          name: "done".tr,
                          ontap: () {
                            if (con.formKey.currentState?.validate() ?? false) {
                              AnimatedAlertDialog(
                                  context, confirmChangePassword());
                            } else {
                            ToastHelper.showError(message: "otp_error".tr);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmChangePassword() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 68.h),
            width: 377.w,
            height: 416.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Image.asset(
                    "assets/images/auth/success_icon.png",
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeClass.yellowColor),
                    child: Text(
                      "welcome".tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                            color: ThemeClass.blackColor),
                        child: Text(
                          "welcome_message".tr,
                        ),
                      ),
                      Image.asset(
                        "assets/images/auth/smile.png",
                        width: 30.w,
                        height: 30.h,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamedAndRemoveUntil(
                          BottomNavigationBarScreen.routeName, (Route<dynamic> route) => false);
                    },
                    child: Container(
                      width: 200.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: ThemeClass.blackColor,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      alignment: Alignment.center,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.whiteColor,
                        ),
                        child: Text(
                          "main_screen".tr,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
