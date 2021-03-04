import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/screens/main_navigation.dart';
import 'package:capyba_challenge/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final userFormController = UserFormController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomInputField(
          hint: "E-mail",
          iconData: FeatherIcons.mail,
          inputType: TextInputType.emailAddress,
          onChanged: userFormController.changeEmail,
        ),
        CustomInputField(
          hint: "Senha",
          iconData: FeatherIcons.lock,
          inputType: TextInputType.visiblePassword,
          fieldMargin: EdgeInsets.only(bottom: 4.0),
          onChanged: userFormController.changePassword,
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
                  onPress: () {
                    userFormController.login();
                    Navigator.pushNamed(context, MainNavigation.routeName);
                  }),
              FlatButton(
                padding: EdgeInsets.only(top: 32.0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () =>
                    Navigator.pushNamed(context, RegisterScreen.routeName),
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
    );
  }
}
