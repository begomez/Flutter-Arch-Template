import 'package:flutter_template/common/models/UserSessionModel.dart';

/*
 * Abstraction for login repository operations
 */
abstract class ILoginRepository {
  const ILoginRepository();

  Future<UserSessionModel> login({String user, String pass});
  Future<bool> logout();
}
