import 'dart:math';

import 'package:flutter_template/common/models/UserSessionModel.dart';

abstract class FakeModelFactory {
  static String _randomUserName() => "SparsityDev";
  static bool randomBool() => Random().nextBool();
  static String _randomEmail() => "sparsity.dev@gmail.com";

  static String _randomString({int len = 10}) {
    final rand = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => rand.nextInt(33) + 89));
  }

  static UserSessionModel buildUser() => UserSessionModel(
      name: _randomUserName(), mail: _randomEmail(), token: _randomString());
}
