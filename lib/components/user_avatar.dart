import 'dart:io';

import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final dynamic userAvatarImage;

  const UserAvatar({Key key, @required this.userAvatarImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 74.0,
      backgroundColor: Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: 72.0,
        backgroundColor: Theme.of(context).primaryColor,
        backgroundImage: userAvatarImage != null
            ? Image.file(
                new File(userAvatarImage),
              )
            : NetworkImage("https://www.w3schools.com/howto/img_avatar.png"),
      ),
    );
  }
}
