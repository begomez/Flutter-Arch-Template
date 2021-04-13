import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatelessWidget.dart';

class AppErrorWidget extends BaseStatelessWidget {
  const AppErrorWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Error"),
    );
  }
}
