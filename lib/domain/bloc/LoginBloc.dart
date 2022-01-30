import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/event/LoginEvent.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';

/*
 * BLoC used to perform login operation
 */
class LoginBloc extends BaseBloc<LoginEvent, UserSessionModel> {
  late ILoginRepository _repo;

  LoginBloc(ILoginApi api) : super() {
    this._repo = LoginRepositoryImpl(api: api);
  }

  @override
  Future<UserSessionModel> processEvent(LoginEvent event) async {
    return await this._repo.login(user: event.user, pass: event.pass);
  }

  @override
  int getErrorCode() => ErrorCodes.LOGIN_ERROR;
}
