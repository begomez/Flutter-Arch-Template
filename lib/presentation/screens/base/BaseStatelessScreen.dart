import 'package:flutter/material.dart';

abstract class BaseStatelessScreen extends StatelessWidget {
  final String title;

  const BaseStatelessScreen({this.title = "", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: this.buildBody(context),
    );
  }

  Widget buildAppBar(BuildContext cntxt) {
    if (this.getScreenTitle().isNotEmpty) {
      return AppBar(
        title: Text(this.getScreenTitle()),
      );
    } else {
      return null;
    }
  }

  //XXX: must be overriden by subclasses
  Widget buildBody(BuildContext cntxt);

  String getScreenTitle() => this.title;
}
