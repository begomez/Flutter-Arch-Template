import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/domain/bloc/LoginBloc.dart';
import 'package:flutter_template/domain/event/LoginEvent.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/LoginButtonWidget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('When login button created then widget is displayed',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginButtonWidget(),
      locale: Locale('en'),
      localizationsDelegates: [
        AppLocalizationsDelegate(testing: true),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ));
    await tester.pumpAndSettle();

    expect(find.text("action_login"), findsOneWidget);
  });

  test('When creating state then correct type is returned', () {
    const widget = LoginButtonWidget();
    final element = widget.createState();
    expect(element, isA<LoginButtonWidgetState>());
  });

  test('When getting event then correct type is returned', () {
    const widget = LoginButtonWidget();
    final element = widget.createState();
    final actual = element.getEvent();
    expect(actual, isA<LoginEvent>());
  });

  test('When getting bloc then correct type is returned', () {
    const widget = LoginButtonWidget();
    final element = widget.createState();
    final actual = element.getBlocInstance();
    expect(actual, isA<LoginBloc>());
  });

  test('When checking for autocall then false is returned', () {
    const widget = LoginButtonWidget();
    final element = widget.createState();
    expect(element.isAutocall(), false);
  });
}
