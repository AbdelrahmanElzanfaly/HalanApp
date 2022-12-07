import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:halan/Modules/UserAuth/Login/login_screen.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

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
    final provider = Provider.of<SharedDataProvider>(context, listen: false);

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
              labels: ["Home".tr, "requests".tr, "attendance".tr],
              icons: const [
                Icons.home,
                Icons.ios_share,
                Icons.event_note_sharp
              ],
              tabSize: 46,
              tabBarHeight: 55,
              textStyle: TextStyle(
                fontSize: 12,
                color: ThemeClass.primaryColor,
                fontWeight: FontWeight.w500,
              ),
              tabIconColor: ThemeClass.hintColor,
              tabIconSize: 28.0,
              tabIconSelectedSize: 22.0,
              tabSelectedColor: ThemeClass.primaryColor,
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
            onLoading: () {
            },
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              // swipe navigation handling is not supported
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const HomeScreen(),
                const LoginScreen(),
                const HomeScreen(),

              ],
            ),
          ),
        ));
  }
}
