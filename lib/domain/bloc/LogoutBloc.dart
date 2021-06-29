import 'package:flutter_template/common/models/BooleanWrapper.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/LogoutDTO.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';

/**
 * BLoC used to perform logout operation
 */
class LogoutBloc extends BaseBloc<LogoutDTO, BooleanWrapper> {
  ILoginRepository _repo;

  LogoutBloc(ILoginApi api) : super() {
    this._repo = LoginRepositoryImpl(api: api);
  }

  @override
  Future<BooleanWrapper> manageData(LogoutDTO dto) async {
    return BooleanWrapper(flag: await this._repo.logout());
  }

  @override
  int getErrorCode() => ErrorCodes.LOGOUT_ERROR;
}
