import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';

abstract class AppNavigator {
  static Future<void> closeAll(BuildContext cntxt) async {
    return Navigator.of(cntxt)
        .popUntil((route) => route.settings.name == Routes.login);
  }

  static Future<void> toLogin(BuildContext cntxt) async {
    return Navigator.of(cntxt).pushReplacementNamed(Routes.login);
  }

  static Future<void> toHome(BuildContext cntxt) async {
    return Navigator.of(cntxt).pushReplacementNamed(Routes.home);
  }
}
