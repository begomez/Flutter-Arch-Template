import 'package:flutter/material.dart';

/**
 * Base class for widgets with dynamic state
 */
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key key}) : super(key: key);

  @override
  BaseStatefulWidgetState createState() =>
      BaseStatefulWidgetState<BaseStatefulWidget>();
}

class BaseStatefulWidgetState<T extends BaseStatefulWidget>
    extends State<BaseStatefulWidget> {
  BaseStatefulWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContent();
  }

  void refresh({Function action}) {
    this.setState(() {
      action?.call();
    });
  }

  Widget buildWidgetContent() {}
}
