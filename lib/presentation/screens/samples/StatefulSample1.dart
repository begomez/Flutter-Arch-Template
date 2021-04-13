import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatefulScreen.dart';

class StatefulSample1 extends BaseStatefulScreen {
  const StatefulSample1({Key key}) : super(key: key);

  @override
  BaseStatefulScreenState createState() => _StatefulSample1State();
}

class _StatefulSample1State extends BaseStatefulScreenState<StatefulSample1> {
  Color _backColor = Colors.red;

  @override
  Widget buildScreenContents(BuildContext cntxt) {
    return Container(
        width: double.maxFinite,
        color: this._backColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Stateful sample 1"),
            FlatButton(
              child: Text("Click me"),
              onPressed: () {
                this.setState(() {
                  this._backColor = (this._backColor == Colors.red)
                      ? Colors.yellow
                      : Colors.red;
                });
              },
            )
          ],
        ));
  }

  @override
  String getScreenTitle(BuildContext cntxt) => "Stateful sample 1";
}
