import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Theme/theme.dart';

class ToastHelper{

  static FToast fToast = FToast();

  static init(BuildContext context){
    fToast.init(context);
  }

  static Future showError({required String message,Color? backgroundColor})async{
    fToast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 20.w),
        decoration: BoxDecoration(
          color: backgroundColor??Colors.redAccent,
          borderRadius: BorderRadius.circular(50.w),
        ),child: Text(message,
        style: TextStyle(color: Colors.white,fontSize: 18.sp),),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

  }

  static Future showSuccess({required String message,Color? backgroundColor})async{
    fToast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 20.w),
        decoration: BoxDecoration(
          color: backgroundColor??ThemeClass.primaryColor,
          borderRadius: BorderRadius.circular(50.w),
        ),child: Text(message,
        style: TextStyle(color: Colors.white,fontSize: 18.sp),),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );


  }
}