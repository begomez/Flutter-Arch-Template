import 'package:flutter/material.dart';

/**
 * Mixin used to abstract screen layout
 */
mixin ScreenMixin {
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: this.buildScreenAppBar(context),
      body: SafeArea(child: this.buildScreenContents(context)),
    );
  }

  /**
   * Builds a widget representing main content of the screen
   */
  //XXX: must be overriden by subclasses
  Widget buildScreenContents(BuildContext cntxt);

  /**
   * Returns app bar displayed on screen
   */
  Widget buildScreenAppBar(BuildContext cntxt) {
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
