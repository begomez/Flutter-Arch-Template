import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizationsDelegate extends Mock
    implements AppLocalizationsDelegate {}

void main() {
  late AppLocalizationsDelegate mockDelegate;
  late AppLocalizations locale;

  setUp(() {
    mockDelegate = MockAppLocalizationsDelegate();
    locale = AppLocalizations(
        locale: Locale("en"),
        translations: {"someKey": "some value for someKey"},
        delegate: mockDelegate);
  });

  test('When translating then value is returned if key exists', () {
    expect(locale.translate("someKey"), "some value for someKey");
  });

  test('When translating then key is returned if key does not exist', () {
    expect(locale.translate("someOtherKey"), "someOtherKey");
  });
}
