import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halan/Modules/UserAuth/Login/login_screen.dart';
import 'package:halan/Modules/UserAuth/Register/register_controller.dart';
import 'package:halan/Utilities/Layout/loading_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/background_canvas.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: WillPopScope(
        onWillPop: () async => false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                            height: 20.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: Text(
                              "signUp" ,
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
                              from: SlideFrom.RIGHT,
                              child: Text(
                                'Sign Up now to enjoy our privileges, and get the best of our app'
                                     ,
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
                            from: SlideFrom.LEFT,
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
                                      Icons.email_outlined,
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
                              textInputType: TextInputType.emailAddress,
                              borderColor: Colors.grey.shade400,
                              controller: con.emailController,
                              hint: "Please Enter Email" ,
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
                              hint: "Please Enter PhoneNumber" ,
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
                            from: SlideFrom.RIGHT,
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
                              hint: "Please Enter Password" ,
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
                            from: SlideFrom.BOTTOM,
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
                              controller: con.confirmPasswordController,
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
                              hint: "Please Enter Confirm Password" ,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.BOTTOM,
                            child: CustomButton(
                              width: 250.w,
                              height: 50.h,
                              name: "signUp",
                              ontap: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  await con.register(context);
                                } else {
                                  setState(() {
                                    con.autoValidate = true;
                                  });
                                }
                              },
                            ),
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
                                      "Have An Account",
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
                                      .pushNamed(LoginScreen.routeName),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "signin" ,
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
                          SizedBox(
                            height: 20.h,
                          )
                        ]),

                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: InkWell(
                    //     // onTap: () => Navigator.of(context)
                    //     //     .pushNamed(ForgotPasswordScreen.routeName),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 25.0),
                    //       child: Text(
                    //         "forgot_password" ,
                    //         style: TextStyle(
                    //             color: ThemeClass.primaryColor,
                    //             fontSize: 12.sp,
                    //             height: 1.0),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
