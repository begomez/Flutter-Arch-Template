import 'package:flutter_template/common/models/BooleanWrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('When using default constructor then false is stored',
      (tester) async {
    final actual = BooleanWrapper();

    assert(!actual.flag);
  });

  testWidgets('When using constructor then value is stored', (tester) async {
    final actual = BooleanWrapper(flag: true);

    assert(actual.flag);
  });
}
