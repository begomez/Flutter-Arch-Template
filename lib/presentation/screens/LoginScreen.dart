import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';

import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/LoginButtonWidget.dart';

/**
 * Login screen
 */
class LoginScreen extends BaseStatelessScreen {
  const LoginScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: _Dimens.PADDING_TOP),
            child: Text(
              AppLocalizations.of(context).translate("app_name"),
              style: AppStyles.title,
            ),
          ),
          LoginButtonWidget()
        ],
      ),
    );
  }
}

abstract class _Dimens {
  static const double PADDING_TOP = 128.0;
}
