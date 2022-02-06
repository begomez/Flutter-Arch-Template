import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  late AppLocalizations loc;
  late AppLocalizationsDelegate delegate;

  setUp(() {
    loc = MockAppLocalizations();
    delegate = AppLocalizationsDelegate();
  });

  test('When asking for reload then false is returned', () {
    expect(delegate.shouldReload(AppLocalizationsDelegate()), false);
  });

  test('When checking EN locale then language is supported', () {
    expect(delegate.isSupported(Locale("en")), true);
  });

  test('When checking ES locale then language is supported', () {
    expect(delegate.isSupported(Locale("es")), true);
  });

  test('When checking FR locale then language is not supported', () {
    expect(delegate.isSupported(Locale("fr")), false);
  });

  test('When loading a locale then data is loaded', () async {
    //TODO
    /*
    final expected = loc;
    when(() async => await loc.load()).thenAnswer((_) async => expected);

    final actual = await delegate.load(Locale("en"));
    expect(actual, expected);
    */
  });
}
