import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/ScreenMixin.dart';

/**
 * Base class for screens (containers) with dynamic state 
 */
abstract class BaseStatefulScreen extends StatefulWidget {
  final String title;

  const BaseStatefulScreen({this.title = "", Key key}) : super(key: key);
}

/**
 * Companion state class
 */
abstract class BaseStatefulScreenState<T extends BaseStatefulScreen>
    extends State<BaseStatefulScreen> with ScreenMixin {
  BaseStatefulScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return this.buildScreen(context);
  }

  /**
   * Returns title displayed in app bar, return "" to hide bar
   */
  //XXX: can be overriden by subclasses
  String getScreenTitle(BuildContext cntxt) => this.widget.title;
}
