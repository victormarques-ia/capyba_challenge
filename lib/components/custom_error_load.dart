import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomErrorLoad extends StatelessWidget {
  final String errorMessage;
  final double iconSize;

  const CustomErrorLoad({
    Key key,
    @required this.errorMessage,
    @optionalTypeArgs this.iconSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            FeatherIcons.alertTriangle,
            color: kErrorColor,
            size: iconSize != null ? iconSize : 64.0,
          ),
          Text('Error: $errorMessage'),
        ],
      ),
    );
  }
}
