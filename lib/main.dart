import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/presentation/app/MainApp.dart';

/*
 * Execution entry point
 */
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MainApp());
}
