import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/custom_button.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../IntroductionPages/introduction_controller.dart';

class ChooseLanguageScreen extends StatefulWidget {
  static String routeName = "/chooseLanguageScreen";
  String? from;

  ChooseLanguageScreen({Key? key, this.from}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends StateMVC<ChooseLanguageScreen> {
  _ChooseLanguageScreenState() : super(IntroductionController()) {
    con = IntroductionController();
  }

  late IntroductionController con;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 115.h,
            ),
            Image.asset(
              "assets/images/language.png",
              width: 80.w,
              height: 80.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 44.h,
            ),
            Text(
              'Choose_your_Language'.tr,
              style: TextStyle(
                  color: ThemeClass.textColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 70.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: IntroductionController.supportedLanguage.map((e) {
                return InkWell(
                  onTap: () => setState(() {
                    con.selectedLanguage = e;
                  }),
                  child: Container(
                    height: 110.w,
                    width: 110.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.w),
                      color: Colors.white,
                      border: Border.all(
                          color: con.selectedLanguage != e
                              ? Colors.grey.shade400
                              : ThemeClass.primaryColor,
                          width: 1.w),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.w),
                          child: Image.asset(
                            "assets/images/${e == "ar" ? "arabic_flag.jpg" : "english_flag.jpg"}",
                            width: 30.w,
                            height: 30.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          e == "ar" ? "العربية" : "English",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            CustomButton(
              height: 50,
              width: 250.w,
              ontap: () async => await con.selectLanguage(context),
              name: "continue".tr,
            ),
            const Spacer(),

          ],
        ),
        // bottomNavigationBar: SharedPref.isUserLogIn() ?CustomNavigatorBar(currentIndex: context.watch<SharedDataProvider>().curruntNavIndex,):null,
      ),
    );
  }
}
