import 'package:flutter/material.dart';

import 'components/body.dart';

class RestrictedScreen extends StatelessWidget {
  static String routeName = "/restricted";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
