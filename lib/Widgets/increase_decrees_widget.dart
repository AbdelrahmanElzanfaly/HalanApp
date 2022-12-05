import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/theme.dart';

class IncreaseDecreesWidget extends StatelessWidget {
  const IncreaseDecreesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 23.w,
          height: 26.w,
         
          decoration: BoxDecoration(
            color: ThemeClass.blackColor,
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Icon(
            Icons.add,
            size: 12.sp,
            color: ThemeClass.whiteColor,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          "1",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.sp,
              color: ThemeClass.blackColor),
        ),
        SizedBox(
          width: 6.w,
        ),
        Container(
          width: 23.w,
          height: 26.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              border: Border.all(color: ThemeClass.blackColor)),
          child: Icon(
            Icons.remove,
            size: 12.sp,
          ),
        ),
      ],
    );
  }
}
