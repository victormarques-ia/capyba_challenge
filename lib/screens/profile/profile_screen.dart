import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:capyba_challenge/navigations/screen_arguments/user_profile_arguments.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile_screen";
  @override
  Widget build(BuildContext context) {
    final UserProfileArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: args != null && args.userUid != null ? CustomAppBar() : null,
      body: Body(
        userUid: args != null && args.userUid != null ? args.userUid : null,
      ),
    );
  }
}
