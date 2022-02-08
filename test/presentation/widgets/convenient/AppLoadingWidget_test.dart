import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppLoadingWidget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('When loading created then widget is displayed', (tester) async {
    await tester.pumpWidget(AppLoadingWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
