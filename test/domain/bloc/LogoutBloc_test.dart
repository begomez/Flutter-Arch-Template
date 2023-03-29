import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/LogoutBloc.dart';
import 'package:flutter_template/domain/event/LogoutEvent.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepository extends Mock implements ILoginRepository {}

void main() {
  late ILoginRepository mockRepo;
  late LogoutBloc bloc;

  setUp(() {
    mockRepo = MockLoginRepository();
    bloc = LogoutBloc(mockRepo);
  });

  test('When processing login event then user is returned', () async {
    final expected = FakeModelFactory.randomBool();
    const LogoutEvent event = LogoutEvent();

    when(() => mockRepo.logout()).thenAnswer((_) async => expected);

    final result = await bloc.processEvent(event);

    expect(expected, result.flag);

    verify(() => mockRepo.logout()).called(1);
  });

  test('When getting error code then proper code is returned', () async {
    assert(bloc.getErrorCode() == ErrorCodes.LOGOUT_ERROR);
  });
}
