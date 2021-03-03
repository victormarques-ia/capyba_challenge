import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(72.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Transform.translate(
        offset: Offset(-8, 0),
        child: IconButton(
          splashRadius: 1.0,
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: Theme.of(context).primaryColor,
            size: 34.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: kBackgroundColor,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 16.0,
            top: 10.0,
          ),
          child: Image(
            image: AssetImage("assets/images/capyba_simbolo.png"),
            width: 34,
          ),
        ),
      ],
    );
  }
}
