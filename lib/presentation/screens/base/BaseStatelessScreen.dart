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
   * Returns title displayed in app bar, return "" to hide bar
   * Can be overriden by subclasses
   */
  String getScreenTitle(BuildContext cntxt) => this.title;
}
