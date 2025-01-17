import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class NewPublicationScreen extends StatelessWidget {
  static String routeName = "/new_publication";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}
