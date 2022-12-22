import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Theme/theme.dart';

class SettingItems extends StatelessWidget {
  final String name, image;
  final Function() onTap;

  const SettingItems(
      {Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            SizedBox(
              width: 17.w,
            ),
            FadeIn(
              delay: 1,
              from: SlideFrom.LEFT,
              child: SizedBox(
                  width: 24.w, height: 24.h, child: Image.asset(image)),
            ),
            SizedBox(
              width: 17.w,
            ),
            FadeIn(
              delay: 1,
              from: SlideFrom.TOP,
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeClass.hintColor),
              ),
            ),
            const Spacer(),
            FadeIn(
              delay: 1,
              from: SlideFrom.RIGHT,
              child: Icon(
                Icons.arrow_forward_ios,
                color: ThemeClass.hintColor,
                size: 15.sp,
              ),
            ),
            SizedBox(
              width: 17.w,
            ),
          ],
        ),
      ),
    );
  }
}
