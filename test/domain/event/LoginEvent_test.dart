import 'package:flutter_template/domain/event/LoginEvent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When creating login event obj then data is stored properly', () {
    assert(LoginEvent(user: "user", pass: "").user == "user");
    assert(LoginEvent(user: "", pass: "pass").pass == "pass");
  });
}
