import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/PackageReservation/package_reservation_controller.dart';
import 'package:halan/Modules/SingleReservation/service_details_controller.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/service_details_controller.dart';
import 'package:halan/Modules/SingleReservation/Widgets/questions_widgets.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/service_steps_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../../modules/SingleReservation/Widgets/button_action_widget.dart';
import '../../modules/SingleReservation/Widgets/question_card_title_widget.dart';
import '../AdditionalInformation/additional_information_screen.dart';
import '../SingleReservation/Widgets/question_card_widget.dart';

class PackageReservationStep2Screen extends StatefulWidget {
  static const String routeName = "/PackageReservationStep2Screen";

  const PackageReservationStep2Screen({Key? key}) : super(key: key);

  @override
  _PackageReservationStep2ScreenState createState() =>
      _PackageReservationStep2ScreenState();
}

class _PackageReservationStep2ScreenState
    extends StateMVC<PackageReservationStep2Screen> {
  _PackageReservationStep2ScreenState()
      : super(PackageReservationController()) {
    con = PackageReservationController();
  }

  late PackageReservationController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            bottomNavigationBar: ButtonActionWidget(
              onNext: () {
                Navigator.pushNamed(context, AdditionalInformationScreen.routeName,arguments: 'Package Reservation'.tr);
              },
              totalPrice: 'AED 97.00',
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      FadeIn(
                          delay: 1,
                          from: SlideFrom.LEFT,
                          child: AppBarWidget(
                            title: 'Package Reservation'.tr,
                          )),
                      SizedBox(
                        height: 23.h,
                      ),
                      ServiceStepsWidget(
                        title: 'Service Details'.tr,
                        step: 2,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 327,
                        child: FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Text(
                            'Which nationality do you prefer ?',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeClass.blackColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 36.h,
                        child: ListView.builder(
                          itemCount: 12,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  con.indexNationality = index;
                                  setState(() {});
                                },
                                child: QuestionCardWidget(
                                    isSelected: index == con.indexNationality,
                                    title: 'Egyptian'));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      SizedBox(
                        width: 327,
                        child: FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Text(
                            'The period is from hour to hour ..',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeClass.blackColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 36.h,
                        child: ListView.builder(
                          itemCount: 12,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  con.indexHour = index;
                                  setState(() {});
                                },
                                child: QuestionCardWidget(
                                    isSelected: index == con.indexHour,
                                    title: '8:00 - 8:30'));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      QuestionCardTitleWidget(),
                      SizedBox(
                        height: 36.h,
                      ),
                      SizedBox(
                        width: 327,
                        child: FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Text(
                            'Do you have any specific cleaning instructions?',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeClass.blackColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.LEFT,
                        child: CustomTextFieldWidget(
                          height: 130.h,
                          suffixIcon: const SizedBox(),
                          isDense: false,
                          maxLine: 100,
                          backGroundColor: ThemeClass.containerBackground,
                          borderColor: Colors.grey.shade400.withOpacity(0.2),
                          // controller: con.aboutYourSelfController,
                          hint:
                          "Example : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          validator: (String? v) {
                            if (v == null || v.isEmpty) return "";
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                    ]),
              ),
            )));
  }
}
