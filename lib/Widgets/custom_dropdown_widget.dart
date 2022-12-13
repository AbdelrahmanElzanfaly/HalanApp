import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final Widget? prefixIcon;
  final Color? borderColor;
  final double? width;
  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final void Function(T?) onChange;
  final String hint;
  final String? Function(dynamic)? validate;

  const CustomDropDownWidget(
      {Key? key,
      this.prefixIcon,
      this.selected,
      required this.onChange,
      required this.hint,
      this.validate,
      this.width,
      required this.items,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: width??350.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.w),
        child: DropdownButtonFormField<T>(
          validator: validate,
          iconSize: 0.0,
          value: selected,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
          dropdownColor: const Color(0xffEDEEF3),
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(color: ThemeClass.primaryColor)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
            enabled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(color: ThemeClass.primaryColor)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            )),
            suffixIcon: prefixIcon,
            filled: true,
            fillColor: ThemeClass.whiteColor,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
            // icon: prefixIcon
          ),
          items: items,
          onChanged: onChange,
        ),
      ),
    );
  }
}
