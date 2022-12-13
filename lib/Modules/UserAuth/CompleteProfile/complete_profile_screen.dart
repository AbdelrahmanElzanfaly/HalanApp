import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/Layout/loading_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Theme/theme.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import 'complete_profile_controller.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const String routeName = "/CompleteProfileScreen";

  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends StateMVC<CompleteProfileScreen> {
  _CompleteProfileScreenState() : super(CompleteProfileController()) {
    con = CompleteProfileController();
  }

  late CompleteProfileController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

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
                              "Complete your profile".tr,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ThemeClass.textColor),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: CustomTextFieldWidget(
                              suffixIcon: const SizedBox(),
                              textInputType: TextInputType.emailAddress,
                              borderColor: Colors.grey.shade400,
                              controller: con.emailController,
                              hint: "Full Name".tr,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),

                          ///
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: InkWell(
                              onTap: () {
                                con.getCountry(context);
                              },
                              child: Container(
                                width: 350.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: 1.w),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Upload Profile Photo',
                                      style: TextStyle(
                                          color: ThemeClass.hintColor),
                                    ),
                                    const Spacer(),
                                    const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/id/237/200/300'),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      Icons.cloud_download_outlined,
                                      color: ThemeClass.blackColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///

                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: InkWell(
                              onTap: () {
                                con.getCountry(context);
                              },
                              child: Container(
                                width: 350.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: 1.w),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    con.countryName == null
                                        ? Text(
                                            "Country".tr,
                                            style: TextStyle(
                                                color: ThemeClass.hintColor),
                                          )
                                        : Text(
                                            con.countryName ?? '',
                                            style: TextStyle(
                                                color: ThemeClass.blackColor),
                                          ),
                                    const Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: ThemeClass.blackColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: CustomTextFieldWidget(
                              suffixIcon: const SizedBox(),
                              textInputType: TextInputType.number,
                              borderColor: Colors.grey.shade400,
                              controller: con.emailController,
                              hint: "Years Of Experience".tr,
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
                              height: 130.h,
                              suffixIcon: const SizedBox(),
                              isDense: false,
                              maxLine: 100,
                              borderColor: Colors.grey.shade400,
                              // controller: con.passwordController,
                              obscure: con.showPassword,
                              hint: "Tell Us About Your Self".tr,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomButton(
                            width: 250.w,
                            height: 50.h,
                            name: "Save & Continue".tr,
                            ontap: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await con.onSave(context);
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
                        ]),
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
