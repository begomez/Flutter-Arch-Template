import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';
import 'package:flutter_template/presentation/screens/LoginScreen.dart';
import 'package:flutter_template/presentation/screens/SplashScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute<T> extends Fake implements Route<T> {}

void main() {
  late NavigatorObserver observer = MockNavigatorObserver();

  setUpAll(() {
    registerFallbackValue(FakeRoute());
    registerFallbackValue(FakeRoute);
  });

  test("When building obj then title is stored", () {
    assert(SplashScreen(
          title: "splash title",
        ).title ==
        "splash title");
  });
  testWidgets('When splash screen requested then screen is loaded',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SplashScreen(),
      locale: Locale('en'),
      navigatorObservers: [observer],
      routes: {
        Routes.splash: (cntxt) => SplashScreen(title: ""),
        Routes.login: (cntxt) => LoginScreen(title: ""),
      },
      localizationsDelegates: [
        AppLocalizationsDelegate(testing: true),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    verify(() => observer.didPush(any(), any()));
  });
}
