import 'package:capyba_challenge/navigations/bottom_navigation.dart';
import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:capyba_challenge/screens/new_publication/new_publication_screen.dart';
import 'package:capyba_challenge/screens/register/register_screen.dart';
import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:capyba_challenge/screens/specific_publication/specific_publication_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  DrawerNavigation.routeName: (context) => DrawerNavigation(),
  BottomNavigation.routeName: (context) => BottomNavigation(),
  NewPublicationScreen.routeName: (context) => NewPublicationScreen(),
  SpecificPublicationScreen.routeName: (context) => SpecificPublicationScreen(),
};
