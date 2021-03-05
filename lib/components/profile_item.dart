import 'package:capyba_challenge/components/user_avatar.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final Function onClick;
  final String title;
  final String subTitle;

  const ProfileItem({
    Key key,
    this.onClick,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          UserAvatar(
            radius: 24.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextTextStyle,
              ),
              Text(
                subTitle,
                style: InactiveTextTextStyle.copyWith(
                  color: kInactiveColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
