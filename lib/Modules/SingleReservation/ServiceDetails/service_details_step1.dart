import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/ServiceDetails/service_details_controller.dart';
import 'package:halan/Modules/SingleReservation/Widgets/questions_widgets.dart';
import 'package:halan/Theme/theme.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/service_steps_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/app_bar_widget.dart';
import 'package:intl/intl.dart';

import '../Widgets/button_action_widget.dart';
import '../Widgets/question_card_title_widget.dart';

class ServiceDetailsStep1Screen extends StatefulWidget {
  static const String routeName = "/ServiceDetailsStep1Screen";

  const ServiceDetailsStep1Screen({Key? key}) : super(key: key);

  @override
  _ServiceDetailsStep1ScreenState createState() =>
      _ServiceDetailsStep1ScreenState();
}

class _ServiceDetailsStep1ScreenState
    extends StateMVC<ServiceDetailsStep1Screen> {
  _ServiceDetailsStep1ScreenState() : super(ServiceDetailsController()) {
    con = ServiceDetailsController();
  }

  late ServiceDetailsController con;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            bottomNavigationBar:  ButtonActionWidget(onNext: (){print('next');}, totalPrice: 'AED 97.00',),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70.h,
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
                      isSelected: false,
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
                          'How many hours do you need your professional to stay ?',
                      isTime: false,
                      isSelected: true,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    QuestionsWidgets(
                      onTap: (index) {
                        print(index + 2);
                        setState(() {});
                      },
                      title: 'When would you like your service ?',
                      isTime: true,
                      isSelected: true,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    QuestionCardTitleWidget(),
                  ]),
            )));
  }
}
