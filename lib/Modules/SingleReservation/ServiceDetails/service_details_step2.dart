import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/ServiceDetails/service_details_controller.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

class ServiceDetailsStep2Screen extends StatefulWidget {
  static const String routeName = "/ServiceDetailsStep2Screen";

  const ServiceDetailsStep2Screen({Key? key}) : super(key: key);

  @override
  _ServiceDetailsStep2ScreenState createState() => _ServiceDetailsStep2ScreenState();
}

class _ServiceDetailsStep2ScreenState extends StateMVC<ServiceDetailsStep2Screen> {
  _ServiceDetailsStep2ScreenState() : super(ServiceDetailsController()) {
    con = ServiceDetailsController();
  }

  late ServiceDetailsController con;

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
                      "Settings".tr,
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

              ]),
            )));
  }
}

