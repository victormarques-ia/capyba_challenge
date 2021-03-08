import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double height;
  final double width;

  const CustomProgressIndicator({Key key, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? width : 32.0,
      height: height != null ? height : 32.0,
      child: CircularProgressIndicator(
        valueColor:
            new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}
