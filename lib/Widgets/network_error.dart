import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';

import '../../../Theme/theme.dart';

class NetworkError extends StatelessWidget {
  static const String routeName = "/NetworkError";

  const NetworkError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 35.h,
          ),
          // AppBarWidget(icon: Icons.arrow_back_ios, onTap: (){}),

          SizedBox(
              width: 400.w,
              height: 550.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Network_Error'.tr,
                      style: TextStyle(
                          color: ThemeClass.hintColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Image.asset('assets/images/network_error.png'),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
