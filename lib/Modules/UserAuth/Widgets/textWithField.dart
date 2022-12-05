import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halan/Utilities/helper.dart';
import '../../../Theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../Widgets/custom_textfeild_widget.dart';

class TextWithField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final String? des;
  final Color? backgroundColor;

  const TextWithField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      this.des,this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeIn(
          delay: 2,
          from: SlideFrom.BOTTOM,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: ThemeClass.blackColor,
                    fontWeight: FontWeight.w400),
              ),
              des != null
                  ? Text(
                      des!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: ThemeClass.greyColor,
                          fontWeight: FontWeight.w400),
                    )
                  : Container()
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        FadeIn(
          delay: 2,
          from: SlideFrom.BOTTOM,
          child: CustomTextFieldWidget(
            formatter: title == "phone_number".tr
                ? [
                    LengthLimitingTextInputFormatter(12),
                  ]
                : null,
            textInputType:
                title == "phone_number".tr ? TextInputType.phone : null,
            width: 378.w,
            backGroundColor: Colors.transparent,
            controller: controller,
            hint: hint,
            validator: (String? v) {
              if (v == null || v.isEmpty) return "";
              return null;
            },
          ),
        ),
      ],
    );
  }
}
