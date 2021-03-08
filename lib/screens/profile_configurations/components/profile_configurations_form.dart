import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/utils/message_feature_in_construction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class ProfileConfigurationsForm extends StatelessWidget {
  final UserModel initialData;

  const ProfileConfigurationsForm({
    Key key,
    @required this.initialData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final userFormController = Provider.of<UserFormController>(context);

    return Form(
      key: userFormController.profileConfigurationsForm,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          CustomInputField(
            initialValue: initialData.name,
            hint: "Nome",
            iconData: FeatherIcons.italic,
            inputType: TextInputType.text,
            validator: userFormController.validateName,
            onChanged: userFormController.onSavedName,
          ),
          CustomInputField(
            initialValue: initialData.email,
            hint: "E-mail",
            iconData: FeatherIcons.mail,
            inputType: TextInputType.emailAddress,
            disableTextField: false,
          ),
          CustomInputField(
            initialValue: initialData.bio,
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
                    await userFormController.update(
                      user.uid,
                      initialData,
                    );
                    if (userFormController.validate) {
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
                    onClick: () => showMessageFeatureInConstructior(context),
                    //_showDeleteProfileDialog(context, userFormController),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDeleteProfileDialog(
      BuildContext context, UserFormController userFormController) {
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
                      onPress: () async {
                        await userFormController.delete();
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
