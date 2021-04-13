import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';

/**
 * Initial/launch screen
 */
class SplashScren extends BaseStatelessScreen {
  const SplashScren({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContent(BuildContext context) {
    this._navigateDelayed(context);

    return Center(
        child: Container(
      child: Image.asset("assets/images/splash.png"),
    ));
  }

  void _navigateDelayed(BuildContext cntxt) async {
    final int DELAY_IN_SECS = 2;

    await Future.delayed(Duration(seconds: DELAY_IN_SECS))
        .then((value) async => await AppNavigator.toLogin(cntxt));
  }
}
