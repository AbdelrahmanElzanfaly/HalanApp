import 'package:halan/Modules/ReservationsScreen/reservations_controller.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';

import '../../Theme/theme.dart';
import '../OrderDetails/order_details_screen.dart';

class ReservationsScreen extends StatefulWidget {
  static const String routeName = "/ReservationsScreen";

  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  _ReservationsScreenState createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends StateMVC<ReservationsScreen> {
  _ReservationsScreenState() : super(ReservationsController()) {
    con = ReservationsController();
  }

  late ReservationsController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 70.h,
            ),
            FadeIn(
              delay: 1,
              from: SlideFrom.LEFT,
              child: Center(
                child: Text(
                  "Reservations".tr,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.textColor),
                ),
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              width: 270.w,
              height: 31.h,
              decoration: BoxDecoration(
                  color: ThemeClass.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  ReservationsStatus(
                    isSelected: con.index == 0,
                    onTap: () {
                      setState(() {
                        con.index = 0;
                      });
                    },
                    title: 'Current',
                  ),
                  ReservationsStatus(
                    isSelected: con.index == 1,
                    onTap: () {
                      setState(() {
                        con.index = 1;
                      });
                    },
                    title: 'Pending',
                  ),
                  ReservationsStatus(
                    isSelected: con.index == 2,
                    onTap: () {
                      setState(() {
                        con.index = 2;
                      });
                    },
                    title: 'Past',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: con.index == 0
                    ? 4
                    : con.index == 1
                        ? 2
                        : 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return con.index == 0
                      ? ReservationsItemList(
                          title: '#33333333',
                          date: 'Date : 12-03-2022',
                          price: 'AED 1000.00',
                          onDetails: () => Navigator.pushNamed(context, OrderDetailsScreen.routeName),
                        )
                      : con.index == 1
                          ? ReservationsItemList(
                              title: '#2222222',
                              date: 'Date : 12-03-2022',
                              price: 'AED 1000.00',
                              onDetails: () => Navigator.pushNamed(context, OrderDetailsScreen.routeName),
                            )
                          : ReservationsItemList(
                              title: '#1111111',
                              date: 'Date : 01-03-2022',
                              price: 'AED 2000.00',
                              onDetails: () => Navigator.pushNamed(context, OrderDetailsScreen.routeName),
                            );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ]),
        )));
  }
}

class ReservationsItemList extends StatelessWidget {
  final String title, date, price;
  final Function() onDetails;

  const ReservationsItemList(
      {Key? key,
      required this.title,
      required this.date,
      required this.price,
      required this.onDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: 327.w,
      decoration: BoxDecoration(
        color: ThemeClass.whiteColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 12.w,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  FadeIn(
                    delay: 1,
                    from: SlideFrom.LEFT,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.textColor),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 85.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: ThemeClass.secondPrimaryColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: FadeIn(
                  delay: 1,
                  from: SlideFrom.RIGHT,
                  child: Text(
                    price,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeClass.whiteColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              FadeIn(
                delay: 1,
                from: SlideFrom.LEFT,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    date,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeClass.hintColor),
                  ),
                ),
              ),
              const Spacer(),
              FadeIn(
                delay: 1,
                from: SlideFrom.BOTTOM,
                child: GestureDetector(
                  onTap: onDetails,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: ThemeClass.primaryColor),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 15.h,
                          color: ThemeClass.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

class ReservationsStatus extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
  final String title;

  const ReservationsStatus(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 31.h,
        decoration: BoxDecoration(
            color: isSelected ? ThemeClass.primaryColor : ThemeClass.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? ThemeClass.whiteColor : ThemeClass.textColor),
        ),
      ),
    );
  }
}
