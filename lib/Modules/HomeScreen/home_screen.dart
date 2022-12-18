import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/service_details_step1.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Modules/HomeScreen/widgets/carosel_widget.dart';
import '../../Widgets/no_reservations_widget.dart';
import '../ContractReservation/contract_reservation_screen.dart';
import '../PackageReservation/package_reservation_step1_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    children: [
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Hello, John Doe',
                              textStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ThemeClass.textColor),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 3,
                          pause: const Duration(milliseconds: 100),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                      const Spacer(),
                      FadeIn(
                          delay: 1,
                          from: SlideFrom.RIGHT,
                          child: GestureDetector(
                            // onTap: onTapNotification,
                            child: Badge(
                              elevation: 1,
                              position: BadgePosition.topStart(),
                              padding: EdgeInsets.all(3.w),
                              badgeColor: ThemeClass.primaryColor,
                              badgeContent: Text(
                                '0',
                                style: TextStyle(
                                    color: ThemeClass.whiteColor,
                                    fontSize: 10.sp),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                ),
                                child: Icon(Icons.notifications_none),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CarouselWidget(
                    productItem: con.contents,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  FadeIn(
                    delay: 1,
                    from: SlideFrom.LEFT,
                    child: Text(
                      'Reservation Type'.tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeClass.blackColor),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ReservationButton(
                    image: 'assets/images/Group 513875-2.png',
                    name: 'Single Reservation'.tr,
                    onTap: () => Navigator.of(context)
                          .pushNamed(ServiceDetailsStep1Screen.routeName),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  ReservationButton(
                    image: 'assets/images/Group 513876.png',
                    name: 'Package Reservation'.tr,
                    onTap: () => Navigator.of(context)
                          .pushNamed(PackageReservationStep1Screen.routeName),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  ReservationButton(
                    image: 'assets/images/Group 513877.png',
                    name: 'Contract Reservation'.tr,
                    onTap: () => Navigator.of(context)
                        .pushNamed(ContractReservationScreen.routeName),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  FadeIn(
                    delay: 1,
                    from: SlideFrom.LEFT,
                    child: Text(
                      'Latest Reservations'.tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeClass.blackColor),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FadeIn(
                      delay: 1,
                      from: SlideFrom.BOTTOM,
                      child: NoReservations()),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ReservationButton extends StatelessWidget {
  final String image, name;
  final Function() onTap;

  const ReservationButton(
      {Key? key, required this.image, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: ThemeClass.secondPrimaryColor,
          borderRadius: BorderRadius.circular(5.sp),
        ),
        alignment: Alignment.center,
        child: FadeIn(
          delay: 1,
          from: SlideFrom.LEFT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ThemeClass.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
