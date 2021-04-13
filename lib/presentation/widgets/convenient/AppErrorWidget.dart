import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatelessWidget.dart';

/**
 * Widget displayed when error
 */
class AppErrorWidget extends BaseStatelessWidget {
  const AppErrorWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(AppLocalizations.of(context).translate("screen_error")),
    );
  }
}
