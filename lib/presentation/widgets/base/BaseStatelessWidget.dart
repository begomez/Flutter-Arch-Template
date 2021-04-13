import 'package:flutter/material.dart';

/**
 * Base class for widgets with no dynamic state
 */
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContent(context);
  }

  /**
   * Return widget's content
   */
  //XXX: must be overriden by class
  Widget buildWidgetContent(BuildContext context);
}
