import 'package:flutter/material.dart';

/**
 * Base class for widgets with no dynamic state
 */
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContents(context);
  }

  /**
   * Returns widget content.
   * Abstract method that has to be overriden by children
   */
  Widget buildWidgetContents(BuildContext context);
}
