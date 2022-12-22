import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/service_details_controller.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:halan/Widgets/service_steps_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../../Widgets/made_widget.dart';
import '../../modules/SingleReservation/Widgets/button_action_widget.dart';
import '../AdditionalInformation/additional_information_screen.dart';

import 'Widgets/question_card_widget.dart';

class ServiceDetailsStep2Screen extends StatefulWidget {
  static const String routeName = "/ServiceDetailsStep2Screen";

  const ServiceDetailsStep2Screen({Key? key}) : super(key: key);

  @override
  _ServiceDetailsStep2ScreenState createState() =>
      _ServiceDetailsStep2ScreenState();
}

class _ServiceDetailsStep2ScreenState
    extends StateMVC<ServiceDetailsStep2Screen> {
  _ServiceDetailsStep2ScreenState() : super(ServiceDetailsController()) {
    con = ServiceDetailsController();
  }

  late ServiceDetailsController con;
  int indexNationality = 0;
  int indexMade = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            bottomNavigationBar: ButtonActionWidget(
              onNext: () {
               Navigator.pushNamed(context, AdditionalInformationScreen.routeName,arguments: 'Single Reservation'.tr);
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
                            title: 'Single Reservation'.tr,
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
                                  indexNationality = index;
                                  setState(() {});
                                },
                                child: QuestionCardWidget(
                                    isSelected: index == indexNationality,
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
                            'Pick the professional of your choice ..',
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
                        height: 130.h,
                        child: ListView.builder(
                          itemCount: 12,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  indexMade = index;
                                  setState(() {});
                                },
                                child: MadeWidget(
                                  isSelected: indexMade == index,
                                  image:
                                      'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
                                ));
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

