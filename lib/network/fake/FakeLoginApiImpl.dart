import 'dart:math';

import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/network/response/LoginResponse.dart';
import 'package:flutter_template/network/response/LogoutResponse.dart';

/*
 * Fake login API implementation
 */
class FakeLoginApiImpl implements ILoginApi {
  
  @override
  Future<LoginResponse> login({String? user, String? pass}) async {
    return await Future.delayed(Duration(seconds: Random().nextInt(3)))
        .then((val) => LoginResponse(user: FakeModelFactory.buildUser()));
  }

  @override
  Future<LogoutResponse> logout() async {
    return await Future.delayed(Duration(seconds: Random().nextInt(3)))
        .then((value) => LogoutResponse(flag: FakeModelFactory.randomBool()));
  }
}
