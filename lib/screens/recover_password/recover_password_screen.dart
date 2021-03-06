import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class RecoverPasswordScreen extends StatelessWidget {
  static String routeName = "/recover_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}
