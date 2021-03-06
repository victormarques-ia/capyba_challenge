import 'package:capyba_challenge/components/profile_item.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Publication extends StatelessWidget {
  final String whoPublished;
  final Function onClickProile;
  final Function onClickImage;
  final String urlImage;
  final String description;
  final bool iLiked;

  const Publication({
    Key key,
    @required this.whoPublished,
    @required this.urlImage,
    @required this.description,
    @required this.onClickProile,
    @required this.onClickImage,
    @optionalTypeArgs this.iLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onClickProile,
          splashColor: Colors.transparent,
          child: ProfileItem(
            title: whoPublished,
            subTitle: "Ver perfil",
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        InkWell(
          onTap: onClickImage,
          splashColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  urlImage,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Icon(
            FeatherIcons.heart,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          child: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: InactiveTextTextStyle,
          ),
        ),
      ],
    );
  }
}