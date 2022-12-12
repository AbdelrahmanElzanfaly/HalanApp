import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashContentWidget extends StatelessWidget {
  SplashContentWidget({
    required this.title,
    required this.icon,
    this.first = false,
  });

  final String title, icon;
  bool? first;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        first == true
            ? SizedBox(
                width: 51.w,
              )
            : const SizedBox(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 11.5.w, horizontal: 13.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                color: Color(0xffD4D4D4),
                offset: Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 17.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.w),
                bottomLeft: Radius.circular(20.w)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyle(fontSize: 25.sp)),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                icon,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
