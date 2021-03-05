import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: HeaderScreenItem(
          titleHeaderItem: "Nova publicação na Home",
          onClick: () => print("Nova publicação na Home"),
          bottomLine: true,
          iconHeaderItem: FeatherIcons.plus,
        ),
      ),
    );
  }
}
