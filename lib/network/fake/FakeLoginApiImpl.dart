import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/network/response/LoginResponse.dart';
import 'package:flutter_template/network/response/LogoutResponse.dart';

class FakeLoginApiImpl implements ILoginApi {
  final int DELAY_IN_SECS = 3;

  @override
  Future<LoginResponse> login({String user, String pass}) async {
    return await Future.delayed(Duration(seconds: DELAY_IN_SECS))
        .then((val) => LoginResponse(user: FakeModelFactory.buildUser()));
  }

  @override
  Future<LogoutResponse> logout() async {
    return await Future.delayed(Duration(seconds: DELAY_IN_SECS))
        .then((value) => LogoutResponse(flag: FakeModelFactory.randomBool()));
  }
}
