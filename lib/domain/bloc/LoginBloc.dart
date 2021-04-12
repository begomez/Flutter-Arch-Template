import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/LoginDTO.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';
import 'package:flutter_template/network/fake/FakeLoginApiImpl.dart';

class LoginBloc extends BaseBloc<LoginDTO, UserSessionModel> {
  ILoginRepository _repo;

  LoginBloc(ILoginApi api) : super() {
    this._repo = LoginRepositoryImpl(api: api);
  }

  @override
  void performOperation(LoginDTO dto) async {
    var result;
    try {
      final data = await this._repo.login(user: dto.user, pass: dto.pass);

      result = this.buildResult(data: data);
    } on DataException catch (de) {
      result = this.buildResult(data: null);
    } on Exception catch (e) {
      result = this.buildResult(data: null);
    } finally {
      this.processNewEvent(result);
    }
  }
}
