import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppLocalizationsDelegate delegate;

  setUp(() {
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
}
