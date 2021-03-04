import 'package:capyba_challenge/routes.dart';
import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capyba Challenge',
      debugShowCheckedModeBanner: false,
      theme: defaultThemeData(context),
      darkTheme: defaultThemeData(context),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
