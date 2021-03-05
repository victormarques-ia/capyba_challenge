import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final IconData appBarIcon;
  final GlobalKey<ScaffoldState> drawerKey;

  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
    @optionalTypeArgs this.appBarIcon,
    this.drawerKey,
  })  : preferredSize = Size.fromHeight(72.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Transform.translate(
        offset: appBarIcon != null ? Offset(0, 0) : Offset(-8, 0),
        child: IconButton(
            icon: Icon(
              appBarIcon != null ? appBarIcon : FeatherIcons.chevronLeft,
              color: Theme.of(context).primaryColor,
              size: appBarIcon != null ? 28.0 : 34.0,
            ),
            onPressed: () {
              if (drawerKey != null) {
                drawerKey.currentState.openDrawer();
              } else {
                Navigator.pop(context);
              }
            }),
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
