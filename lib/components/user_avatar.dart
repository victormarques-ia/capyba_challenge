import 'dart:io';

import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final dynamic userAvatarImage;
  final double radius;

  const UserAvatar({
    Key key,
    @optionalTypeArgs this.userAvatarImage,
    @optionalTypeArgs this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius != null ? radius : 74.0,
      backgroundColor: Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: radius != null ? radius - 2.0 : 72.0,
        backgroundColor: kBackgroundColor,
        backgroundImage: userAvatarImage != null
            ? FileImage(
                new File(userAvatarImage),
              )
            : AssetImage(
                "assets/images/capyba_simbolo.png",
              ),
      ),
    );
  }
}
