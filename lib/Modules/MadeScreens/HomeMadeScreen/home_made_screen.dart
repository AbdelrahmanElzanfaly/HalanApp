import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Control/shared_data_provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:halan/Modules/ChangeLanguage/choose_language_screen.dart';
import 'package:halan/Modules/UserAuth/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../Control/app_languages.dart';
import '../../../Theme/theme.dart';
import '../../../Widgets/custom_alert_dialog.dart';
import '../../../Widgets/language_dialog_widget.dart';
import '../../../Widgets/setting_items_widget.dart';
import '../EditMadeScreen/edit_made_screen.dart';
import 'home_made_controller.dart';



class HomeMadeScreen extends StatefulWidget {
  static const String routeName = "/HomeMadeScreen";

  const HomeMadeScreen({Key? key}) : super(key: key);

  @override
  _HomeMadeScreenState createState() => _HomeMadeScreenState();
}

class _HomeMadeScreenState extends StateMVC<HomeMadeScreen> {
  _HomeMadeScreenState() : super(HomeMadeController()) {
    con = HomeMadeController();
  }

  late HomeMadeController con;

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    final provider = Provider.of<SharedDataProvider>(context);

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 70.h,
                ),



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



                SizedBox(
                  height: 35.h,
                ),
                Container(
                  width: 327.w,
                  height: 162.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                      color: ThemeClass.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.RIGHT,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                height: 82.w,
                                width: 61.w,
                                fit: BoxFit.fill,
                                imageUrl:
                                "https://cdn2.hubspot.net/hubfs/53/parts-url.jpg",
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          FadeIn(
                              delay: 1,
                              from: SlideFrom.RIGHT,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: ThemeClass.textColor),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'John.doe@gmail.com',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w300,
                                        color: ThemeClass.hintColor),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  FadeIn(
                                    delay: 1,
                                    from: SlideFrom.BOTTOM,
                                    child: Container(
                                      width: 100.w,
                                      height: 23.h,
                                      decoration: BoxDecoration(
                                          color: ThemeClass.containerWBackground,
                                          borderRadius: BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Verified'.tr,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: ThemeClass.secondPrimaryColor),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FadeIn(
                        delay: 1,
                        from: SlideFrom.BOTTOM,
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, EditMadeScreen.routeName),
                          child: Container(
                            width: 296.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: ThemeClass.primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: Text(
                              'Edit Profile'.tr,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeClass.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                SettingItems(
                  name: 'Change Password'.tr,
                  image: 'assets/images/lock-pen.png',
                  onTap: () =>
                      Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                ),
                Divider(
                  indent: 17.w,
                  endIndent: 17.w,
                  thickness: 1,
                  height: 10.h,
                  color: ThemeClass.hint,
                ),
                SettingItems(
                  name: 'Change Language'.tr,
                  image: 'assets/images/globe.png',
                  onTap: () {
                    CustomDialog(
                        context: context,
                        buttonName: "Selection",
                        onContinuePressed: () async {
                          appLan.changeLanguage(
                              Locale(provider.choiceLanguage ?? 'ar'));
                          Navigator.of(context).pop();
                        },
                        des: StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return const LanguageDialogWidget();
                            }),
                        title: 'اختار لغه');
                  },
                ),
                Divider(
                  indent: 17.w,
                  endIndent: 17.w,
                  thickness: 1,
                  height: 10.h,
                  color: ThemeClass.hint,
                ),
                SettingItems(
                  name: 'Support Center'.tr,
                  image: 'assets/images/help-circle.png',
                  onTap: () {},
                ),
                Divider(
                  indent: 17.w,
                  endIndent: 17.w,
                  thickness: 1,
                  height: 10.h,
                  color: ThemeClass.hint,
                ),
             const Spacer(),
                SettingItems(
                  name: 'Log Out'.tr,
                  image: 'assets/images/exit.png',
                  onTap: () {
                    Navigator.pushNamed(context, ChooseLanguageScreen.routeName);
                  },
                ),
                SizedBox(
                  height: 120.h,
                ),
              ]),
            )));
  }
}

