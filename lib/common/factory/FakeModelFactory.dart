import 'dart:math';

import 'package:flutter_template/common/models/UserSessionModel.dart';

/*
 * Factory class used to create dummy instances of several data types
 */
abstract class FakeModelFactory {

  static String _randomUserName() => "Dev";

  static String _randomEmail() => "dev@gmail.com";

  static String _randomString({int len = 10}) {
    final rand = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => rand.nextInt(33) + 89)
    );
  }

  static bool randomBool() => Random().nextBool();

  static UserSessionModel buildUser() =>
    UserSessionModel(
      name: _randomUserName(),
      mail: _randomEmail(),
      token: _randomString());
}
