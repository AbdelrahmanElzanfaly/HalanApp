import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/app_bar_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../ForgotPasswordScreen/forgot_password_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class ResetPasswordScreen extends StatefulWidget {
  static String routeName = "/ResetPasswordScreen";
final bool forgetPassword;
final String email;
  const ResetPasswordScreen({Key? key, required this.forgetPassword,required this.email}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends StateMVC<ResetPasswordScreen> {
  _ResetPasswordScreenState() : super(ForgotPasswordController()) {
    con = ForgotPasswordController();
  }

  late ForgotPasswordController con;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    con.loading = false;
    con.autoValidate = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            height: 800.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              autovalidateMode: con.autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),

                  AppBarWidget(
                    title: 'reset_password'.tr,
                  ),

                  SizedBox(
                    height: 38.h,
                  ),
                  SizedBox(
                    width: 230.w,
                    child: Text("Registered_Get_OTP".tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black45,
                        )),
                  ),
                  SizedBox(
                    height: 64.h,
                  ),


                 widget.forgetPassword? const SizedBox(): CustomTextFieldWidget(
                    prefixIcon: const Icon(Icons.lock),
                    width: 327.w,
                    borderColor: Colors.grey.shade400,
                    controller: con.oldPasswordController,
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
                    hint: "old Password".tr,
                    validator: (String? v) {
                      if (v == null || v.isEmpty) return "";
                      return null;
                    },
                  ) ,
                  widget.forgetPassword? const SizedBox():       SizedBox(
                    height: 16.h,
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
                    height: 16.h,
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
                      hint: "Please Enter Password".tr,
                      validator: (String? v) {
                        if (v == null || v.isEmpty) return "";
                        return null;
                      },
                    ),
                  ),

                  SizedBox(
                    height: 55.h,
                  ),
                  CustomButton(
                    width: 250.w,
                    height: 50.h,
                    ontap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (con.passwordController.text ==
                            con.confirmPasswordController.text) {

                          widget.forgetPassword? await con.resetNewPassword(context,widget.email):  await con.resetPassword(context);
                        }
                      } else {
                        setState(() {
                          con.autoValidate = true;
                        });
                      }
                    },
                    name: 'Confirm'.tr,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
