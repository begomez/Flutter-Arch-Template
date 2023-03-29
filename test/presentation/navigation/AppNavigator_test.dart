// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
//import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

class FakeRoute<T> extends Fake implements Route<T> {}

void main() {
  late BuildContext mockContext;
  late NavigatorObserver mockObserver;

  setUpAll(() {
    registerFallbackValue(FakeRoute);
  });

  setUp(() {
    mockContext = MockBuildContext();
    mockObserver = MockNavigatorObserver();
  });
/*
  testWidgets('AppNavigator ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Navigator(),
      locale: Locale('en'),
      navigatorObservers: [observer],
      routes: {
        '/somePage': (_) => const SizedBox(),
      },
      onGenerateRoute: (settings) {
        (settings.name == '/') ? SizedBox() : SizedBox();
      },
      localizationsDelegates: [
        AppLocalizationsDelegate(testing: true),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ));
    await tester.pumpAndSettle(); //XXX: for localizations

    AppNavigator.closeAll(context);

    verify(() => observer.didPop(any(), any()));
  });
  */
}
