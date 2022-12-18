import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/ReferToFriend/refer_and_earn_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../Theme/theme.dart';
import '../../Utilities/Layout/loading_screen.dart';
import '../../Widgets/app_bar_widget.dart';
import '../../Widgets/custom_button.dart';

class ReferAndEarnScreen extends StatefulWidget {
  static const String routeName = "/ReferAndEarnScreen";

  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  _ReferAndEarnScreenState createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends StateMVC<ReferAndEarnScreen> {
  _ReferAndEarnScreenState() : super(ReferAndEarnController()) {
    con = ReferAndEarnController();
  }

  late ReferAndEarnController con;

  @override
  void initState() {
    super.initState();
    // con.getMyReferAndEarn();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                const AppBarWidget(
                  title: 'Refer To A Friend',
                ),
                SizedBox(
                  height: 27.h,
                ),
                Image.asset(
                  "assets/images/Group 513888.png",
                  width: 203.w,
                  height: 176.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: 327,
                  child: FadeIn(
                    delay: 1,
                    from: SlideFrom.TOP,
                    child: Center(
                      child: Text(
                        'Refer & Earn',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemeClass.primaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 327,
                  child: FadeIn(
                    delay: 1,
                    from: SlideFrom.TOP,
                    child: Center(
                      child: Text(
                        'Share the code below or ask your friends to inter it while they register to get free points.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.hintColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                DottedBorder(
                  color: ThemeClass.primaryColor,
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  child: Container(
                    color: ThemeClass.primaryColor2,
                    height: 40.h,
                    width: 300.w,
                    child: Row(
                      children: [
                        SizedBox(width: 10.w,),
                        Text(
                          "Y6UGXY60",
                          // con.referAndEarnModel?.myReferCode ?? '',
                          // con.referAndEarnModel.referCode ??

                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            Clipboard.setData(
                              const ClipboardData(
                                text:
                                    // con.referAndEarnModel ??
                                    // con.referAndEarnModel?.myReferCode ??
                                    '',
                              ),
                            ).then(
                              (_) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: ThemeClass.primaryColor,
                                  elevation: 100,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    side: BorderSide(
                                        color: Colors.black, width: 3.w),
                                  ),
                                  content: const Text(
                                    "copied",
                                    textAlign: TextAlign.center,
                                  ),
                                  duration:
                                      (const Duration(milliseconds: 700)),
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.copy,
                            size: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Copy Code",
                          // con.referAndEarnModel?.myReferCode ?? '',
                          // con.referAndEarnModel.referCode ??

                          style: TextStyle(
                              fontSize: 10.sp,
                              color: ThemeClass.hintColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10.w,),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 38.h,
                ),
                CustomButton(
                  width: 250.w,
                  height: 50.h,
                  name: "Share Code",
                  ontap: () async {
                    await Share.share('use this code to earn 100 SAR:\n${''}');
                  },
                ),
                SizedBox(
                  height: 55.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 115.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: ThemeClass.hint,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              'Your Earnings',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ThemeClass.hintColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ThemeClass.hintColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                          ],
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                        height: 115.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: ThemeClass.hint,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              'Pending',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ThemeClass.hintColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ThemeClass.hintColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: 38.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
