import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';

import './Shared/shared_obj.dart';
import './locale/locales.dart';
import 'Control/app_languages.dart';
import 'Control/shared_data_provider.dart';
import 'Modules/HomeScreen/home_screen.dart';
import 'Modules/Splash/splash_screen.dart';
import 'Modules/UserAuth/AddressDetails/address_details_screen.dart';
import 'Modules/UserAuth/CompleteProfile/complete_profile_screen.dart';
import 'Modules/UserAuth/OTP/otp_screen.dart';
import 'Modules/UserAuth/UserType/user_type.dart';
import 'Theme/theme.dart';
import 'Utilities/firebase_operation.dart';
import 'Utilities/helper.dart';
import 'Utilities/routing.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedObj().init();
  await FireBaseOperations.init();

  startFlexibleUpdate();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
      ChangeNotifierProvider<SharedDataProvider>(
          create: (_) => SharedDataProvider()),
    ],
    child: ModularApp(
      module: AppModule(),
      child: const EntryPoint(),
    ),
  ));
}


class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    appLan.fetchLocale();
    return ScreenUtilInit(
      designSize: const Size(375, 834),
      builder: (BuildContext c, w) => MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: ThemeClass.primaryColor),
          primaryColor: ThemeClass.primaryColor,
          fontFamily: 'Inter',
        ),
        navigatorKey: SharedObj.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Mwardi',
        initialRoute: SplashScreen.routeName,
        locale: appLan.appLocal,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
      ).modular(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
Future<void> startFlexibleUpdate() async {
  if(!Platform.isAndroid) return;
  try{
    final checker = await InAppUpdate.checkForUpdate();
    if(checker.updateAvailability > 0){
      await InAppUpdate.startFlexibleUpdate();
      await InAppUpdate.completeFlexibleUpdate();
    }
  }catch(e){}
}
