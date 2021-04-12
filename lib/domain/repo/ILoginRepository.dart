import 'package:flutter_template/common/models/UserSessionModel.dart';

abstract class ILoginRepository {
  const ILoginRepository();

  Future<UserSessionModel> login({String user, String pass});
  Future<bool> logout();
}
