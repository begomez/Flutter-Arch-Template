import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';

abstract class AppNavigator {
  static Future<void> toLogin(BuildContext cntxt) {
    return Navigator.of(cntxt).pushReplacementNamed(Routes.login);
  }

  static Future<void> toHome(BuildContext cntxt) {
    return Navigator.of(cntxt).pushReplacementNamed(Routes.home);
  }
}
