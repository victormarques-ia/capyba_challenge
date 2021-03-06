import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserFormController(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
