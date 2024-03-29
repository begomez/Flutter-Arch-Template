import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/screens/HomeScreen.dart';
import 'package:flutter_template/presentation/screens/LoginScreen.dart';
import 'package:flutter_template/presentation/screens/SplashScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';

/*
 * Widget containing main app
 */
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        title: "MainApp",
        theme: AppStyles.appTheme,
        home: SplashScreen(
          title: "",
        ),
        supportedLocales:
            LangCodes.values.map((LangCodes e) => Locale(e.toCode())).toList(),
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: {
          Routes.splash: (cntxt) => SplashScreen(title: ""),
          Routes.login: (cntxt) => LoginScreen(title: ""),
          Routes.home: (cntxt) => HomeScreen(title: "")
        });
  }
}
