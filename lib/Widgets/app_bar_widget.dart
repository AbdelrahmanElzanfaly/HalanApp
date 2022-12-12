import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Control/app_languages.dart';
import '../Theme/theme.dart';

class AppBarWidget extends StatelessWidget {
  final double? height;
  final String? title;

  const AppBarWidget({Key? key,  this.height, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        height: height ?? 52.h,
        color: ThemeClass.backgroundAppBar,
        // padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child:
                      // appLan.appLocal.languageCode.toString() == 'en'
                      //     ?
                      const Icon(Icons.arrow_back_outlined)
                  // : const Icon(Icons.arrow_forward_outlined),
                  ),
            ),
            SizedBox(
              width: 17.w,
            ),
            if (title != null)
              Expanded(
                child: Text(
                  title ?? '',
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ));
  }
}
