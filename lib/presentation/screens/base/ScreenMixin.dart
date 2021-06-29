import 'package:flutter/material.dart';

/**
 * Mixin used to abstract screen layout operations
 */
mixin ScreenMixin {
  /**
   * Build the screen main structure
   */
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: this.buildScreenAppBar(context),
      body: SafeArea(child: this.buildScreenContents(context)),
    );
  }

  /**
   * Builds a widget representing the contents of the screen.
   * Must be overriden by children
   */
  Widget buildScreenContents(BuildContext cntxt);

  /**
   * Returns app bar displayed on screen.
   * Can be overriden by children if needed
   */
  Widget buildScreenAppBar(BuildContext cntxt) {
    final title = this.getScreenTitle(cntxt);
    if (title.isNotEmpty) {
      return AppBar(
        title: Text(title),
        automaticallyImplyLeading: this.leading,
      );
    } else {
      return null;
    }
  }

  /**
   * Returns title displayed in app bar. 
   * Must be overriden by children.
   * Return "" to hide app bar.
   */
  String getScreenTitle(BuildContext cntxt);

  /**
   * Accessor that returns a flag to show/hide back button on app bar.
   * Can be overriden by children
   */
  bool get leading => true;
}
