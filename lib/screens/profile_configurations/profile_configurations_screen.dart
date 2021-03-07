import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import 'components/body.dart';

class ProfileConfigurationsScreen extends StatelessWidget {
  final UserModel userData;

  const ProfileConfigurationsScreen({
    Key key,
    @required this.userData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserFormController(),
      child: Scaffold(
        body: Body(userData: userData),
      ),
    );
  }
}
