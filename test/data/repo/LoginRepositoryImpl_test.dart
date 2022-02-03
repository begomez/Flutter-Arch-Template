import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/data/api/ILoginApi.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/data/repo/LoginRepositoryImpl.dart';
import 'package:flutter_template/network/response/LoginResponse.dart';
import 'package:flutter_template/network/response/LogoutResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginApi extends Mock implements ILoginApi {}

void main() {
  late ILoginApi api;
  late LoginRepositoryImpl repo;

  setUp(() {
    api = MockLoginApi();
    repo = LoginRepositoryImpl(api: api);
  });

  test('When performing login then a user is returned', () async {
    final expected = FakeModelFactory.buildUser();
    when(() => api.login(user: any(named: "user"), pass: any(named: "pass")))
        .thenAnswer((_) async => LoginResponse(user: expected));

    final actual = await repo.login(user: "user", pass: "pass");

    expect(expected.name, actual.name);
    expect(expected.mail, actual.mail);
    expect(expected.token, actual.token);

    verify(() => api.login(user: any(named: "user"), pass: any(named: "pass")))
        .called(1);

    verifyNoMoreInteractions(api);
  });

  test('When login fails then an exception is thrown', () async {
    when(() => api.login(user: any(named: "user"), pass: any(named: "pass")))
        .thenThrow(Exception());
    final result = repo.login;
    expect(
        result.call(user: "user", pass: "pass"), throwsA(isA<DataException>()));
  });

  test('When performing logout then a user is disconnected', () async {
    when(() => api.logout())
        .thenAnswer((_) async => LogoutResponse(flag: true));

    final actual = await repo.logout();

    expect(true, actual);

    verify(() => api.logout()).called(1);

    verifyNoMoreInteractions(api);
  });

  test('When logout fails then an exception is thrown', () async {
    when(() => api.logout()).thenThrow(Exception());
    final result = repo.logout;
    expect(result.call(), throwsA(isA<DataException>()));
  });
}
