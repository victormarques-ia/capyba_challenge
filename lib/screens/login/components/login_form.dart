import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomInputField(
            hint: "E-mail",
            iconData: FeatherIcons.mail,
            inputType: TextInputType.emailAddress,
          ),
          CustomInputField(
            hint: "Senha",
            iconData: FeatherIcons.lock,
            inputType: TextInputType.visiblePassword,
            fieldMargin: EdgeInsets.only(bottom: 4.0),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 12.0, bottom: 24.0),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Esqueceu a senha?",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ),
                RoundedButton(
                  text: "Entrar",
                  color: Theme.of(context).primaryColor,
                  onPress: () => {},
                ),
                FlatButton(
                  padding: EdgeInsets.only(top: 32.0),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Novo por aqui ?  ",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        "Cadastre-se",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
