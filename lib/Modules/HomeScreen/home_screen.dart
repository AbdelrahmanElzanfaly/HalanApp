
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.green,
    );
  }

}