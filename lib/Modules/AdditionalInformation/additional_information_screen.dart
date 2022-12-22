import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/service_details_controller.dart';
import 'package:halan/Widgets/custom_button.dart';
import 'package:halan/Widgets/service_steps_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../Theme/theme.dart';
import '../../Widgets/address_details_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';
import '../WaitingForConfirmationScreen/waiting_for_confirmation_screen.dart';
import '../../modules/SingleReservation/Widgets/button_action_widget.dart';
import 'additional_information_controller.dart';

class AdditionalInformationScreen extends StatefulWidget {
  static const String routeName = "/AdditionalInformationScreen";
  final String? appBarTitle;

  const AdditionalInformationScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  _AdditionalInformationScreenState createState() =>
      _AdditionalInformationScreenState();
}

class _AdditionalInformationScreenState
    extends StateMVC<AdditionalInformationScreen> {
  _AdditionalInformationScreenState()
      : super(AdditionalInformationController()) {
    con = AdditionalInformationController();
  }

  late AdditionalInformationController con;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            bottomNavigationBar: ButtonActionWidget(
              onNeedHelp: () {},
              onCheckout: () {
                Navigator.pushNamed(
                    context, WaitingForConfirmationScreen.routeName);
              },
              totalPrice: 'AED 97.00',
            ),
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                                  title: widget.appBarTitle ?? '',
                                )),
                            SizedBox(
                              height: 23.h,
                            ),
                            const ServiceStepsWidget(
                              title: 'Additional Information',
                              step: 3,
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
                                  'Pick Address',
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
                            ...[1, 2].map(
                              (e) => InkWell(
                                onTap: () {
                                  i = e;
                                  setState(() {});
                                },
                                child: AddressDetailsWidget(
                                  onEdit: () {},
                                  onDelete: () {},
                                  isSelected: i == e,
                                  title: "Home Address",
                                  fullAddress:
                                      '7th Street Zakaria Moustafa, Bolak Eldakrour, Giza.Appartment No. 15, 5th Floor.',
                                  specialMark: ' Next to Abdelnaser Mosque.',
                                  location:
                                      'https://goo.gl/maps/1XgFKbDdFJx5MyQV9',
                                ),
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
                                  'Or add another address',
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
                            Container(
                              width: 327.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeClass.containerBackground,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  const Icon(Icons.add),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text('Add Address.'),
                                  const Spacer()
                                ],
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
                                  'Add Promo Code',
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
                              child: Row(
                                children: [
                                  CustomTextFieldWidget(
                                    height: 40.h,
                                    width: 213.w,
                                    borderRadiusValue: 10,
                                    textInputType: TextInputType.emailAddress,
                                    borderColor: Colors.grey.shade400,
                                    // controller: con.addressNameController,
                                    hint: "Example : NY2023",
                                    validator: (String? v) {
                                      if (v == null || v.isEmpty) return "";
                                      return null;
                                    },
                                  ),
                                  const Spacer(),
                                  CustomButton(
                                    ontap: () {},
                                    width: 105.w,
                                    height: 40.h,
                                    name: 'Apply',
                                    borderRadius: 10,
                                  )
                                ],
                              ),
                            ),
                          ])),
                ))));
  }
}
