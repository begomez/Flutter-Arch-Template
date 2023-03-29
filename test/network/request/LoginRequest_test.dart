import 'package:flutter_template/network/request/LoginRequest.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When creating login request obj then data is stored properly', () {
    assert(LoginRequest(user: "user", pass: "").user == "user");
    assert(LoginRequest(user: "", pass: "pass").pass == "pass");
  });
}
