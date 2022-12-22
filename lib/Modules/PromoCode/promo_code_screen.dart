import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/app_bar_widget.dart';

class PromoCodeScreen extends StatelessWidget {
  static const String routeName = "/PromoCodeScreen";

  const PromoCodeScreen({Key? key}) : super(key: key);

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
              title: 'Promotions'.tr,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PromoCodeWidget(
                      offer: '',
                      applicable: '',
                      date: '',
                      active: true,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCodeWidget extends StatelessWidget {
  final String offer, applicable, date;
  final bool active;

  const PromoCodeWidget(
      {Key? key,
      required this.offer,
      required this.applicable,
      required this.date,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 327.w,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeClass.containerBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '50% off Single Reservation.',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeClass.textColor),
              ),
              SizedBox(
                width: 10.w,
              ),

              // Icon(Icons.person_rounded)
              const Spacer(),
              Container(
                width: 64.w,
                height: 17.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ThemeClass.greenWColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Active',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.greenTColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            'Applicable on : Single reservations only.',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: ThemeClass.hintColor),
          ),
          SizedBox(
            height: 5.w,
          ),
          const Divider(),
          SizedBox(
            height: 5.w,
          ),
          Text(
            '1 Aug - 23 aug, 2023',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: ThemeClass.hintColor),
          ),
        ],
      ),
    );
  }
}
