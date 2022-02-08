import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/result/ResourceResult.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/event/core/BaseEvent.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeBloc extends BaseBloc<BaseEvent, BaseModel> {
  @override
  Future<BaseModel> processEvent(BaseEvent event) async {
    return Future.value(BaseModel());
  }
}

class FakeBlocThrowingException extends BaseBloc<BaseEvent, BaseModel> {
  @override
  Future<BaseModel> processEvent(BaseEvent event) async {
    throw DataException(code: ErrorCodes.DATA_ERROR);
  }
}

void main() {
  late BaseEvent event;
  late BaseModel model;
  late FakeBloc bloc;
  late FakeBlocThrowingException blocThrowing;

  setUp(() {
    event = BaseEvent();
    model = BaseModel();
    bloc = FakeBloc();
    blocThrowing = FakeBlocThrowingException();

    //bloc.output.listen((event) {});
    //blocThrowing.output.listen((event) {});
  });

  tearDown(() {
    //bloc.input.close();
    //blocThrowing.input.close();
  });

  test('When processing event then state is returned', () async {
    expectLater(await bloc.processEvent(event), isA<BaseModel>());
  });

  test('When performing operation then input is managed', () async {
    final expected = ResourceResult(
        data: model, error: null, status: ResourceStatus.SUCCESS);
    await bloc.performOperation(event);
    expect(await bloc.output.isEmpty, false);
  });

  /*
  test('When performing operation and error happens then exception is thrown',
      () async {
    final expected = ResourceResult(
        data: null,
        error: ErrorModel(code: ErrorCodes.DATA_ERROR),
        status: ResourceStatus.ERROR);
    await blocThrowing.performOperation(event);
    expect(await bloc.output.isEmpty, false);
    //expect(await blocThrowing.output.contains(expected), true);
  });
  */

  test('When getting error code then default is returned', () async {
    assert(bloc.getErrorCode() == ErrorCodes.INVALID);
  });

  test('When building result with data then data is wrapped', () async {
    final expected = ResourceResult(data: model);
    final actual = bloc.buildResult(data: model);

    assert(actual.data != null);
    assert(actual.status == ResourceStatus.SUCCESS);
    assert(actual.error == null);
    assert(expected.data == actual.data);
  });

  test('When building result with error then error is wrapped', () async {
    final error = ErrorModel(code: ErrorCodes.DATA_ERROR);
    final actual = bloc.buildResult(errorCode: ErrorCodes.DATA_ERROR);

    assert(actual.data == null);
    assert(actual.error != null);
    assert(actual.status == ResourceStatus.ERROR);
    assert(actual.error!.code == error.code);
    assert(actual.error!.descrip == error.descrip);
  });

  test('When building result with invalid error then error is ignored',
      () async {
    final actual = bloc.buildResult(errorCode: ErrorCodes.INVALID);

    assert(actual.data == null);
    assert(actual.error == null);
  });
}
