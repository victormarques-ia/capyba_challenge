import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class RestrictedScreen extends StatelessWidget {
  static String routeName = "/restricted";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PublicationModel>>.value(
      value: PublicationController().allPublications,
      child: Body(),
    );
  }
}
