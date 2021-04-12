import 'package:flutter/material.dart';

import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/LoginButtonWidget.dart';

class LoginScreen extends BaseStatelessScreen {
  const LoginScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(AppLocalizations.of(context).translate("app_name"))),
          LoginButtonWidget()
        ],
      ),
    );
  }
}
