import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/publication.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final String publicationUid;

  const Body({
    Key key,
    @required this.publicationUid,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final publicationController = Provider.of<PublicationController>(context);

    publicationController.getSpecificPublication(publicationUid);

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: publicationController.specificPublication != null
                ? Column(
                    children: [
                      Publication(
                        whoPublished:
                            publicationController.specificPublication.user.name,
                        description: publicationController
                            .specificPublication.description,
                        urlImage: publicationController
                            .specificPublication.imageAddress,
                      ),
                      SizedBox(
                        height: 64.0,
                      ),
                      publicationController.specificPublication.ownerUid ==
                              user.uid
                          ? Center(
                              child: HeaderScreenItem(
                                titleHeaderItem: "Deletar publicação",
                                textStyle: TextTextStyle,
                                iconHeaderItem: FeatherIcons.trash2,
                                onClick: () => _showDeletePublicationDialog(
                                    context, publicationController),
                              ),
                            )
                          : Container(),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  _showDeletePublicationDialog(
      BuildContext context, PublicationController publicationController) {
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
                      onPress: () async {
                        if (await publicationController
                            .deleteSpecificPublication(
                                publicationUid,
                                publicationController
                                    .specificPublication.imageAddress)) {
                          await publicationController
                              .showCustomDialogPublicationDeleteSuccess(
                            context,
                          );
                          Navigator.of(context).pop();
                          Navigator.pushNamed(
                              context, DrawerNavigation.routeName);
                        } else {
                          await publicationController
                              .showCustomDialogPublicationDeleteError(
                            context,
                          );
                        }
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
