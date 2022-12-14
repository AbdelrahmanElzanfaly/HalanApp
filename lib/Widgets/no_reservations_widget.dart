import 'package:flutter/material.dart';

import '../Theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoReservations extends StatelessWidget {
  const NoReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 223.h,
      decoration: BoxDecoration(
          color: ThemeClass.containerBackground,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Image 12.png',
            width: 100.w,
            height: 100.h,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'You Don’t Have Any Reservations Yet!',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ThemeClass.textColor),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: 217.w,
            child: Text(
              'You can Start by Choosing your reservation type and complete filling your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeClass.hintColor),
            ),
          ),
        ],
      ),
    );
  }
}
