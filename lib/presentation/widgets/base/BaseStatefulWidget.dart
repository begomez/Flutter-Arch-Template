import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key key}) : super(key: key);

  @override
  BaseStatefulWidgetState createState() => BaseStatefulWidgetState();
}

class BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContent();
  }

  Widget buildWidgetContent() {}
}
