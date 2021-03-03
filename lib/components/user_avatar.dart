import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final userAvatarImage =
      "https://images.unsplash.com/photo-1492462543947-040389c4a66c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 74.0,
      backgroundColor: Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: 72.0,
        backgroundColor: Theme.of(context).primaryColor,
        backgroundImage: NetworkImage(
          userAvatarImage,
        ),
      ),
    );
  }
}
