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
import '../../../Widgets/app_bar_widget.dart';
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
                        height: 50.h,
                      ),
                      const FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: AppBarWidget(),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: ThemeClass.textColor),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: Text(
                            'Please enter the verification code that was sent to your number.',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: ThemeClass.hintColor,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 55.h,
                      ),
                      FadeIn(
                        delay: 2,
                        from: SlideFrom.LEFT,
                        child: PinCodeWidget(
                          controller: con.codeController,
                        ),
                      ),
                      SizedBox(
                        height: 68.h,
                      ),
                      CustomButton(
                        width: 250.w,
                        name: "Verify",
                        ontap: () {
                          if (con.formKey.currentState?.validate() ?? false) {
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
    );
  }
}
