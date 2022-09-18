import 'package:flutter/material.dart';
import 'package:life_log_client_v2/screens/general/home_actions_screen.dart';
import 'package:life_log_client_v2/config/routes/routes.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:life_log_client_v2/constants.dart' as Constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      themeMode: ThemeMode.dark,
      home: const HomeActions(),
      routes: routes,
    );
  }
}
