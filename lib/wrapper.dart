import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'screens/login/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 0),
      child: user != null ? DrawerNavigation() : LoginScreen(),
    );
  }
}
