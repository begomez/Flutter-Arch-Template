import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/LoginBloc.dart';
import 'package:flutter_template/domain/event/LoginEvent.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepository extends Mock implements ILoginRepository {}

void main() {
  late ILoginRepository repo;
  late LoginBloc bloc;

  setUp(() {
    repo = MockLoginRepository();
    bloc = LoginBloc(repo);
  });

  test('When processing login event then user is returned', () async {
    final expected = FakeModelFactory.buildUser();
    const LoginEvent event = LoginEvent(user: "user", pass: "pass");

    when(() => repo.login(user: any(named: "user"), pass: any(named: "pass")))
        .thenAnswer((_) async => expected);

    final result = await bloc.processEvent(event);

    expect(result.name, expected.name);

    verify(() => repo.login(user: any(named: "user"), pass: any(named: "pass")))
        .called(1);
  });

  test("When getting error code then proper error is returned", () {
    assert(bloc.getErrorCode() == ErrorCodes.LOGIN_ERROR);
  });
}
