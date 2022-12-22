import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/ContractReservation/service_provider_profile_screen.dart';
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
import '../../Widgets/made_widget.dart';
import '../../modules/SingleReservation/Widgets/button_action_widget.dart';
import '../AdditionalInformation/additional_information_screen.dart';
import 'contract_reservation_controller.dart';

class ContractReservationScreen extends StatefulWidget {
  static const String routeName = "/ContractReservationScreen";

  const ContractReservationScreen({Key? key}) : super(key: key);

  @override
  _ContractReservationScreenState createState() =>
      _ContractReservationScreenState();
}

class _ContractReservationScreenState
    extends StateMVC<ContractReservationScreen> {
  _ContractReservationScreenState() : super(ContractReservationController()) {
    con = ContractReservationController();
  }

  late ContractReservationController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            bottomNavigationBar: ButtonActionWidget(
              onNext: () {
                Navigator.pushNamed(
                    context, AdditionalInformationScreen.routeName,
                    arguments: 'Contract Reservation'.tr);
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
                            title: 'Contract Reservation'.tr,
                          )),
                      SizedBox(
                        height: 23.h,
                      ),
                      ServiceStepsWidget(
                        title: 'Service Details'.tr,
                        step: 1.5,
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
                        height: 150.h,
                        child: ListView.builder(
                          itemCount: 12,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  con.indexMade = index;
                                  setState(() {});
                                },
                                child: MadeWidget(
                                  onSeeDetails: () => Navigator.pushNamed(
                                      context,
                                      ServiceProviderProfileScreen.routeName),
                                  isSelected: con.indexMade == index,
                                  image:
                                      'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
                                ));
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
