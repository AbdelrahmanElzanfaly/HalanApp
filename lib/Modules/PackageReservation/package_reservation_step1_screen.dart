import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/PackageReservation/package_reservation_controller.dart';
import 'package:halan/Modules/PackageReservation/package_reservation_step2_screen.dart';
import 'package:halan/Modules/SingleReservation/service_details_controller.dart';
import 'package:halan/Modules/SingleReservation/Widgets/questions_widgets.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/service_steps_widget.dart';
import 'package:halan/modules/SingleReservation/Widgets/button_action_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../modules/SingleReservation/Widgets/question_card_title_widget.dart';

class PackageReservationStep1Screen extends StatefulWidget {
  static const String routeName = "/PackageReservationStep1Screen";

  const PackageReservationStep1Screen({Key? key}) : super(key: key);

  @override
  _PackageReservationStep1ScreenState createState() =>
      _PackageReservationStep1ScreenState();
}

class _PackageReservationStep1ScreenState
    extends StateMVC<PackageReservationStep1Screen> {
  _PackageReservationStep1ScreenState() : super(PackageReservationController()) {
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
                Navigator.pushNamed(
                    context, PackageReservationStep2Screen.routeName);
              },
              totalPrice: 'AED 97.00',
            ),
            body: Container(
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
                      step: 1,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    QuestionsWidgets(
                      length: 5,
                      start: 1,
                      onTap: (index) {
                        print(index + 1);
                      },
                      title: 'How many professionals do you need ?',
                      isTime: false,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    QuestionsWidgets(
                      length: 12,
                      start: 2,
                      onTap: (index) {
                        print(index + 2);
                      },
                      title:
                          'How many month do you need your professional to stay ?',
                      isTime: false,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    QuestionsWidgets(
                      length: 12,
                      start: 2,
                      onTap: (index) {
                        print(index + 2);
                      },
                      title:
                          'How many days a week do you need your professional to stay ?',
                      isTime: false,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    QuestionsWidgets(
                      length: 12,
                      start: 2,
                      onTap: (index) {
                        print(index + 2);
                      },
                      title:
                          'How many hours a day do you need your professional to stay ?',
                      isTime: false,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                  ]),
            )));
  }
}
