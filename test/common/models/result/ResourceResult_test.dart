import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/result/ResourceResult.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When using default contructor then no data', () {
    assert(!ResourceResult().hasData());
  });

  test('When using default contructor then no error', () {
    assert(!ResourceResult().hasError());
  });

  test('When using default contructor then status is initial', () {
    assert(ResourceResult().isInitial());
  });

  test('When having data then hasData() returns true', () {
    assert(ResourceResult(data: "some value", status: ResourceStatus.SUCCESS)
        .hasData());
  });

  test('When having error then hasError() returns true', () {
    assert(ResourceResult(error: ErrorModel(code: 1, descrip: "error descrip"))
        .hasError());
  });

  test('When loading status then isLoading() returns true', () {
    assert(ResourceResult(status: ResourceStatus.LOADING).isLoading());
    assert(!ResourceResult(status: ResourceStatus.LOADING).isSuccess());
    assert(!ResourceResult(status: ResourceStatus.LOADING).isError());
    assert(!ResourceResult(status: ResourceStatus.LOADING).isInitial());
  });

  test('When initial status then isInitial() returns true', () {
    assert(ResourceResult(status: ResourceStatus.INITIAL).isInitial());
  });

  test('When success status then isSuccess() returns true', () {
    assert(ResourceResult(status: ResourceStatus.SUCCESS).isSuccess());
  });

  test('When error status then isError() returns true', () {
    assert(ResourceResult(status: ResourceStatus.ERROR).isError());
  });
}
