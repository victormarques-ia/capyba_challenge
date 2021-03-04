import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(context);
    return Form(
      key: userFormController.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomInputField(
            hint: "E-mail",
            iconData: FeatherIcons.mail,
            inputType: TextInputType.emailAddress,
            onChanged: userFormController.onSavedEmail,
            validator: userFormController.validateEmail,
          ),
          CustomInputField(
            hint: "Senha",
            iconData: FeatherIcons.lock,
            inputType: TextInputType.visiblePassword,
            fieldMargin: EdgeInsets.only(bottom: 4.0),
            onChanged: userFormController.onSavedPassword,
            validator: userFormController.validatePassword,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.only(top: 12.0, bottom: 24.0),
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent),
                    ),
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
                  onPress: () async {
                    await userFormController.login();

                    if (!userFormController.validate) {
                      userFormController.showCustomDialog(context);
                    }
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.only(top: 32.0),
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent),
                  ),
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
      ),
    );
  }
}
