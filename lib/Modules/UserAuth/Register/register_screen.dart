import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halan/Modules/UserAuth/Register/register_controller.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/background_canvas.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../Widgets/custom_button_widget.dart';
import '../OTP/otp_screen.dart';
import '../Widgets/textWithField.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  _RegisterScreenState() : super(RegistrationController()) {
    con = RegistrationController();
  }

  late RegistrationController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CanvasBackground(
          child: Scaffold(
            body: CanvasBackground(
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Form(
                      key: con.formKey,
                      autovalidateMode: con.autoValidate
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 17.h,
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
                            height: 17.h,
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
                            height: 50.h,
                          ),
                          FadeIn(
                            delay: 2,
                            from: SlideFrom.TOP,
                            child: Image.asset(
                              "assets/images/auth/sign.png",
                              height: 277.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 44.h,
                          ),
                          Center(
                            child: FadeIn(
                              delay: 2,
                              from: SlideFrom.BOTTOM,
                              child: Text(
                                "sign_up".tr,
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: ThemeClass.blackColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          TextWithField(
                            title: "name".tr,
                            hint: "name_exp".tr,
                            controller: con.nameController,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          TextWithField(
                              title: "email".tr,
                              hint: "email_hint".tr,
                              controller: con.emailController,
                              des: "optional".tr),
                          SizedBox(
                            height: 25.h,
                          ),
                          TextWithField(
                            title: "phone_number".tr,
                            hint: "phone_hint".tr,
                            controller: con.phoneController,
                            des: "required".tr,
                          ),
                          SizedBox(
                            height: 46.h,
                          ),
                          Center(
                            child: CustomButton(
                              name: "create_acc".tr,
                              ontap: () async {
                                if (con.formKey.currentState?.validate() ??
                                    false) {
                                  Navigator.pushNamed(
                                      context, OtpScreen.routeName);
                                  // await con.register(context);
                                } else {
                                  setState(() {
                                    con.autoValidate = true;
                                  });
                                }
                              },
                              width: 348.w,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          )
                        ],
                      ),
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
}
