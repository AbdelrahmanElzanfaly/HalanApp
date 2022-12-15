import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/app_bar_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "/ForgotPasswordScreen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends StateMVC<ForgotPasswordScreen> {
  _ForgotPasswordScreenState() : super(ForgotPasswordController()) {
    con = ForgotPasswordController();
  }

  late ForgotPasswordController con;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            height: 600.h,
            padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                    height: 55.h,
                  ),
                  CustomButton(
                    height: 50.h,
                    width: 250.w,
                    ontap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await con.forgotPass(context);
                      } else {
                        setState(() {
                          con.autoValidate = true;
                        });
                      }
                    },
                    name: 'SendOTP'.tr,
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
