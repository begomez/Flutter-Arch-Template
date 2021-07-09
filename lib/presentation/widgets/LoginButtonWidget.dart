import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/domain/bloc/LoginBloc.dart';
import 'package:flutter_template/domain/event/LoginEvent.dart';
import 'package:flutter_template/network/fake/FakeLoginApiImpl.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/core/BaseBlocWidget.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

/*
 * Widget that performs login using credentials
 */
class LoginButtonWidget extends BaseBlocWidget<LoginBloc> {
  const LoginButtonWidget({Key key}) : super(key: key);

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

/*
 * Companion state class
 */
class _LoginButtonWidgetState
    extends BaseBlocWidgetState<
        LoginButtonWidget,
        LoginBloc,
        LoginEvent,
        UserSessionModel> {

  _LoginButtonWidgetState()
      : super(autocall: false, bloc: LoginBloc(FakeLoginApiImpl()));

  @override
  LoginEvent getEvent() {
    return LoginEvent(user: "user...", pass: "pass...");
  }

  @override
  Widget buildInitial(BuildContext cntxt) => this._buildBtn(cntxt);

  @override
  Widget buildSuccess(BuildContext cntxt, UserSessionModel user) {
    this._navigateToHome(cntxt);

    return this._buildBtn(cntxt);
  }

  void _navigateToHome(BuildContext cntxt) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AppNavigator.toHome(cntxt);
    });
  }

  Widget _buildBtn(BuildContext cntxt) {
    return WidgetFactory.buildBtn(
        color: AppColors.accent,
        style: AppStyles.action,
        text: AppLocalizations.of(cntxt).translate("action_login"),
        callback: () async {
          this.call();
        });
  }

  @override
  LoginBloc getBloc() {
    throw UnimplementedError();
  }
}
