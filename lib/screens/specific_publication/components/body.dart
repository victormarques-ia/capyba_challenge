import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/publication.dart';
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
                Publication(
                  whoPublished: "Joao Silva",
                  description:
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                  onClickImage: () => print("Cliquei na imagem"),
                  onClickProile: () => print("Cliquei no profile"),
                  urlImage:
                      "https://images.unsplash.com/photo-1471958680802-1345a694ba6d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8d2F5fGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80",
                ),
                SizedBox(
                  height: 64.0,
                ),
                Center(
                  child: HeaderScreenItem(
                    titleHeaderItem: "Deletar publicação",
                    textStyle: TextTextStyle,
                    iconHeaderItem: FeatherIcons.trash2,
                    onClick: () => _showDeletePublicationDialog(context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDeletePublicationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "Você tem certeza que deseja deletar a publicação?",
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
                        print("PUBLICAÇÂO DELETADA");
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
