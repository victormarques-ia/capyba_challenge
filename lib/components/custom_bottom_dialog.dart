import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomBottomDialog extends StatelessWidget {
  final String textMessage;
  final String labelDialog;
  final IconData iconMessage;
  final Color backgroundColor;

  const CustomBottomDialog({
    Key key,
    @required this.textMessage,
    @required this.iconMessage,
    @required this.backgroundColor,
    @required this.labelDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
            color: backgroundColor,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop(labelDialog);
            },
            child: Row(
              children: <Widget>[
                Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kTextColor,
                  ),
                  child: Icon(
                    iconMessage,
                    size: 14.0,
                    color: backgroundColor,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    textMessage,
                    style: TextTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kInactiveColor.withOpacity(0.3),
                  ),
                  child: Icon(
                    FeatherIcons.x,
                    size: 14.0,
                    color: kTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
