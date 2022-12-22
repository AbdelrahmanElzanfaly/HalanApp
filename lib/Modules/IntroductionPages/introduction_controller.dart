import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halan/Modules/UserAuth/UserType/user_type.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../Control/app_languages.dart';
import '../../Models/introPageModel.dart';
import '../../Shared/shared_preferances.dart';
import '../UserAuth/Login/login_screen.dart';
import 'introduction_screen.dart';

class IntroductionController extends ControllerMVC {
  // singleton
  factory IntroductionController() {
    _this ??= IntroductionController._();
    return _this!;
  }

  static IntroductionController? _this;

  IntroductionController._();

  bool loading = false;
  int lastScreen = 0;
  static List<String> supportedLanguage = ["en", "ar"];
  String selectedLanguage = supportedLanguage[0];


  List<PageModel> get introPages => [
        PageModel(
          title: "intro_title_1".tr,
          description: "intro_desc_1".tr,
          image: "assets/images/Group 513770.png",
        ),
        PageModel(
          title: "intro_title_2".tr,
          description: "intro_desc_2".tr,
          image: "assets/images/Group 513771.png",
        ),
        PageModel(
          title: "intro_title_3".tr,
          description: "intro_desc_3".tr,
          image: "assets/images/Group 513772.png",
        )
      ];


  Future selectLanguage(BuildContext context) async {
    final appLan = Provider.of<AppLanguage>(context, listen: false);
    await appLan.changeLanguage(Locale(selectedLanguage));
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
    await SharedPref.saveWatchIntro();
    if (SharedPref.isUserLogIn()) {
      Navigator.of(context).pushNamed(UserType.routeName);
    } else {
      Navigator.of(context).pushNamed(IntroductionPagesScreen.routeName);
    }
  }

  Future finishIntro(BuildContext context) async {
    await SharedPref.saveWatchIntro();
    Navigator.of(context).pushNamed(UserType.routeName);
  }
}
