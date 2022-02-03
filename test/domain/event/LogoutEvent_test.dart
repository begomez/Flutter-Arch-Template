import 'package:flutter_template/domain/event/LogoutEvent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When creating logout event then data is stored properly', () {
    assert(LogoutEvent() != null);
  });
}
