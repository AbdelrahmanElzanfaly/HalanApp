import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../Widgets/custom_button.dart';
import '../../../modules/UserAuth/Register/register_screen.dart';

class UserType extends StatefulWidget {
  static String routeName = "/UserType";

  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

int index = 0;

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 130.h,
          ),

          FadeIn(
            delay: 1,
            from: SlideFrom.LEFT,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 50.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please choose',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.textColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          UserTypeWidget(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              isSelected: index == 0,
              image: 'assets/images/Group 26649.png',
              title: 'Client'.tr),
          SizedBox(
            height: 16.h,
          ),
          UserTypeWidget(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              isSelected: index == 1,
              image: 'assets/images/Group 513795.png',
              title: 'Service_Provider'.tr),
          const Spacer(),
          CustomButton(
            width: 250.w,
            height: 50.h,
            name: 'Next'.tr,
            ontap: () {
              index == 0
                  ? Navigator.of(context)
                      .pushNamed(RegisterScreen.routeName, arguments: 0)
                  : Navigator.of(context)
                      .pushNamed(RegisterScreen.routeName, arguments: 1);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class UserTypeWidget extends StatelessWidget {
  final Function() onTap;
  final String image, title;
  final bool isSelected;

  const UserTypeWidget(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.title,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 200.h,
          width: 276.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),

            border: Border.all(
                color: isSelected
                    ? ThemeClass.primaryColor
                    : ThemeClass.greyColor),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              FadeIn(
              delay: 1,
              from: SlideFrom.LEFT,
              child:   Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                ),),
          FadeIn(
              delay: 1,
              from: SlideFrom.RIGHT,
              child:  Center(
                  child: Image.asset(
                    image,
                    width: 188.w,
                    height: 140.h,
                  ),
                ),),
              ]),
        ),
      ),
    );
  }
}
