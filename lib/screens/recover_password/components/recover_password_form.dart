import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RecoverPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Digite o e-mail cadastrado, para ser enviado um token de recuperação",
          style: MediumTextStyle,
        ),
        SizedBox(
          height: 34.0,
        ),
        CustomInputField(
          hint: "E-mail",
          iconData: FeatherIcons.mail,
          inputType: TextInputType.emailAddress,
        ),
        CustomInputField(
          hint: "Senha",
          iconData: FeatherIcons.lock,
          inputType: TextInputType.visiblePassword,
        ),
        SizedBox(
          height: 34.0,
        ),
        RoundedButton(
          text: "Confirmar",
          color: Theme.of(context).primaryColor,
          onPress: () async {
            print("CONFIRMOU");
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
        ),
      ],
    );
  }
}
