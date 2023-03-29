import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/presentation/screens/HomeScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("When building obj then title is stored", () {
    assert(HomeScreen(
          title: "home title",
        ).title ==
        "home title");
  });

  testWidgets('When home screen requested then screen is loaded',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
      locale: Locale('en'),
      localizationsDelegates: [
        AppLocalizationsDelegate(testing: true),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ));
    await tester.pumpAndSettle(); //XXX: for localizations

    expect(find.byType(WillPopScope), findsOneWidget);
  });
}
