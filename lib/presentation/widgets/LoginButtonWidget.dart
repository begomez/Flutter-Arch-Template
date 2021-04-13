import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/ResourceResult.dart';
import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/domain/bloc/LoginBloc.dart';
import 'package:flutter_template/domain/bloc/core/BlocProvider.dart';
import 'package:flutter_template/domain/dto/LoginDTO.dart';
import 'package:flutter_template/network/fake/FakeLoginApiImpl.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/convenient/LoadingWidget.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({Key key}) : super(key: key);

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  final _bloc = LoginBloc(FakeLoginApiImpl());

  _LoginButtonWidgetState() : super();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _call() {
    this._bloc.processNewEvent(
        ResourceResult<UserSessionModel>(state: ResourceState.LOADING));
    this._bloc.performOperation(LoginDTO(user: "user", pass: "pass"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: StreamBuilder<ResourceResult<UserSessionModel>>(
          stream: this._bloc.output,
          builder: (context, snap) {
            switch (snap?.data?.state) {
              case ResourceState.LOADING:
                return this.buildLoading(context);
              case ResourceState.ERROR:
                return this.buildError(context);
              case ResourceState.SUCCESS:
                return this.buildSuccess(context, snap.data.data);
              case ResourceState.INITIAL:
              default:
                return this.buildInitial(context);
            }
          },
        ),
        bloc: this._bloc);
  }

  Widget buildLoading(BuildContext cntxt) => Stack(
        children: [this._buildBtn(cntxt), LoadingWidget()],
      );

  Widget buildError(BuildContext cntxt) {
    //TODO
  }

  Widget buildInitial(BuildContext cntxt) => this._buildBtn(cntxt);

  Widget buildSuccess(BuildContext cntxt, UserSessionModel user) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AppNavigator.toHome(cntxt);
    });

    return this._buildBtn(cntxt);
  }

  Widget _buildBtn(BuildContext cntxt) {
    return WidgetFactory.buildBtn(
        color: AppColors.accent,
        style: AppStyles.action,
        text: AppLocalizations.of(cntxt).translate("action_login"),
        callback: () async {
          this._call();
        });
  }
}
