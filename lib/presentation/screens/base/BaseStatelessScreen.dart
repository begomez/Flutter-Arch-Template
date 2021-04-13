import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/ScreenMixin.dart';

/**
 * Base class for screens (main containers) with no state
 */
abstract class BaseStatelessScreen extends StatelessWidget with ScreenMixin {
  final String title;

  const BaseStatelessScreen({this.title = "", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.buildScreen(context);
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
