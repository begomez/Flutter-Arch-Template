import 'package:flutter/material.dart';

abstract class WidgetFactory {
  static Widget buildBtn(
      {@required Color color,
      @required String text,
      @required Function callback}) {
    return Container(
      width: double.maxFinite,
      child: MaterialButton(
          color: color, child: Text(text), onPressed: callback.call),
    );
  }
}
