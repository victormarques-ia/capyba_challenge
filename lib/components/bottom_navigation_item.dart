import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool selected;
  final Function onPress;

  BottomNavigationItem({
    @required this.iconData,
    @required this.text,
    @required this.selected,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: selected
                  ? Theme.of(context).primaryColor
                  : kInactiveColor.withOpacity(0.5),
              size: 24,
            ),
            Text(
              text,
              style: selected
                  ? InactiveTextTextStyle
                  : InactiveTextTextStyle.copyWith(
                      color: kInactiveColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
