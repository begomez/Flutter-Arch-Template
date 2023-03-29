import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/app/MainApp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('When creating app then material app is loaded', (tester) async {
    await tester.pumpWidget(MainApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
