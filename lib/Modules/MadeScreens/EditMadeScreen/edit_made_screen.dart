import 'dart:io';

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
import 'edit_made_controller.dart';


class EditMadeScreen extends StatefulWidget {
  static String routeName = "/EditMadeScreen";

  const EditMadeScreen({Key? key}) : super(key: key);

  @override
  _EditMadeScreenState createState() => _EditMadeScreenState();
}

class _EditMadeScreenState extends StateMVC<EditMadeScreen> {
  _EditMadeScreenState() : super(EditMadeController()) {
    con = EditMadeController();
  }

  late EditMadeController con;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: LoadingScreen(
        loading: con.loading,
        child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
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
                      height: 50.h,
                    ),
                    AppBarWidget(
                      title: 'Edit Profile'.tr,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    FadeIn(
                      delay: 2,
                      from: SlideFrom.TOP,
                      child: Center(
                        child: Container(
                          height: 100.w,
                          width: 100.w,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.blueAccent),
                            color: ThemeClass.hint,
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: con.userImage == null
                                    ? const NetworkImage(
                                    'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg')
                                    : FileImage(File(con.userImage!.path))
                                as ImageProvider,
                                fit: BoxFit.fill),
                          ),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                              onTap: () async {
                                con.userImage =
                                await Helper.pickImage(context: context);
                                setState(() {});
                              },
                              child: Container(
                                width: 30.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: ThemeClass.primaryColor),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: ThemeClass.whiteColor,
                                  size: 16.w,
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    FadeIn(
                      delay: 1,
                      from: SlideFrom.LEFT,
                      child: Text(
                        "Basic Info".tr,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeClass.textColor),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    FadeIn(
                      delay: 1,
                      from: SlideFrom.LEFT,
                      child: CustomTextFieldWidget(
                        suffixIcon: const SizedBox(),
                        isDense: true,
                        textInputType: TextInputType.number,
                        borderColor: Colors.grey.shade400,
                        controller: con.firstNameController,
                        hint: "John",
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
                        suffixIcon: const SizedBox(),
                        isDense: true,
                        textInputType: TextInputType.number,
                        borderColor: Colors.grey.shade400,
                        controller: con.phoneController,
                        hint: "01000395841",
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
                        textInputType: TextInputType.emailAddress,
                        borderColor: Colors.grey.shade400,
                        controller: con.emailController,
                        hint: '5 Years of experience',
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
                        height: 100.h,
                        suffixIcon: const SizedBox(),
                        isDense: false,
                        maxLine: 100,
                        borderColor: Colors.grey.shade400,
                        controller: con.emailController,
                        hint:  'I???m very good at house work, very clean  and organized person, quite, and bla bla bla.',
                        validator: (String? v) {
                          if (v == null || v.isEmpty) return "";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    FadeIn(
                      delay: 1,
                      from: SlideFrom.BOTTOM,
                      child: CustomButton(
                        height: 50.h,
                        width: 250.w,
                        ontap: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                          } else {
                            setState(() {
                              con.autoValidate = true;
                            });
                          }
                        },
                        name: 'Save & Continue'.tr,
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
