import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/common/utils/AppLogger.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';

const String TAG = "LoginRepositoryImpl";

/**
 * Implementation of login repository
 */
class LoginRepositoryImpl extends ILoginRepository {
  final ILoginApi api;

  const LoginRepositoryImpl({@required this.api}) : assert(api != null);

  @override
  Future<UserSessionModel> login({String user, String pass}) async {
    try {
      final result = await this.api.login(user: user, pass: pass);

      return result.user;
    } on Exception catch (e) {
      AppLogger.e(tag: TAG, msg: "login()", error: e);

      throw DataException();
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final result = await this.api.logout();

      return result.flag;
    } on Exception catch (e) {
      AppLogger.e(tag: TAG, msg: "logout()", error: e);

      throw DataException();
    }
  }
}
