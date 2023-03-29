import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When creating invalid object then validation fails', () {
    final actual = UserSessionModel.invalid();

    assert(!actual.validate());
    assert(actual.mail.isEmpty);
    assert(actual.name.isEmpty);
    assert(actual.token.isEmpty);
  });

  test('When creating valid object then validation succeeds', () {
    final actual =
        UserSessionModel(mail: "mail@mail.com", name: "User", token: "1234");

    assert(actual.validate());
  });
}
