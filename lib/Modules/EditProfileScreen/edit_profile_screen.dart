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
                      title: 'reset_password'.tr,
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
                            hint: "John",
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
                            hint: "Doe",
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
                        hint: "John.doe@gmail.com",
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
                      height: 28.h,
                    ),
                    Row(
                      children: [
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: Text(
                            "Saved Addresses".tr,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeClass.textColor),
                          ),
                        ),
                        const Spacer(),
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.RIGHT,
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: ThemeClass.primaryColor,
                                ),
                                Text(
                                  "Add Address".tr,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeClass.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ...[1, 2, 3].map(
                      (e) => AddressDetailsWidget(
                        onEdit: () {},
                        onDelete: () {},
                        title: "Home Address",
                        fullAddress:
                            '7th Street Zakaria Moustafa, Bolak Eldakrour, Giza.Appartment No. 15, 5th Floor.',
                        specialMark: ' Next to Abdelnaser Mosque.',
                        location: 'https://goo.gl/maps/1XgFKbDdFJx5MyQV9',
                      ),
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
