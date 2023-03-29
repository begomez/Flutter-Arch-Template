import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';

/*
 * Class that centralizes route creation and page navigation
 */
abstract class AppNavigator {
  static void closeAll(BuildContext cntxt) {
    return Navigator.of(cntxt)
        .popUntil((route) => route.settings.name == Routes.login);
  }

  static Future<void> toLogin(BuildContext cntxt) async {
    await Navigator.of(cntxt).pushReplacementNamed(Routes.login);
  }

  static Future<void> toHome(BuildContext cntxt) async {
    await Navigator.of(cntxt).pushReplacementNamed(Routes.home);
  }
}
