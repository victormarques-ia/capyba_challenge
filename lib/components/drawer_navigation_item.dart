import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/constants.dart';

class DrawerNavigationItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemText;
  final BuildContext drawerContext;
  final bool itemSelected;

  const DrawerNavigationItem({
    Key key,
    @required this.itemIcon,
    @required this.itemText,
    @required this.drawerContext,
    this.itemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(drawerContext).pop(),
      leading: Icon(
        itemIcon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(itemText, style: TextTextStyle),
    );
  }
}
