
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';
import '../HomeScreen/home_screen.dart';



class MainScreen extends StatefulWidget {
  static const String routeName = "/mainScreen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 75.0,
        items: navBtn.map((e) => Container(
                padding: EdgeInsets.all(18.w),
                child: Column(
                  children: [
                    Image.asset(
                      e.imagePath,
                      width: 20.w,
                      height: 20.h,
                      color: e.id == _page
                          ? ThemeClass.primaryColor
                          : ThemeClass.greyColor,
                    ),
                    e.id != _page ? Text(
                            e.name,
                            style: TextStyle(
                                fontSize: 10.sp, color: ThemeClass.blackColor),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
            .toList(),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: navBtn[_page].routeName,
    );
  }
}

class Model {
  final int id;
  final String imagePath;
  final String name;
  final Widget routeName;

  Model({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.routeName,
  });
}

List<Model> get navBtn => [
      Model(
          id: 0,
          imagePath: 'assets/images/logo.png',
          name: 'home',
          routeName: const HomeScreen()),
      Model(
          id: 1,
          imagePath: 'assets/images/logo.png',

          name: 'list',
          routeName: const HomeScreen()),
      Model(
        id: 2,
        imagePath: 'assets/images/logo.png',

        name: 'offer',
        routeName: const HomeScreen(),
      ),
      Model(
          id: 3,
          imagePath: 'assets/images/logo.png',

          name: 'account',
          routeName: const HomeScreen()),
      Model(
        id: 4,
        imagePath: 'assets/images/logo.png',

        name: 'cart',
        routeName: const HomeScreen(),
      ),
    ];
