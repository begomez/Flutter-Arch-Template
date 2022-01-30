import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/network/response/LoginResponse.dart';
import 'package:flutter_template/network/response/LogoutResponse.dart';

/*
 * Login API implementation
 */
class LoginApiImpl implements ILoginApi {
  const LoginApiImpl();

  @override
  Future<LoginResponse> login({String? user, String? pass}) {
    //TODO:
    throw UnimplementedError();
  }

  @override
  Future<LogoutResponse> logout() {
    //TODO:
    throw UnimplementedError();
  }
}
