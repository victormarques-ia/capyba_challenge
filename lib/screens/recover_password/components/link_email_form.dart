import 'package:capyba_challenge/components/custom_bottom_dialog.dart';
import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/utils/custom_show_bottom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LinkEmailForm extends StatefulWidget {
  @override
  _LinkEmailFormState createState() => _LinkEmailFormState();
}

class _LinkEmailFormState extends State<LinkEmailForm> {
  String _email;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Digite o e-mail cadastrado, para ser enviado um link de recuperação de senha.",
          style: MediumTextStyle,
        ),
        SizedBox(
          height: 34.0,
        ),
        CustomInputField(
            hint: "E-mail",
            iconData: FeatherIcons.mail,
            inputType: TextInputType.emailAddress,
            onChanged: (value) {
              setState(
                () {
                  _email = value.trim();
                },
              );
            }),
        SizedBox(
          height: 34.0,
        ),
        RoundedButton(
          text: "Confirmar",
          color: Theme.of(context).primaryColor,
          onPress: () async {
            await _auth.sendPasswordResetEmail(email: _email);
            await showCustomDialogResetPassword(context, _email);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Future<void> showCustomDialogResetPassword(
      BuildContext context, String userEmail) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage:
            "Um e-mail foi enviado para $userEmail, por favor verifique!",
        backgroundColor: kMainColor,
        iconMessage: FeatherIcons.check,
        labelDialog: "ResetPassword",
      ),
      "ResetPassword",
    );
  }
}
