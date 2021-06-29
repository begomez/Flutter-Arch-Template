import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/LoginDTO.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';

/**
 * BLoC used to perform login operation
 */
class LoginBloc extends BaseBloc<LoginDTO, UserSessionModel> {
  ILoginRepository _repo;

  LoginBloc(ILoginApi api) : super() {
    this._repo = LoginRepositoryImpl(api: api);
  }

  @override
  Future<UserSessionModel> manageData(LoginDTO dto) async {
    return await this._repo.login(user: dto.user, pass: dto.pass);
  }

  @override
  int getErrorCode() => ErrorCodes.LOGIN_ERROR;
}
