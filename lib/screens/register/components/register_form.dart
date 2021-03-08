import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:capyba_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(context);
    return Form(
      key: userFormController.registerForm,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          CustomInputField(
            hint: "Nome",
            iconData: FeatherIcons.italic,
            inputType: TextInputType.text,
            validator: userFormController.validateName,
            onChanged: userFormController.onSavedName,
          ),
          CustomInputField(
            hint: "E-mail",
            iconData: FeatherIcons.mail,
            inputType: TextInputType.emailAddress,
            validator: userFormController.validateEmail,
            onChanged: userFormController.onSavedEmail,
          ),
          CustomInputField(
            hint: "Senha",
            iconData: FeatherIcons.lock,
            inputType: TextInputType.visiblePassword,
            validator: userFormController.validatePassword,
            onChanged: userFormController.onSavedPassword,
          ),
          CustomInputField(
            hint: "Bio",
            iconData: FeatherIcons.italic,
            inputType: TextInputType.text,
            fieldMargin: EdgeInsets.only(bottom: 48.0),
            onChanged: userFormController.onSavedBio,
          ),
          Container(
            child: Column(
              children: [
                RoundedButton(
                  text: "Cadastrar",
                  color: Theme.of(context).primaryColor,
                  onPress: () async {
                    if (userFormController.user.avatarAddress == null) {
                      await userFormController.showCustomDialogImage(
                          context, "É necessário adicionar uma imagem.");
                    } else {
                      userFormController.onCreatedUser();
                      await userFormController.register();
                      userFormController.onCreatedUser();

                      if (!userFormController.validate) {
                        await userFormController
                            .showCustomDialogRegister(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
