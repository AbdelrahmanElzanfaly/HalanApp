import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../Theme/theme.dart';

class CustomButton extends StatelessWidget {
  Function ontap;
  String? name;
  IconData? icon;
  final double? width;
  final double? fontsize;
  final double? height;

  CustomButton(
      { this.name,
      required this.ontap,
      this.width,
      this.height ,
      this.fontsize ,
      Key? key,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        delay: 1,
        from: SlideFrom.BOTTOM,
        child: Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => ontap(),
        child: Container(
          width: width??327.w,
          height: height??60.h,
          decoration: BoxDecoration(
            color: ThemeClass.secondPrimaryColor,
            borderRadius: BorderRadius.circular(25.w),
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
                fontSize: fontsize??16.sp),
          ),
        ),
      ),),
    );
  }
}
