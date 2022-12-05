import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './Shared/shared_obj.dart';
import './locale/locales.dart';
import 'Control/app_languages.dart';
import 'Control/shared_data_provider.dart';
import 'Modules/Splash/splash_screen.dart';
import 'Utilities/Routing.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await SharedObj().init();
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
      designSize: const Size(425, 1000),
      builder: (_, __) => MaterialApp(
        theme: ThemeData(fontFamily: 'dubai'),
        navigatorKey: SharedObj.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: appLan.appLanguage == Languages.ar
            ? 'الصاله الاقتصادية'
            : "alsala aliqtisadya",
        initialRoute: SplashScreen.routeName,
        // locale: appLan.appLocal,
        locale: appLan.appLocal,
        supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
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
