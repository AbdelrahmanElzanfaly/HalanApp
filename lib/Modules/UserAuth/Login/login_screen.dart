import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Utilities/toast_helper.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: LoadingScreen(
        loading: con.loading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 812.h,
              width: 375.w,
              child: Form(
                key: _formKey,
                autovalidateMode: con.autoValidate
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 190.h,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                "Login Account".tr,
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeClass.primaryColor),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Stay signed in with your account".tr,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ThemeClass.blackColor,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 67.h,
                      ),
                      CustomTextFieldWidget(
                        prefixIcon: const Icon(Icons.email_outlined),
                        width: 327.w,
                        borderColor: Colors.grey.shade400,
                        controller: con.userEmailController,
                        hint: "email".tr,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) return "";
                          return null;
                        },
                        suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: const SizedBox()),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldWidget(
                        prefixIcon: const Icon(Icons.lock),
                        width: 327.w,
                        borderColor: Colors.grey.shade400,
                        controller: con.passwordController,
                        obscure: con.showPassword,
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: InkWell(
                            onTap: () => setState(() {
                              con.showPassword = !con.showPassword;
                            }),
                            child: Icon(
                              Icons.remove_red_eye,
                              color: !con.showPassword
                                  ? ThemeClass.primaryColor
                                  : Colors.grey,
                              size: 20.w,
                            ),
                          ),
                        ),
                        hint: "password".tr,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) return "";
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30.w,
                            height: 30.w,
                            child: Checkbox(
                                activeColor: ThemeClass.primaryColor,
                                value: con.acceptTerms,
                                onChanged: (v) => setState(() {
                                  con.acceptTerms = v ?? false;
                                })),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                            ontap: () async {
                              if (_formKey.currentState?.validate() ??
                                  false) {
                                  await con.logIn(context);

                              } else {
                                setState(() {
                                  con.autoValidate = true;
                                });
                              }
                            },
                            height: 56.h,
                            width: 327.2,
                            name: "logIn".tr,
                          )),
                      const Spacer(
                        flex: 4,
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
