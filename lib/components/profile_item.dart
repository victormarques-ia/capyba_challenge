import 'package:capyba_challenge/components/user_avatar.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final Function onClick;
  final String title;
  final String subTitle;
  final String avatarImage;
  final double radiusAvatar;
  final double paddingTopTitles;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;

  const ProfileItem({
    Key key,
    this.onClick,
    @required this.title,
    @required this.subTitle,
    @optionalTypeArgs this.avatarImage,
    @optionalTypeArgs this.radiusAvatar,
    @optionalTypeArgs this.paddingTopTitles,
    @optionalTypeArgs this.titleTextStyle,
    @optionalTypeArgs this.subTitleTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          UserAvatar(
            radius: radiusAvatar != null ? radiusAvatar : 24.0,
            urlAvatarImage: avatarImage,
          ),
          SizedBox(
            width: 16.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      titleTextStyle != null ? titleTextStyle : TextTextStyle,
                ),
                SizedBox(
                  height: paddingTopTitles != null ? paddingTopTitles : null,
                ),
                Container(
                  child: Text(
                    subTitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: subTitleTextStyle != null
                        ? subTitleTextStyle
                        : InactiveTextTextStyle.copyWith(
                            color: kInactiveColor,
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
