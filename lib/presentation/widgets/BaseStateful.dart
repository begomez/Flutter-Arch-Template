import 'package:flutter/material.dart';

class BaseStateful extends StatefulWidget {
  BaseStateful({Key key}) : super(key: key);

  @override
  BaseStatefulState createState() => BaseStatefulState();
}

class BaseStatefulState extends State<BaseStateful> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return this.buildBody();
  }

  Widget buildBody() {}
}
