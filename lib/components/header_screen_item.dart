import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

class HeaderScreenItem extends StatelessWidget {
  final IconData iconHeaderItem;
  final String titleHeaderItem;
  final TextStyle textStyle;
  final Function onClick;
  final bool bottomLine;

  const HeaderScreenItem({
    Key key,
    @required this.titleHeaderItem,
    @required this.onClick,
    @optionalTypeArgs this.iconHeaderItem,
    @optionalTypeArgs this.textStyle,
    @optionalTypeArgs this.bottomLine,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconHeaderItem),
              iconHeaderItem != null
                  ? SizedBox(
                      width: 12.0,
                    )
                  : null,
              Text(
                titleHeaderItem,
                style: textStyle != null ? textStyle : MediumTextStyle,
              ),
            ],
          ),
          bottomLine != null && bottomLine == true
              ? _buildBottomLine(bottomLine)
              : Container(),
        ],
      ),
    );
  }

  _buildBottomLine(bool bottomLine) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 6.0,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: constraints.maxWidth / 4,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
