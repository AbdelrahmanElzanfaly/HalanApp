import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/Register/register_screen.dart';

import '../Modules/AdditionalInformation/additional_information_screen.dart';
import '../Modules/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import '../Modules/ChangeLanguage/choose_language_screen.dart';
import '../Modules/ContractReservation/contract_reservation_screen.dart';
import '../Modules/ContractReservation/service_provider_profile_screen.dart';
import '../Modules/EditProfileScreen/edit_profile_screen.dart';
import '../Modules/HomeScreen/home_screen.dart';
import '../Modules/IntroductionPages/introduction_screen.dart';
import '../Modules/MadeScreens/EditMadeScreen/edit_made_screen.dart';
import '../Modules/MadeScreens/HomeMadeScreen/home_made_screen.dart';
import '../Modules/Notifications/notifications_screen.dart';
import '../Modules/OrderDetails/order_details_screen.dart';
import '../Modules/PackageReservation/package_reservation_step1_screen.dart';
import '../Modules/PackageReservation/package_reservation_step2_screen.dart';
import '../Modules/PromoCode/promo_code_screen.dart';
import '../Modules/ReferToFriend/refer_to_friend_screen.dart';
import '../Modules/ReservationsScreen/reservations_screen.dart';
import '../Modules/SavedAddresses/saved_addresses_screen.dart';
import '../Modules/SettingScreen/setting_screen.dart';
import '../Modules/SingleReservation/service_details_step1.dart';
import '../Modules/SingleReservation/service_details_step2.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/UserAuth/AddressDetails/PickLocationScreen/pick_location_screen.dart';
import '../Modules/UserAuth/AddressDetails/address_details_screen.dart';
import '../Modules/UserAuth/CompleteProfile/complete_profile_screen.dart';
import '../Modules/UserAuth/ForgotPasswordScreen/forgot_password_screen.dart';
import '../Modules/UserAuth/Login/login_screen.dart';
import '../Modules/UserAuth/OTP/otp_screen.dart';
import '../Modules/UserAuth/ResetPasswordScreen/reset_password_screen.dart';
import '../Modules/UserAuth/UserType/user_type.dart';
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
        child: (_, args) => RegisterScreen(type: args.data),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(OtpScreen.routeName,
        child: (_, args) => OtpScreen(onConfirm: args.data),
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
    ChildRoute(AdditionalInformationScreen.routeName,
        child: (_, args) => AdditionalInformationScreen(appBarTitle: args.data,),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(WaitingForConfirmationScreen.routeName,
        child: (_, args) => const WaitingForConfirmationScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(PackageReservationStep1Screen.routeName,
        child: (_, args) => const PackageReservationStep1Screen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(PackageReservationStep2Screen.routeName,
        child: (_, args) => const PackageReservationStep2Screen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ContractReservationScreen.routeName,
        child: (_, args) => const ContractReservationScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ServiceProviderProfileScreen.routeName,
        child: (_, args) => const ServiceProviderProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(SavedAddressesScreen.routeName,
        child: (_, args) => const SavedAddressesScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ReferAndEarnScreen.routeName,
        child: (_, args) => const ReferAndEarnScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(NotificationsScreen.routeName,
        child: (_, args) => const NotificationsScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(PromoCodeScreen.routeName,
        child: (_, args) => const PromoCodeScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(HomeMadeScreen.routeName,
        child: (_, args) => const HomeMadeScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(EditMadeScreen.routeName,
        child: (_, args) => const EditMadeScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(OrderDetailsScreen.routeName,
        child: (_, args) => const OrderDetailsScreen(),
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
