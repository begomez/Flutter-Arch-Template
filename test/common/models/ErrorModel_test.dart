import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When using empty constructor then validation fails', () async {
    final error1 = ErrorModel.empty();

    assert(!error1.validate());
  });

  test('When using constructor then validation suceeds', () async {
    final error1 = ErrorModel(code: 1, descrip: "Some error description");

    assert(error1.validate());
  });
}
