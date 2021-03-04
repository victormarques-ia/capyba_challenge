import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomInputField(
                  inputType: TextInputType.emailAddress,
                  hint: "E-mail",
                  iconData: FeatherIcons.mail,
                ),
                RoundedButton(
                  text: "Entrar",
                  color: Theme.of(context).primaryColor,
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
