import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

class LoginScreen extends BaseStatelessScreen {
  const LoginScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(AppLocalizations.of(context).translate("app_name"))),
          this._buildBtn(context)
        ],
      ),
    );
  }

  Widget _buildBtn(BuildContext cntxt) {
    return WidgetFactory.buildBtn(
        color: Colors.red,
        text: "Login",
        callback: () async {
          await AppNavigator.toHome(cntxt);
        });
  }
}
