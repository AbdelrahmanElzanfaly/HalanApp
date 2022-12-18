import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Widgets/custom_button.dart';

import '../../Theme/theme.dart';
import '../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';

class WaitingForConfirmationScreen extends StatelessWidget {
  static const String routeName = "/WaitingForConfirmationScreen";

  const WaitingForConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: 154.w,
            height: 223.h,
            child: Image.asset(
              'assets/images/Group 513887.png',
            ),
          ),
          SizedBox(
            height: 54.h,
          ),
          FadeIn(
            delay: 1,
            from: SlideFrom.TOP,
            child: Text(
              'Waiting For Confirmation',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeClass.blackColor),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 327,
            child: FadeIn(
              delay: 1,
              from: SlideFrom.LEFT,
              child: Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: ThemeClass.hintColor),
                ),
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
            ontap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              BottomNavigationBarScreen.routeName,
              (Route<dynamic> route) => false,
            ),
            name: 'Go Back To Home',
            width: 250.w,
            height: 50.h,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
