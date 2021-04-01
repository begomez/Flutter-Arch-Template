import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';

class HomeScreen extends BaseStatelessScreen {
  const HomeScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContent(BuildContext context) {
    return Center(
        child: Container(
      child: Text(this.getScreenTitle()),
    ));
  }

  @override
  String getScreenTitle() => "Home";
}
