import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:halan/Modules/UserAuth/Login/login_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Control/shared_data_provider.dart';
import '../../Theme/theme.dart';
import '../../Utilities/Layout/connectivity_checker.dart';
import '../../Utilities/toast_helper.dart';
import '../../modules/HomeScreen/home_screen.dart';

import 'bottomn_navigation_bar_controller.dart';

class BottomNavigationBarScreen extends StatefulWidget
    with WidgetsBindingObserver {
  static String routeName = "/BottomNavigationBar";

  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends StateMVC<BottomNavigationBarScreen>
    with SingleTickerProviderStateMixin {
  _BottomNavigationBarScreenState() : super(BottomNavigationBarController()) {
    con = BottomNavigationBarController();
  }

  late BottomNavigationBarController con;

  TabController? _tabController;
  bool? allowClose = false;

  @override
  void didChangeDependencies() {
    ToastHelper.init(context);

    super.didChangeDependencies();
  }

  @override
  void initState() {
    allowClose == false;
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
        condition: allowClose!,
        onConditionFail: () {
          setState(() {
            allowClose = true;
          });
        },
        // message: "Press back again to exit",

        child: Scaffold(
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: MotionTabBar(
              initialSelectedTab: "Home".tr,
              useSafeArea: true,
              // default: true, apply safe area wrapper
              labels: ["Home".tr, "Reservations".tr, "Settings".tr],
              icons: const [
                Icons.home,
                Icons.date_range_outlined,
                Icons.settings
              ],
              tabSize: 46.sp,
              tabBarHeight: 55.h,

              textStyle: TextStyle(
                fontSize: 12.sp,
                color: ThemeClass.secondPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
              tabIconColor: ThemeClass.secondPrimaryColor,
              tabIconSize: 28.sp,
              tabIconSelectedSize: 22.sp,
              tabSelectedColor: ThemeClass.secondPrimaryColor,
              tabIconSelectedColor: Colors.white,
              tabBarColor: ThemeClass.whiteColor,

              onTabItemSelected: (int value) {
                setState(() {
                  _tabController!.index = value;
                });
              },
            ),
          ),
          // SharedPref.getCurrentLang() == "en"
          body: ConnectivityChecker(
            onLoading: () {},
            child: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              // swipe navigation handling is not supported
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const HomeScreen(),
                const HomeScreen(),
                const HomeScreen(),
              ],
            ),
          ),
        ));
  }
}
