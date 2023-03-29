import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/common/models/MessageModel.dart';
import 'package:flutter_template/network/response/LoginResponse.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When creating login response object then data is stored properly', () {
    final expected = FakeModelFactory.buildUser();

    final actual = LoginResponse(user: expected);

    expect(expected.mail, actual.user.mail);
    expect(expected.token, actual.user.token);
    expect(expected.name, actual.user.name);
  });

  test('When creating login response object then msg is stored properly', () {
    final expectedUser = FakeModelFactory.buildUser();
    final expectedMsg = MessageModel("title", "descrip");
    final actual = LoginResponse(user: expectedUser, msg: expectedMsg);

    expect(expectedMsg.title, actual.msg.title);
    expect(expectedMsg.descrip, actual.msg.descrip);
  });
}
