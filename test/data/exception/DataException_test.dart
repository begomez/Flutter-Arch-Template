import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When using empty constructor then default object is build', () {
    assert(DataException().code == ErrorCodes.INVALID);
    assert(DataException().descrip.isEmpty);
  });

  test('When using constructor then data is stored', () {
    const int code = 1;
    const String descrip = "some descrip";

    final actual = DataException(code: code, descrip: descrip);

    assert(actual.code == code);
    assert(actual.descrip == descrip);
  });
}
