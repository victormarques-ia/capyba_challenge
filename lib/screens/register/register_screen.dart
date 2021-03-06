import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserFormController(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Body(),
      ),
    );
  }
}
