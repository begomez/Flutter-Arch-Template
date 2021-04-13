import 'package:flutter/material.dart';

abstract class ScreenMixin {
  /**
   * Returns app bar displayed on screen
   */
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
   * Returns title displayed in app bar, return "" to hide bar
   */
  String getScreenTitle(BuildContext cntxt);
}
