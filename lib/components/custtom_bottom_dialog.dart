import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomDialog extends StatelessWidget {
  final String textMessage;
  final IconData iconMessage;
  final Color backgroundColor;

  const CustomBottomDialog({
    Key key,
    @required this.textMessage,
    @required this.iconMessage,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      color: kInactiveColor.withOpacity(0.1),
      type: MaterialType.canvas,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: backgroundColor,
                  ),
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
                      Text(
                        "Ok",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
