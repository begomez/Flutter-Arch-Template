import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/presentation/screens/LoginScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/LoginButtonWidget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("When building obj then title is stored", () {
    assert(LoginScreen(
          title: "login title",
        ).title ==
        "login title");
  });

  testWidgets('When login screen requested then screen is loaded',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
      locale: Locale('en'),
      localizationsDelegates: [
        AppLocalizationsDelegate(testing: true),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ));
    await tester.pumpAndSettle();
    expect(find.byType(LoginButtonWidget), findsOneWidget);
  });
}
