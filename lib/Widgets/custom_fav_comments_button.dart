import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavAndCommentButtonWidget extends StatelessWidget {
  const FavAndCommentButtonWidget({
    required this.iconName,
    required this.number,
  });

  final IconData iconName;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.5.h),
      decoration: BoxDecoration(
          color: const Color(0xffA5A5A5).withOpacity(0.30),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconName,
            size: 25.w,
          ),
          SizedBox(width: 10.w),
          Text(number),
        ],
      ),
    );
  }
}
