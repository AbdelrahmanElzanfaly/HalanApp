import 'package:flutter/material.dart';

import '../Theme/theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MadeWidget extends StatelessWidget {
  final bool isSelected;
  final String image;
 final Function()? onSeeDetails;
  const MadeWidget(
      {Key? key,
      required this.isSelected,
      required this.image,
       this.onSeeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        width: 100.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: ThemeClass.containerBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isSelected
                  ? ThemeClass.primaryColor
                  : ThemeClass.containerBackground),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 50.h,
              width: 50.w,
              child: FadeIn(
                  delay: 1,
                  from: SlideFrom.BOTTOM,
                  child: CircleAvatar(backgroundImage: NetworkImage(image))),
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              width: 80,
              child: Center(
                child: FadeIn(
                  delay: 1,
                  from: SlideFrom.TOP,
                  child: Text(
                    'Jane Doe',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeClass.blackColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              width: 80,
              child: Center(
                child: FadeIn(
                  delay: 1,
                  from: SlideFrom.TOP,
                  child: Text(
                    'Recommended in your area',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeClass.hintColor),
                  ),
                ),
              ),
            ),
            if (onSeeDetails !=null)
              SizedBox(
                height: 10.h,
              ),
            if (onSeeDetails !=null)
              InkWell(
                onTap: onSeeDetails,
                child: SizedBox(
                  width: 80,
                  child: Center(
                    child: FadeIn(
                      delay: 1,
                      from: SlideFrom.TOP,
                      child: Text(
                        'See Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.secondPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
