import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegisterForm extends StatelessWidget {
  final UserFormController userFormController;

  RegisterForm({
    @required this.userFormController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomInputField(
          hint: "Nome",
          iconData: FeatherIcons.italic,
          inputType: TextInputType.text,
          onChanged: userFormController.changeName,
        ),
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
          onChanged: userFormController.changePassword,
        ),
        CustomInputField(
          hint: "Bio",
          iconData: FeatherIcons.italic,
          inputType: TextInputType.text,
          fieldMargin: EdgeInsets.only(bottom: 48.0),
          onChanged: userFormController.changeBio,
        ),
        Container(
          child: Column(
            children: [
              RoundedButton(
                text: "Cadastrar",
                color: Theme.of(context).primaryColor,
                onPress: () {
                  userFormController.register();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
