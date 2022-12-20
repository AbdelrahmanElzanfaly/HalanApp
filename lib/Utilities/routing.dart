import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/Register/register_screen.dart';

import '../Modules/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';

import '../Modules/HomeScreen/home_screen.dart';

import '../Modules/Splash/splash_screen.dart';

import '../Modules/UserAuth/Login/login_screen.dart';
import '../Modules/WaitingForConfirmationScreen/waiting_for_confirmation_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(SplashScreen.routeName,
        child: (_, args) => const SplashScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(HomeScreen.routeName,
        child: (_, args) => const HomeScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(LoginScreen.routeName,
        child: (_, args) => const LoginScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(RegisterScreen.routeName,
        child: (_, args) => RegisterScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(LoginScreen.routeName,
        child: (_, args) => const LoginScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(BottomNavigationBarScreen.routeName,
        child: (_, args) => const BottomNavigationBarScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),



  ];

  static ChildRoute defaultRoute(
      {required String routeName, required Widget child}) {
    return ChildRoute(routeName,
        child: (_, args) => child,
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300));
  }
}
