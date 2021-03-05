import 'package:capyba_challenge/navigations/bottom_navigation.dart';
import 'package:capyba_challenge/screens/register/register_screen.dart';
import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  BottomNavigation.routeName: (context) => BottomNavigation(),
};
