import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/ReferToFriend/refer_and_earn_controller.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../Theme/theme.dart';
import '../../Utilities/Layout/loading_screen.dart';
import '../../Widgets/address_details_widget.dart';
import '../../Widgets/app_bar_widget.dart';
import '../../Widgets/custom_button.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routeName = "/OrderDetailsScreen";

  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends StateMVC<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // con.getMyReferAndEarn();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      // loading: con.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                const AppBarWidget(
                  title: 'Reservation #21568945',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Center(
                            child: Text(
                              'Placed On : 12-03-2022',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeClass.hintColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Center(
                            child: Text(
                              'Type : Single reservation',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeClass.hintColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 75.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ThemeClass.greenWColor),
                      alignment: Alignment.center,
                      child: Text(
                        'Ongoing',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.greenTColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: Text(
                    'Service Details',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeClass.blackColor),
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Container(
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: ThemeClass.hint,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...[1, 2, 3, 6, 5].map((e) {
                          return SizedBox(
                            height: 60.h,
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
                                      color: ThemeClass.primaryColor,
                                      size: 15.sp,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'How many professionals do you need ?',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: ThemeClass
                                                  .secondPrimaryColor),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          'Answer : 1.',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeClass.hintColor),
                                        ),
                                      ],
                                    ),
                                    // Icon(Icons.person_rounded)
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    )),
                SizedBox(
                  height: 16.h,
                ),
                FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: Text(
                    "Address Details".tr,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeClass.textColor),
                  ),
                ),
                AddressDetailsWidget(
                  onEdit: () {},
                  onDelete: () {},
                  title: "Home Address",
                  fullAddress:
                      '7th Street Zakaria Moustafa, Bolak Eldakrour, Giza.Appartment No. 15, 5th Floor.',
                  specialMark: ' Next to Abdelnaser Mosque.',
                  location: 'https://goo.gl/maps/1XgFKbDdFJx5MyQV9',
                  isSelected: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: Text(
                    "Payment details",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeClass.textColor),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 327.w,
                  height: 84.h,
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  decoration: BoxDecoration(
                      color: ThemeClass.hint,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: Text.rich(TextSpan(
                              text: 'Payment Method :   ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: ThemeClass.textColor,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: ' Credit card.',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeClass.hintColor),
                                )
                              ]))),
                      SizedBox(
                        height: 13.h,
                      ),
                      FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: Text.rich(TextSpan(
                              text: 'Amount :   ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: ThemeClass.textColor,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: ' AED 97.00',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeClass.hintColor),
                                )
                              ]))),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
