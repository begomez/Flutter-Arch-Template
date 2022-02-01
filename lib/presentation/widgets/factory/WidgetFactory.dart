import 'package:flutter/material.dart';
import 'package:flutter_template/domain/bloc/LogoutBloc.dart';
import 'package:flutter_template/domain/event/LogoutEvent.dart';
import 'package:flutter_template/network/fake/FakeLoginApiImpl.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';

/*
 * Utils for dialogs, toast, overlays...
 */
abstract class WidgetFactory {
  static Future buildDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.translate("app_name")!),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                      AppLocalizations.of(context)!.translate("action_no")!)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    LogoutBloc(FakeLoginApiImpl())
                        .performOperation(LogoutEvent());

                    AppNavigator.toLogin(context);
                  },
                  child: Text(
                      AppLocalizations.of(context)!.translate("action_yes")!))
            ],
          );
        });
  }

  static Widget buildBtn(
      {Color color = AppColors.accent,
      required String text,
      required Function() callback,
      required TextStyle style}) {
    return Container(
      width: double.maxFinite,
      child: MaterialButton(
          color: color,
          child: Text(
            text,
            style: style,
          ),
          onPressed: callback.call),
    );
  }
}
