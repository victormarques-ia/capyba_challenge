import 'package:capyba_challenge/screens/recover_password/components/link_email_form.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: LinkEmailForm(),
          )
        ],
      ),
    );
  }
}
