import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeClass {
  static Color primaryColor = const Color(0xffF48C2B);
  static Color secondPrimaryColor = const Color(0xff004698);
  static Color accentColor = const Color(0xffE93C37);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color textColor = const Color(0xff606060);
  static Color hintColor = const Color(0xff919396);

  static Color blackColor = const Color(0xff292929);
  static Color greyColor = const Color(0x3da5a5a5);
  static Color blueColor = const Color(0xff22577A);
  static Color lightBlueColor = const Color(0xffDAEAF1);
  static Color yellowColor = const Color(0xffF0C929);
  static Color lightYellowColor = const Color(0xffF4E06D);
  static Color textFieldBackgroundColor = const Color(0xFFEDF8EC);
  static Color containerBackground = const Color(0xFFDDE9DC);
  static Color containerWBackground = const Color(0xFFFAF7EF);
  static Color backgroundAppBar = Colors.transparent;

  static LinearGradient gradientBtn = LinearGradient(
    colors: [
      primaryColor,
      const Color(0xff00B7A8),
      const Color(0xff10FFEA),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient screenGradient = const LinearGradient(
    colors: [
      Color(0xffDaEcD8),
      Color(0xffFDF1E2),
      Color(0xffFFF0EF),
      Color(0xffFDF1E2),
      Color(0xffDaEcD8),
    ],
    stops: [
      0.0,
      0.4,
      0.55,
      0.7,
      0.9,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.17),
      offset: Offset(
        0.0,
        2.w,
      ),
      // blurRadius: 17.0,
      // spreadRadius: 0.0,
    ), //BoxShadow
  ];

  static TextStyle defaultTextStyle = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: ThemeClass.blackColor);

  static BoxDecoration defaultDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.w),
    boxShadow: ThemeClass.boxShadow,
  );
  static BoxDecoration customDecoration = BoxDecoration(
    color: Colors.white,
    image: const DecorationImage(
        image: AssetImage('assets/images/lists/AD Bar - 1.png'),
        fit: BoxFit.cover),
    borderRadius: BorderRadius.circular(10.w),
  );
}
