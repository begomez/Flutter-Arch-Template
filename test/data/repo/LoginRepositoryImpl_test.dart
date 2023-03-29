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
  late ILoginApi mockApi;
  late LoginRepositoryImpl repo;

  setUp(() {
    mockApi = MockLoginApi();
    repo = LoginRepositoryImpl(api: mockApi);
  });

  test('When performing login then a user is returned', () async {
    final expected = FakeModelFactory.buildUser();
    when(() =>
            mockApi.login(user: any(named: "user"), pass: any(named: "pass")))
        .thenAnswer((_) async => LoginResponse(user: expected));

    final actual = await repo.login(user: "user", pass: "pass");

    expect(expected.name, actual.name);
    expect(expected.mail, actual.mail);
    expect(expected.token, actual.token);

    verify(() =>
            mockApi.login(user: any(named: "user"), pass: any(named: "pass")))
        .called(1);

    verifyNoMoreInteractions(mockApi);
  });

  test('When login fails then an exception is thrown', () async {
    when(() =>
            mockApi.login(user: any(named: "user"), pass: any(named: "pass")))
        .thenThrow(Exception());
    final result = repo.login;
    expect(
        result.call(user: "user", pass: "pass"), throwsA(isA<DataException>()));
  });

  test('When performing logout then a user is disconnected', () async {
    when(() => mockApi.logout())
        .thenAnswer((_) async => LogoutResponse(flag: true));

    final actual = await repo.logout();

    expect(true, actual);

    verify(() => mockApi.logout()).called(1);

    verifyNoMoreInteractions(mockApi);
  });

  test('When logout fails then an exception is thrown', () async {
    when(() => mockApi.logout()).thenThrow(Exception());
    final result = repo.logout;
    expect(result.call(), throwsA(isA<DataException>()));
  });
}
