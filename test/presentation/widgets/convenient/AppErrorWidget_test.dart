import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppErrorWidget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('When error created then widget is displayed', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AppErrorWidget(),
      locale: Locale('en'),
      localizationsDelegates: [
        AppLocalizationsDelegate(testing: true),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ));
    await tester.pumpAndSettle();

    expect(find.text("screen_error"), findsOneWidget);
  });
}
