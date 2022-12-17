import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/theme.dart';
class ButtonActionWidget extends StatelessWidget {
  final String totalPrice;
  final Function()? onNeedHelp, onNext, onCheckout;

  const ButtonActionWidget(
      {Key? key, this.onNeedHelp, this.onNext, this.onCheckout, required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ThemeClass.whiteColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffD4D4D4),
              offset: Offset(
                1.0,
                1.0,
              ),
              blurRadius: 17.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          border: Border.all(color: ThemeClass.hint, width: 1.w),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeIn(
                delay: 1,
                from: SlideFrom.TOP,
                child: Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: ThemeClass.blackColor),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              FadeIn(
                delay: 1,
                from: SlideFrom.TOP,
                child: Text(
                  totalPrice,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.textColor),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 24.w,
          ),
          const Spacer(),
          if (onNeedHelp != null)
            FadeIn(
                delay: 1,
                from: SlideFrom.LEFT,
                child:     InkWell(
              onTap: onNeedHelp,
              child: Container(
                width: 114.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(color: ThemeClass.primaryColor),
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeClass.whiteColor),
                alignment: Alignment.center,
                child: Text(
                  'Need help ?',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.primaryColor),
                ),
              ),)
            ),
          SizedBox(
            width: 6.w,
          ),
          if (onCheckout != null)
            FadeIn(
                delay: 1,
                from: SlideFrom.LEFT,
                child:   InkWell(
              onTap: onCheckout,
              child: Container(
                width: 114.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeClass.primaryColor),
                alignment: Alignment.center,
                child: Text(
                  'Check out',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.whiteColor),
                ),
              ),),
            ),
          if (onNext != null)
    FadeIn(
    delay: 1,
    from: SlideFrom.LEFT,
    child:    InkWell(
              onTap: onNext,
              child: Container(
                width: 114.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeClass.primaryColor),
                alignment: Alignment.center,
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.whiteColor),
                ),
              ),
            ),),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
