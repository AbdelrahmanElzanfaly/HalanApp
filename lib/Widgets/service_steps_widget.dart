import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';

class ServiceStepsWidget extends StatelessWidget {
  final int step;

  const ServiceStepsWidget({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeIn(
          delay: 1,
          from: SlideFrom.LEFT,
          child: Text(
            'Service Details'.tr,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ThemeClass.blackColor),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          width: 327.w,
          height: 2.h,
          decoration: BoxDecoration(
              color: ThemeClass.hint, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Container(
                width: (108 * step).w,
                height: 2.h,
                decoration: BoxDecoration(
                    color: ThemeClass.primaryColor,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
