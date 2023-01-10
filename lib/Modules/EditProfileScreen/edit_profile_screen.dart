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
import '../../Shared/shared_preferances.dart';
import '../../Widgets/address_details_widget.dart';
import 'edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = "/EditProfileScreen";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends StateMVC<EditProfileScreen> {
  _EditProfileScreenState() : super(EditProfileController()) {
    con = EditProfileController();
  }

  late EditProfileController con;

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
                      height: 70.h,
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
                                    ?  NetworkImage( SharedPref.getUserObg() ?.photo??
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
                    Row(
                      children: [
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: CustomTextFieldWidget(
                            width: 156.w,
                            suffixIcon: const SizedBox(),
                            isDense: true,
                            textInputType: TextInputType.number,
                            borderColor: Colors.grey.shade400,
                            controller: con.firstNameController,
                            hint: SharedPref.getUserObg() ?.name??'',
                            validator: (String? v) {
                              if (v == null || v.isEmpty) return "";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.RIGHT,
                          child: CustomTextFieldWidget(
                            width: 156.w,
                            suffixIcon: const SizedBox(),
                            isDense: true,
                            textInputType: TextInputType.number,
                            borderColor: Colors.grey.shade400,
                            controller: con.endNameController,
                            hint: '',
                            validator: (String? v) {
                              if (v == null || v.isEmpty) return "";
                              return null;
                            },
                          ),
                        ),
                      ],
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
                        hint: SharedPref.getUserObg() ?.email??'',
                        // validator: (String? v) {
                        //   // if (!v!.contains('@') || !v.contains('.')) {
                        //     return 'Invalid Email';
                        //   }
                          // return null;
                        // },
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
                        hint: SharedPref.getUserObg()?.phone??'',
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
                      height: 41.h,
                    ),
                    FadeIn(
                      delay: 1,
                      from: SlideFrom.BOTTOM,
                      child: CustomButton(
                        height: 50.h,
                        width: 250.w,
                        ontap: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            con.onSave(context);
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
