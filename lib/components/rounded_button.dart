import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderSideColor;
  final EdgeInsets buttonPadding;
  final TextStyle textStyle;
  final double height;
  final double width;
  final Function onPress;

  RoundedButton({
    @required this.text,
    @required this.color,
    @required this.onPress,
    @optionalTypeArgs this.width,
    @optionalTypeArgs this.borderSideColor,
    @optionalTypeArgs this.buttonPadding,
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
        side: borderSideColor != null
            ? BorderSide(
                color: borderSideColor,
                width: 1,
                style: BorderStyle.solid,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Container(
          width: width != null ? width : null,
          height: height != null ? height : 58,
          padding: buttonPadding != null ? buttonPadding : null,
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
