import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class ProfileConfigurationsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(context);
    return Form(
      key: userFormController.profileConfigurationsForm,
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
            disableTextField: false,
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
                  text: "Salvar",
                  color: Theme.of(context).primaryColor,
                  onPress: () async {
                    if (userFormController.user.avatarAddress == null) {
                      await userFormController.showCustomDialogImage(
                          context, "É necessário adicionar uma imagem.");
                    } else {
                      await userFormController.register();
                      if (!userFormController.validate) {
                        await userFormController
                            .showCustomDialogProfileConfigurationsError(
                          context,
                        );
                      } else {
                        await userFormController
                            .showCustomDialogProfileConfigurationsSuccess(
                          context,
                        );
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 32.0,
                ),
                Center(
                  child: HeaderScreenItem(
                    titleHeaderItem: "Deletar conta",
                    textStyle: TextTextStyle,
                    iconHeaderItem: FeatherIcons.trash2,
                    onClick: () => _showDeleteProfileDialog(context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDeleteProfileDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "Deletar a conta é uma ação irreversível, deseja continuar ?",
          content: Column(
            children: [
              SizedBox(
                height: 32.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedButton(
                      text: "Cancelar",
                      height: 32.0,
                      width: 98.0,
                      color: Theme.of(context).backgroundColor,
                      borderSideColor: Theme.of(context).primaryColor,
                      onPress: () => Navigator.of(context).pop(),
                      buttonPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      textStyle: InactiveTextTextStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    RoundedButton(
                      text: "Sim",
                      height: 32.0,
                      width: 98.0,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        print("CONTA DELETADA");
                        Navigator.of(context).pop();
                      },
                      buttonPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      textStyle: InactiveTextTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
