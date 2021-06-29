import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/ScreenMixin.dart';

/**
 * Base class for screens (containers) with no state
 */
abstract class BaseStatelessScreen extends StatelessWidget with ScreenMixin {
  final String title;

  const BaseStatelessScreen({this.title = "", Key key}) : super(key: key);

  // See ScreenMixin

  @override
  Widget build(BuildContext context) {
    return this.buildScreen(context);
  }

  String getScreenTitle(BuildContext cntxt) => this.title;
}
