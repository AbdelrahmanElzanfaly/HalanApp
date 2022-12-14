import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  const LoadingScreen({Key? key, required this.child,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        loading?Positioned.fill(
          child: Container(
            color: Colors.grey.withOpacity(0.3),
          ),
        ):const SizedBox(),
        loading?Positioned(
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.w),
            ),
            alignment: Alignment.center,
            child:  CircularProgressIndicator( color: ThemeClass.primaryColor,),
          ),
        ):const SizedBox(),
      ],
    );
  }
}
