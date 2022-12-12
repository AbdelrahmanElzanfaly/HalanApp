import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Theme/theme.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Shared/shared_preferances.dart';
import '../../Utilities/connection_status.dart';
import '../../Utilities/toast_helper.dart';
import '../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import '../ChangeLanguage/choose_language_screen.dart';
import '../IntroductionPages/introduction_controller.dart';
import '../IntroductionPages/introduction_screen.dart';
import '../UserAuth/Login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // _SplashScreenState() : super(IntroductionController()) {
  //   con = IntroductionController();
  // }
  //
  // late IntroductionController con;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    log('_SplashScreenState');
    ToastHelper.init(context);
    ConnectivityHelper().initialize();
    init();

    super.initState();
  }

  Future init() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    if (!SharedPref.isWatchIntro()) {
      Navigator.of(context).pushNamed(ChooseLanguageScreen.routeName);
    } else if (SharedPref.isUserLogIn()) {
      Navigator.of(context)
          .pushReplacementNamed(BottomNavigationBarScreen.routeName);
    } else {
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ThemeClass.primaryColor,
      body: Center(
        child: Row(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/logo.png",
              width: 250.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 23.w,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

