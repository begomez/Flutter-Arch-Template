import 'package:flutter/material.dart';

/**
 * Base class for screens (main containers) with no state
 */
abstract class BaseStatelessScreen extends StatelessWidget {
  final String title;

  const BaseStatelessScreen({this.title = "", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: SafeArea(child: this.buildScreenContent(context)),
    );
  }

  Widget buildAppBar(BuildContext cntxt) {
    final title = this.getScreenTitle(cntxt);
    if (title.isNotEmpty) {
      return AppBar(
        title: Text(title),
      );
    } else {
      return null;
    }
  }

  /**
   * Builds a widget representing main content of the screen
   */
  //XXX: must be overriden by subclasses
  Widget buildScreenContent(BuildContext cntxt);

  /**
   * Returns title displayed in app bar, return "" to hide bar
   */
  //XXX: can be overriden by subclasses
  String getScreenTitle(BuildContext cntxt) => this.title;
}
