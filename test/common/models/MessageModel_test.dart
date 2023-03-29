import 'package:flutter_template/common/models/MessageModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When creating object then data store correctly', () async {
    final title = "some title";
    final descrip = "some descrip";

    final actual = MessageModel(title, descrip);

    expect(actual.title, title);
    expect(actual.descrip, descrip);
  });
}
