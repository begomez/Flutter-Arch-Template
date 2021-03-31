import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

class SplashScren extends BaseStatelessScreen {
  const SplashScren({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildBody(BuildContext context) {
    this._navigateDelayed(context);

    return Center(child: Container());
  }

  void _navigateDelayed(BuildContext cntxt) async {
    final int DELAY_IN_SECS = 2;

    await Future.delayed(Duration(seconds: DELAY_IN_SECS))
        .then((value) async => await AppNavigator.toLogin(cntxt));
  }
}
