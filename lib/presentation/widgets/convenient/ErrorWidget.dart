import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatelessWidget.dart';

class ErrorWidget extends BaseStatelessWidget {
  const ErrorWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Error"),
    );
  }
}
