import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TokenEmailForm extends StatelessWidget {
  final Function setIndex;

  const TokenEmailForm({
    Key key,
    @required this.setIndex,
  }) : super(key: key);
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
        SizedBox(
          height: 34.0,
        ),
        RoundedButton(
          text: "Confirmar",
          color: Theme.of(context).primaryColor,
          onPress: () => _showConfirmEmailDialog(context),
        ),
      ],
    );
  }

  _showConfirmEmailDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "Adicione no campo abaixo, o token recebido por e-mail:",
          content: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              CustomInputField(
                hint: "Token",
                iconData: FeatherIcons.key,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: RoundedButton(
                    text: "Confirmar",
                    height: 32.0,
                    width: 110.0,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      print("TOKEN CONFIRMADO");
                      Navigator.pop(context);
                      setIndex(1);
                    },
                    buttonPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    textStyle: InactiveTextTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
