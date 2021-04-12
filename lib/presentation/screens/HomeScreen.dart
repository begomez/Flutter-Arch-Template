import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

class HomeScreen extends BaseStatelessScreen {
  const HomeScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContent(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        WidgetFactory.buildDialog(context);

        return true;
      },
      child: Center(
          child: Container(
        child: Text(this.getScreenTitle()),
      )),
    );
  }

  @override
  String getScreenTitle() => "Home";
}
