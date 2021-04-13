import 'package:flutter_template/common/models/BooleanWrapper.dart';
import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';
import 'package:flutter_template/domain/dto/LogoutDTO.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';

class LogoutBloc extends BaseBloc<LogoutDTO, BooleanWrapper> {
  ILoginRepository repo;

  LogoutBloc(ILoginApi api) : super() {
    this.repo = LoginRepositoryImpl(api: api);
  }

  @override
  Future<BooleanWrapper> fetchData(LogoutDTO dto) async {
    return BooleanWrapper(flag: await this.repo.logout());
  }

  @override
  int getErrorCode() => ErrorCodes.LOGOUT_ERROR;
}
