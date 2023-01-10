import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/Layout/loading_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

import '../../../Control/shared_data_provider.dart';
import '../../../Theme/theme.dart';
import '../../../Utilities/toast_helper.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import 'address_details_controller.dart';

class AddressDetailsScreen extends StatefulWidget {
  static const String routeName = "/AddressDetailsScreen";

  const AddressDetailsScreen({Key? key}) : super(key: key);

  @override
  _AddressDetailsScreenState createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends StateMVC<AddressDetailsScreen> {
  _AddressDetailsScreenState() : super(AddressDetailsController()) {
    con = AddressDetailsController();
  }

  late AddressDetailsController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SharedDataProvider>(context, listen: false);

    return LoadingScreen(
      loading: con.loading,
      child: WillPopScope(
        onWillPop: () async => false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: con.autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          const FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: AppBarWidget(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: Text(
                              "Address Details".tr,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ThemeClass.textColor),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: CustomTextFieldWidget(
                              suffixIcon: const SizedBox(),
                              textInputType: TextInputType.text,
                              borderColor: Colors.grey.shade400,
                              controller: con.addressNameController,
                              hint: "Address Name".tr,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: CustomTextFieldWidget(
                              suffixIcon: const SizedBox(),
                              isDense: true,
                              textInputType: TextInputType.text,
                              borderColor: Colors.grey.shade400,
                              controller: con.streetController,
                              hint: "Street Address".tr,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              FadeIn(
                                delay: 1,
                                from: SlideFrom.LEFT,
                                child: CustomTextFieldWidget(
                                  width: 156.w,
                                  suffixIcon: const SizedBox(),
                                  isDense: true,
                                  textInputType: TextInputType.text,
                                  borderColor: Colors.grey.shade400,
                                  controller: con.cityController,
                                  hint: "city".tr,
                                  validator: (String? v) {
                                    if (v == null || v.isEmpty) return "";
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              FadeIn(
                                delay: 1,
                                from: SlideFrom.LEFT,
                                child: CustomTextFieldWidget(
                                  width: 156.w,
                                  suffixIcon: const SizedBox(),
                                  isDense: true,
                                  textInputType: TextInputType.text,
                                  borderColor: Colors.grey.shade400,
                                  controller: con.stateProvinceController,
                                  hint: "State/Province".tr,
                                  validator: (String? v) {
                                    if (v == null || v.isEmpty) return "";
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: InkWell(
                              onTap: () {
                                con.getCountry(context);
                              },
                              child: Container(
                                width: 350.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: 1.w),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    con.countryName == null
                                        ? Text(
                                            "Country".tr,
                                            style: TextStyle(
                                                color: ThemeClass.hintColor),
                                          )
                                        : Text(
                                            con.countryName ?? '',
                                            style: TextStyle(
                                                color: ThemeClass.blackColor),
                                          ),
                                    const Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: ThemeClass.blackColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: CustomTextFieldWidget(
                              suffixIcon: const SizedBox(),
                              isDense: true,
                              textInputType: TextInputType.text,
                              borderColor: Colors.grey.shade400,
                              controller: con.zipCodeController,
                              hint: "Postal/Zip code".tr,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: Consumer<SharedDataProvider>(
                                builder: (__, provider, _) {
                              return InkWell(
                                onTap: () {
                                  con.getLocationName(context);
                                  provider.setPlacesDetailsResponse(null);
                                },
                                child: Container(
                                  width: 350.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 1.w),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      provider.placesDetailsResponse?.result
                                                  .addressComponents ==
                                              null
                                          ? Text(
                                              "Pick Location".tr,
                                              style: TextStyle(
                                                  color: ThemeClass.hintColor),
                                            )
                                          : SizedBox(
                                              width: 280.w,
                                              child: Text(
                                                provider
                                                        .placesDetailsResponse
                                                        ?.result
                                                        .formattedAddress
                                                        .toString() ??
                                                    '',
                                                style: TextStyle(
                                                    color:
                                                        ThemeClass.blackColor),
                                              ),
                                            ),
                                      const Spacer(),
                                      Icon(
                                        Icons.my_location,
                                        color: ThemeClass.blackColor,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: CustomTextFieldWidget(
                              suffixIcon: const SizedBox(),
                              isDense: true,
                              borderColor: Colors.grey.shade400,
                              textInputType: TextInputType.text,
                              controller: con.specialMarkController,
                              hint: "Special_Mark".tr,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) return "";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomButton(
                            width: 250.w,
                            height: 50.h,
                            name: "Save & Continue".tr,
                            ontap: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                if (con.countryName == null) {
                                  ToastHelper.showError(
                                      message: 'Please add country');
                                } else {
                                  await con.onSave(context);
                                }
                              } else {
                                setState(() {
                                  con.autoValidate = true;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
