import 'package:capyba_challenge/screens/welcome/welcome_screen.dart';
import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};
