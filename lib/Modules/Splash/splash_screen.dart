
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Shared/shared_preferances.dart';
import '../../Utilities/Layout/background_canvas.dart';
import '../HomeScreen/home_screen.dart';
import '../Main_Screen/main_screen.dart';
import '../UserAuth/Login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await Future.delayed(const Duration(seconds: 2));
if (SharedPref.isUserLogIn()) {
      Modular.to.pushNamed(HomeScreen.routeName);
    } else {
      Modular.to.pushNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      key: _scaffoldKey,
      body: CanvasBackground(
        child:
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 130.w,
                height: 74.57.h,
                // fit: BoxFit.fitHeight,

        ),
            ),
      ),
    );
  }
}
