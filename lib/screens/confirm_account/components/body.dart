import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  "Clique no botão abaixo para solicitar token de confirmação da conta:",
                  style: MediumTextStyle,
                ),
                SizedBox(
                  height: 34.0,
                ),
                Center(
                  child: HeaderScreenItem(
                    titleHeaderItem: "Solicitar token",
                    onClick: () => _showConfirmAccountDialog(context),
                    bottomLine: true,
                    iconHeaderItem: FeatherIcons.key,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showConfirmAccountDialog(BuildContext context) {
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
                      print("CONTA CONFIRMADA");
                      Navigator.of(context).pop();
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
