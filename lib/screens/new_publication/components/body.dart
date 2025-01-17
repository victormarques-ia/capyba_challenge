import 'dart:io';

import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/custom_progress_indicator.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:capyba_challenge/utils/show_custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final publicationController = Provider.of<PublicationController>(context);
    return SafeArea(
      child: publicationController.createdPublication != null &&
              publicationController.createdPublication == false
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              new File(
                                publicationController.publication.imageAddress,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38.0,
                      ),
                      CustomInputField(
                        hint: "Descrição",
                        iconData: FeatherIcons.italic,
                        inputType: TextInputType.text,
                        onChanged: publicationController.onSavedDescription,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: Offset(-14, 0),
                            child: Checkbox(
                              value: publicationController.publication.public !=
                                      null
                                  ? publicationController.publication.public
                                  : false,
                              checkColor: Theme.of(context).primaryColor,
                              activeColor: kInactiveColor.withOpacity(0.1),
                              onChanged: (bool value) {
                                publicationController
                                    .onSavedPublicOption(value);
                              },
                            ),
                          ),
                          Text(
                            "Imagem pública",
                            style: TextTextStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 38.0,
                      ),
                      RoundedButton(
                        text: "Publicar",
                        color: Theme.of(context).primaryColor,
                        onPress: () async {
                          publicationController.onCreatedPublication();
                          final result =
                              await publicationController.createPublication();
                          if (result != null) {
                            publicationController.onCreatedPublication();
                            await publicationController
                                .showCustomDialogPublicationSuccess(context)
                                .then(
                                  (value) => Navigator.of(context)
                                      .pushNamed(DrawerNavigation.routeName),
                                );
                          } else {
                            await publicationController
                                .showCustomDialogPublicationError(context);
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          : showCustomProgressIndication(),
    );
  }
}
