import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/domain/bloc/LoginBloc.dart';
import 'package:flutter_template/domain/dto/LoginDTO.dart';
import 'package:flutter_template/network/fake/FakeLoginApiImpl.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidget.dart';
import 'package:flutter_template/presentation/widgets/base/BlocMixin.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppErrorWidget.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppLoadingWidget.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

class LoginButtonWidget extends BaseStatefulWidget {
  const LoginButtonWidget({Key key}) : super(key: key);

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends BaseStatefulWidgetState<LoginButtonWidget>
    with BlocMixin<LoginBloc, UserSessionModel, LoginDTO> {
  _LoginButtonWidgetState() : super();

  @override
  void initState() {
    //this.initMixin(autocall: false, bloc: LoginBloc(FakeLoginApiImpl()));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (this.autocall) {
      this.call();
    }

    super.didChangeDependencies();
  }

  @override
  Widget buildWidgetContents(BuildContext context) {
    if (this.hasBloc()) {
      return this.buildWidgetAccordingToState(context);
    } else {
      return Container(child: Text("Init bloc on initState()"));
    }
  }

  @override
  LoginDTO getDTO() {
    return LoginDTO(user: "user", pass: "pass");
  }

  @override
  Widget buildLoading(BuildContext cntxt) => Stack(
        children: [this._buildBtn(cntxt), AppLoadingWidget()],
      );

  @override
  Widget buildError(BuildContext cntxt) {
    return AppErrorWidget();
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
      //await Navigator.of(cntxt).push(MaterialPageRoute(builder: (cntxt) => StatefulSample1()));
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
}
