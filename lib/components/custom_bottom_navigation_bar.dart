import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'bottom_navigation_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function setIndex;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    Key key,
    this.setIndex,
    this.selectedIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      child: Container(
        height: 64.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationItem(
              iconData: FeatherIcons.home,
              text: "Home",
              selected: selectedIndex == 0,
              onPress: () => setIndex(0),
            ),
            BottomNavigationItem(
              iconData: FeatherIcons.shield,
              text: "Restrito",
              selected: selectedIndex == 1,
              onPress: () => setIndex(1),
            ),
          ],
        ),
      ),
    );
  }
}
