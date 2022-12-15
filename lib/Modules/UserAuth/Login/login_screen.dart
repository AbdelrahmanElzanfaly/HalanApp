import 'package:flutter/material.dart';
import 'package:halan/Modules/UserAuth/UserType/user_type.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/app_bar_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../../../modules/UserAuth/Register/register_screen.dart';
import '../ForgotPasswordScreen/forgot_password_screen.dart';
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
    child: GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child:  LoadingScreen(
        loading: con.loading,
        // child:
        // UpgradeAlert(
        //   upgrader: Upgrader(
        //     platform: TargetPlatform.iOS,
        //     dialogStyle: UpgradeDialogStyle.cupertino,
        //     showLater: true,
        //     showIgnore: false,
        //     durationUntilAlertAgain: const Duration(days: 1),
        //   ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: 700.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: _formKey,
                autovalidateMode: con.autoValidate
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      const FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: AppBarWidget(),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: Text(
                          "signin".tr,
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: ThemeClass.textColor),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: Text(
                            "Sign In now to enjoy our privalges, and get the best of our app.".tr,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: ThemeClass.hintColor,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 55.h,
                      ),
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.RIGHT,
                        child: CustomTextFieldWidget(
                          prefixIcon: Container(
                            width: 60.w,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.phone,
                                  size: 24.w,
                                  color: ThemeClass.primaryColor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const VerticalDivider(
                                  width: 5,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                )
                              ],
                            ),
                          ),
                          isDense: true,
                          textInputType: TextInputType.number,
                          borderColor: Colors.grey.shade400,
                          controller: con.phoneController,
                          hint: "Please Enter PhoneNumber".tr,
                          validator: (String? v) {
                            if (v == null || v.isEmpty) return "";
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: CustomTextFieldWidget(
                          prefixIcon: Container(
                            width: 60.w,
                            height: 40.h,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.lock_outline,
                                  size: 24.w,
                                  color: ThemeClass.primaryColor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const VerticalDivider(
                                  width: 5,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                )
                              ],
                            ),
                          ),
                          isDense: true,
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
                                con.showPassword
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye,
                                color: Colors.black54,
                                size: 20.w,
                              ),
                            ),
                          ),
                          hint: "Please Enter Password".tr,
                          validator: (String? v) {
                            if (v == null || v.isEmpty) return "";
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ForgotPasswordScreen.routeName),
                          child: Text(
                            "forgot_password".tr,
                            style: TextStyle(
                                color: ThemeClass.primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 18.h,
                      ),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: InkWell(
                      //     // onTap: () => Navigator.of(context)
                      //     //     .pushNamed(ForgotPasswordScreen.routeName),
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 25.0),
                      //       child: Text(
                      //         "forgot_password".tr,
                      //         style: TextStyle(
                      //             color: ThemeClass.primaryColor,
                      //             fontSize: 12.sp,
                      //             height: 1.0),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 40.h,
                      ),

                      CustomButton(
                        width: 250.w,
                        height: 50.h,
                        name: "signin".tr,
                        ontap: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await con.logIn(context);
                          } else {
                            setState(() {
                              con.autoValidate = true;
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 40.h,
                      ),

                      FadeIn(
                        delay: 1,
                        from: SlideFrom.BOTTOM,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Don’t have an account?".tr,
                                  style: TextStyle(
                                    color: const Color(0xff97ADB6),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(UserType.routeName),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "signUp".tr,
                                    style: TextStyle(
                                      color: ThemeClass.primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ]),
              ),
            ),
          ),
        ),
      ),),
      // ),
    );
  }
}
