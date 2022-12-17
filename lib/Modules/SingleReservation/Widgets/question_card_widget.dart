import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Theme/theme.dart';

class QuestionCardWidget extends StatelessWidget {
  final bool isSelected;
  final String title;

  const QuestionCardWidget(
      {Key? key, required this.isSelected, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: 1,
      from: SlideFrom.LEFT,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          height: 36.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: isSelected
                  ? ThemeClass.secondPrimaryColor
                  : ThemeClass.greyColor),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? ThemeClass.whiteColor
                      : ThemeClass.textColor),
            ),
          ),
        ),
      ),
    );
  }
}

