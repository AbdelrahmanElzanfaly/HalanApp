import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';

class CustomButton extends StatelessWidget {
  Function ontap;
  String? name;
  IconData? icon;
  final double width;
  final double fontsize;
  final double height;

  CustomButton(
      { this.name,
        required this.ontap,
        this.width = 327,
        this.height = 60,
        this.fontsize = 16,
        Key? key,
        this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => ontap(),
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: ThemeClass.primaryColor,
            borderRadius: BorderRadius.circular(10.w),
            // boxShadow: [
            //   BoxShadow(
            //     color:
            //   Colors.grey.withOpacity(0.6),
            //     spreadRadius: 1,
            //     blurRadius: 10,
            //     offset: const Offset(0, 3), // changes position of shadow
            //   ),
            // ],
          ),
          alignment: Alignment.center,
          child: icon != null ? Icon(icon):Text(
            name ??'',
            style: TextStyle(
                color: Colors.white,
                fontSize: fontsize.sp),
          ),
        ),
      ),
    );
  }
}
