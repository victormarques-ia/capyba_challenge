import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/screens/camera/camera_screen.dart';
import 'package:capyba_challenge/screens/new_publication/new_publication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final publicationController = Provider.of<PublicationController>(context);
    return SafeArea(
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
    );
  }
}
