import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/Register/register_screen.dart';

import '../Modules/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import '../Modules/ChangeLanguage/choose_language_screen.dart';
import '../Modules/EditProfileScreen/edit_profile_screen.dart';
import '../Modules/HomeScreen/home_screen.dart';
import '../Modules/IntroductionPages/introduction_screen.dart';
import '../Modules/ReservationsScreen/reservations_screen.dart';
import '../Modules/SettingScreen/setting_screen.dart';
import '../Modules/SingleReservation/ServiceDetails/service_details_step1.dart';
import '../Modules/SingleReservation/ServiceDetails/service_details_step2.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/UserAuth/AddressDetails/PickLocationScreen/pick_location_screen.dart';
import '../Modules/UserAuth/AddressDetails/address_details_screen.dart';
import '../Modules/UserAuth/CompleteProfile/complete_profile_screen.dart';
import '../Modules/UserAuth/ForgotPasswordScreen/forgot_password_screen.dart';
import '../Modules/UserAuth/Login/login_screen.dart';
import '../Modules/UserAuth/OTP/otp_screen.dart';
import '../Modules/UserAuth/ResetPasswordScreen/reset_password_screen.dart';
import '../Modules/UserAuth/UserType/user_type.dart';

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
        child: (_, args) => RegisterScreen(type: args.data),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(OtpScreen.routeName,
        child: (_, args) =>
            OtpScreen(onConfirm: args.data[0], phoneNumber: args.data[1]),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(LoginScreen.routeName,
        child: (_, args) => const LoginScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(IntroductionPagesScreen.routeName,
        child: (_, args) => const IntroductionPagesScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(BottomNavigationBarScreen.routeName,
        child: (_, args) => const BottomNavigationBarScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(UserType.routeName,
        child: (_, args) => const UserType(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ChooseLanguageScreen.routeName,
        child: (_, args) => ChooseLanguageScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(AddressDetailsScreen.routeName,
        child: (_, args) => AddressDetailsScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(PickLocationScreen.routeName,
        child: (_, args) => const PickLocationScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(CompleteProfileScreen.routeName,
        child: (_, args) => const CompleteProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ReservationsScreen.routeName,
        child: (_, args) => const ReservationsScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(SettingScreen.routeName,
        child: (_, args) => const SettingScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ForgotPasswordScreen.routeName,
        child: (_, args) => const ForgotPasswordScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(EditProfileScreen.routeName,
        child: (_, args) => const EditProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ResetPasswordScreen.routeName,
        child: (_, args) => ResetPasswordScreen(
            forgetPassword: args.data[0], email: args.data[1]),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ServiceDetailsStep2Screen.routeName,
        child: (_, args) => ServiceDetailsStep2Screen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ServiceDetailsStep1Screen.routeName,
        child: (_, args) => ServiceDetailsStep1Screen(),
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
