import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

/**
 * Home screen displayed after login
 */
class HomeScreen extends BaseStatelessScreen {
  const HomeScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await WidgetFactory.buildDialog(context);

        return true;
      },
      child: Center(
          child: Container(
        child: Text(this.getScreenTitle(context)),
      )),
    );
  }

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("screen_home");
}
