import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final double height;
  final Function onPress;

  RoundedButton({
    @required this.text,
    @required this.color,
    @required this.onPress,
    @optionalTypeArgs this.height,
    @optionalTypeArgs this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Container(
          height: height != null ? height : 58,
          child: Center(
            child: Text(
              text,
              style: textStyle != null
                  ? textStyle
                  : Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
