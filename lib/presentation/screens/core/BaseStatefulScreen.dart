import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/ScreenMixin.dart';

/*
 * Base class for screens (containers) with dynamic state 
 */
abstract class BaseStatefulScreen extends StatefulWidget {
  final String title;

  const BaseStatefulScreen({this.title = "", Key key}) : super(key: key);
}

/*
 * Companion state class.
 * 
 * It is a generic class:
 *
 * - TargetScreen: data type for the widget binded to this class
 */
abstract class BaseStatefulScreenState<TargetScreen extends BaseStatefulScreen>
    extends State<TargetScreen> with ScreenMixin {

  BaseStatefulScreenState() : super();

  // See ScreenMixin

  @override
  Widget build(BuildContext context) {
    return this.buildScreen(context);
  }

  @override
  String getScreenTitle(BuildContext cntxt) => this.widget.title;
}
