import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Theme/theme.dart';
import '../../Widgets/custom_button.dart';
import 'introduction_controller.dart';

class IntroductionPagesScreen extends StatefulWidget {
  static String routeName = "/IntroductionPagesScreen";

  const IntroductionPagesScreen({Key? key}) : super(key: key);

  @override
  _IntroductionPagesScreenState createState() =>
      _IntroductionPagesScreenState();
}

class _IntroductionPagesScreenState extends StateMVC<IntroductionPagesScreen> {
  _IntroductionPagesScreenState() : super(IntroductionController()) {
    con = IntroductionController();
  }

  late IntroductionController con;
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Column(
          children: [
            SizedBox(
              height: 122.h,
            ),
            SizedBox(
              height: 500.h,
              child:  IntroductionScreen(
                  key: introKey,
                  globalBackgroundColor: Colors.white,
                  pages: con.introPages.map((page) {
                    return PageViewModel(
                      title: page.title,
                      body: page.description,
                      image:  FadeIn(
                      delay: 1,
                      from: SlideFrom.LEFT,
                        child:  Image.asset(
                        page.image,
                        width: 375.w,
                      ),),
                      decoration: PageDecoration(
                        titleTextStyle: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemeClass.primaryColor),
                        bodyTextStyle: TextStyle(
                            color: ThemeClass.hintColor, fontSize: 12.sp),
                        pageColor: Colors.white,
                        imagePadding: EdgeInsets.zero,
                      ),
                    );
                  }).toList(),
                  onDone: () {},
                  onSkip: () {},
                  onChange: (int index) {
                    setState(() {
                      con.lastScreen = index ;
                    });
                  },
                  skipOrBackFlex: 1,
                  nextFlex: 1,
                  showBackButton: false,
                  next: const Text(''),
                  done: const Text(''),
                  dotsDecorator: DotsDecorator(
                      size: Size.square(10.w),
                      activeSize: Size(10.w, 10.w),
                      activeColor: ThemeClass.primaryColor,
                      color: Colors.black12,
                      spacing: EdgeInsets.symmetric(horizontal: 3.w),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w))),
                  curve: Curves.fastLinearToSlowEaseIn,
                  baseBtnStyle: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  isBottomSafeArea: true,

              ),
            ),
            SizedBox(
              height: 62.h,
            ),
            CustomButton(
              width: 250.w,
              height: 50.h,
              name: 'Next'.tr,
              ontap: () {
                if (con.lastScreen ==0) {

                  introKey.currentState?.animateScroll(1);
                }
                else if(con.lastScreen ==1){
                  introKey.currentState?.animateScroll(2);

                }else if(con.lastScreen == 2) {
                  con.finishIntro(context);
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
