import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Control/shared_data_provider.dart';
import 'package:halan/Modules/SettingScreen/setting_controller.dart';
import 'package:halan/Modules/UserAuth/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:halan/Modules/UserAuth/Login/login_screen.dart';
import 'package:halan/Shared/shared_preferances.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import '../../Control/app_languages.dart';
import '../../Theme/theme.dart';
import '../../Widgets/custom_alert_dialog.dart';
import '../../Widgets/language_dialog_widget.dart';
import '../EditProfileScreen/edit_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../PromoCode/promo_code_screen.dart';
import '../ReferToFriend/refer_to_friend_screen.dart';
import '../SavedAddresses/saved_addresses_screen.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "/SettingScreen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends StateMVC<SettingScreen> {
  _SettingScreenState() : super(SettingController()) {
    con = SettingController();
  }

  late SettingController con;

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
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 70.h,
            ),
            FadeIn(
              delay: 1,
              from: SlideFrom.LEFT,
              child: Center(
                child: Text(
                  "Settings".tr,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.textColor),
                ),
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              width: 327.w,
              height: 165.h,
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
                          context, EditProfileScreen.routeName),
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
              height: 30.h,
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
              name: 'Payment'.tr,
              image: 'assets/images/card.png',
              onTap: () {},
            ),
            Divider(
              indent: 17.w,
              endIndent: 17.w,
              thickness: 1,
              height: 10.h,
              color: ThemeClass.hint,
            ),
            SettingItems(
              name: 'Promotions'.tr,
              image: 'assets/images/pricetag.png',
              onTap: () => Navigator.pushNamed(context, PromoCodeScreen.routeName),
            ),
            Divider(
              indent: 17.w,
              endIndent: 17.w,
              thickness: 1,
              height: 10.h,
              color: ThemeClass.hint,
            ),
            SettingItems(
              name: 'Refer to a friend'.tr,
              image: 'assets/images/person-add.png',
              onTap: () =>
                  Navigator.pushNamed(context, ReferAndEarnScreen.routeName),
            ),
            Divider(
              indent: 17.w,
              endIndent: 17.w,
              thickness: 1,
              height: 10.h,
              color: ThemeClass.hint,
            ),
            SettingItems(
              name: 'Saved Addresses'.tr,
              image: 'assets/images/location.png',
              onTap: () =>
                  Navigator.pushNamed(context, SavedAddressesScreen.routeName),
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
            SizedBox(
              height: 25.h,
            ),
            SettingItems(
              name: 'Log Out'.tr,
              image: 'assets/images/exit.png',
              onTap: () {
                SharedPref.logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                      (Route<dynamic> route) => false,
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ]),
        )));
  }
}

class SettingItems extends StatelessWidget {
  final String name, image;
  final Function() onTap;

  const SettingItems(
      {Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            SizedBox(
              width: 17.w,
            ),
            FadeIn(
              delay: 1,
              from: SlideFrom.LEFT,
              child: SizedBox(
                  width: 24.w, height: 24.h, child: Image.asset(image)),
            ),
            SizedBox(
              width: 17.w,
            ),
            FadeIn(
              delay: 1,
              from: SlideFrom.TOP,
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeClass.hintColor),
              ),
            ),
            const Spacer(),
            FadeIn(
              delay: 1,
              from: SlideFrom.RIGHT,
              child: Icon(
                Icons.arrow_forward_ios,
                color: ThemeClass.hintColor,
                size: 15.sp,
              ),
            ),
            SizedBox(
              width: 17.w,
            ),
          ],
        ),
      ),
    );
  }
}
