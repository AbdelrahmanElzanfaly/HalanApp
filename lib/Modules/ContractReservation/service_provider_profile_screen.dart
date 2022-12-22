import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:halan/Widgets/custom_button.dart';
import '../../Widgets/custom_textfeild_widget.dart';

class ServiceProviderProfileScreen extends StatelessWidget {
  static const String routeName = "/ServiceProviderProfileScreen";

  const ServiceProviderProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            color: ThemeClass.primaryColor,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: ThemeClass.hint,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 160,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              height: 1000.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ThemeClass.whiteColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  SizedBox(
                    width: 327,
                    child: FadeIn(
                      delay: 1,
                      from: SlideFrom.TOP,
                      child: Center(
                        child: Text(
                          'Jane Doe',
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: ThemeClass.blackColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: 327,
                    child: FadeIn(
                      delay: 1,
                      from: SlideFrom.TOP,
                      child: Center(
                        child: Text(
                          'Filipino, 5 years of experience.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeClass.hintColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 74.h,
                    width: 188.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeClass.hint),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Center(
                            child: Text(
                              'Contract Value',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeClass.hintColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        FadeIn(
                          delay: 1,
                          from: SlideFrom.TOP,
                          child: Center(
                            child: Text(
                              'AED 2000.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeClass.secondPrimaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  FadeIn(
                    delay: 1,
                    from: SlideFrom.TOP,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Provider Monthly Salary',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.hintColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FadeIn(
                    delay: 1,
                    from: SlideFrom.TOP,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'AED 2000.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemeClass.textColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  FadeIn(
                    delay: 1,
                    from: SlideFrom.TOP,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'More Info',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.hintColor),
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
                  CustomButton(
                    ontap: () {},
                    name: 'Pick For Contract',
                    borderRadius: 10,
                    width: 327.w,
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 100,
            child: FadeIn(
              delay: 2,
              from: SlideFrom.TOP,
              child: Center(
                child: Container(
                  height: 150.w,
                  width: 150.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ThemeClass.hintColor),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    height: 150.w,
                    width: 150.w,
                    fit: BoxFit.fill,
                    imageUrl: "https://cdn2.hubspot.net/hubfs/53/parts-url.jpg",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 19.w,
            top: 65.h,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_rounded,
                color: ThemeClass.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
