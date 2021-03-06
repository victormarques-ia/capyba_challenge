import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/publication.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
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
    return SafeArea(
        child: ListView(
      children: [
        Padding(
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
              Publication(
                whoPublished: "Joao Silva",
                description:
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                onClickImage: () => Navigator.pushNamed(
                  context,
                  SpecificPublicationScreen.routeName,
                ),
                onClickProile: () => print("Cliquei no profile"),
                urlImage:
                    "https://images.unsplash.com/photo-1471958680802-1345a694ba6d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8d2F5fGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80",
              )
            ],
          ),
        ),
      ],
    ));
  }
}
