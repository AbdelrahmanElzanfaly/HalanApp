import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';

import '../Theme/theme.dart';

class AddressDetailsWidget extends StatelessWidget {
  final Function() onEdit, onDelete;
  final String title, fullAddress, specialMark, location;
final bool isSelected;
  const AddressDetailsWidget(
      {Key? key,
      required this.onEdit,
      required this.onDelete,
      required this.title,
      required this.fullAddress,
      required this.specialMark,
      required this.location, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        border:Border.all(color: isSelected?ThemeClass.primaryColor:ThemeClass.hint),
          borderRadius: BorderRadius.circular(10),
          color: ThemeClass.backgroundAppBar),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeIn(
                delay: 1,
                from: SlideFrom.LEFT,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: ThemeClass.textColor),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: SizedBox(
                    width: 215.w,
                    child: Text(
                     fullAddress,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeClass.hintColor),
                      textAlign: TextAlign.start,
                    ),
                  )),
              SizedBox(
                height: 3.h,
              ),
              FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: Text.rich(TextSpan(
                      text: 'Special Mark'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: ThemeClass.hintColor,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: specialMark,
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeClass.hintColor),
                        )
                      ]))),
              SizedBox(
                height: 3.h,
              ),
              FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: Text.rich(TextSpan(
                      text: 'Location'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: ThemeClass.hintColor,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: location,
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeClass.primaryColor),
                        )
                      ]))),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              FadeIn(
                delay: 1,
                from: SlideFrom.RIGHT,
                child: InkWell(
                    onTap: onEdit,
                    child: Image.asset(
                      'assets/images/Group 513878.png',
                      width: 40.w,
                      height: 40.h,
                    )),
              ),
              FadeIn(
                  delay: 1,
                  from: SlideFrom.RIGHT,
                  child: InkWell(
                    onTap: onDelete,
                    child: Image.asset(
                      'assets/images/Group 513879.png',
                      width: 40.w,
                      height: 40.h,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
