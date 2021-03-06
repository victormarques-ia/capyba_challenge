import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget content;

  const CustomAlertDialog({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultRadius),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextTextStyle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  content,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
