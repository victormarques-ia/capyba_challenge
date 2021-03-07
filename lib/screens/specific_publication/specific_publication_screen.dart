import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:capyba_challenge/navigations/screen_arguments/specific_publication_arguments.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SpecificPublicationScreen extends StatelessWidget {
  static String routeName = "/specific_publication";
  @override
  Widget build(BuildContext context) {
    final SpecificPublicationArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(
        publicationUid: args.publicationUid,
      ),
    );
  }
}
