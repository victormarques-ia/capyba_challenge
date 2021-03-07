import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/publication.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:capyba_challenge/screens/camera/camera_screen.dart';
import 'package:capyba_challenge/screens/new_publication/new_publication_screen.dart';
import 'package:capyba_challenge/screens/specific_publication/specific_publication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final publicationController = Provider.of<PublicationController>(context);
    final publications = Provider.of<List<PublicationModel>>(context);

    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Center(
                  child: HeaderScreenItem(
                    titleHeaderItem: "Nova publicação",
                    onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraScreen(
                          changeImage: publicationController.onSavedImage,
                          navigationFunction: () {
                            Navigator.of(context)
                                .pushNamed(NewPublicationScreen.routeName);
                          },
                        ),
                      ),
                    ),
                    bottomLine: true,
                    iconHeaderItem: FeatherIcons.plus,
                  ),
                ),
              ),
              publications != null
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: publications.length,
                        itemBuilder: (_, index) {
                          PublicationModel publication = publications[index];
                          return Container(
                            padding: EdgeInsets.only(bottom: 28.0),
                            child: Publication(
                              whoPublished: "Joao Silva",
                              description: publication.description,
                              onClickImage: () => Navigator.pushNamed(
                                context,
                                SpecificPublicationScreen.routeName,
                              ),
                              onClickProile: () => print("Cliquei no profile"),
                              urlImage: publication.imageAddress,
                            ),
                          );
                        },
                      ),
                    )
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
