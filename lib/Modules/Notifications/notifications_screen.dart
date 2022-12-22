import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Widgets/app_bar_widget.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = "/NotificationsScreen";

  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            AppBarWidget(
              title: 'Notifications',
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 12,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotificationWidget();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 327.w,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeClass.containerBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.lens_rounded,
                color: ThemeClass.secondPrimaryColor,
                size: 15.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Reservation has been approved!',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeClass.secondPrimaryColor),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'April 27, 2023 - 07:00 Pm',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeClass.hintColor),
                  ),
                ],
              ),
              // Icon(Icons.person_rounded)
              const Spacer(),
              Image.asset(
                'assets/images/Group 513897.png',
                width: 30.h,
                height: 30.h,
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
