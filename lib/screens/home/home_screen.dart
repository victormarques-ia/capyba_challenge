import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Future<PublicationModel>>>.value(
      value: PublicationController().onlyPublicPublications,
      child: Body(),
    );
  }
}
