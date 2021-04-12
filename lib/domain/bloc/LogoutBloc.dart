import 'package:flutter_template/common/models/BooleanWrapper.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
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
  void performOperation(LogoutDTO dto) async {
    var result;
    try {
      final data = await this.repo.logout();

      result = this.buildResult(data: BooleanWrapper(flag: data));
    } on DataException catch (de) {
      result = this.buildResult(data: null);
    } on Exception catch (e) {
      result = this.buildResult(data: null);
    } finally {
      this.processNewEvent(result);
    }
  }
}
