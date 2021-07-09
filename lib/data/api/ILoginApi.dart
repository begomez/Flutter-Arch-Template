import 'package:flutter_template/network/response/LoginResponse.dart';
import 'package:flutter_template/network/response/LogoutResponse.dart';

/*
 * Login API abstraction
 */
abstract class ILoginApi {
  Future<LoginResponse> login({String user, String pass});
  Future<LogoutResponse> logout();
}
