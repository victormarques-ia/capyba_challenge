import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/constants.dart';

class DrawerNavigationItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemText;
  final BuildContext drawerContext;
  final Function onClick;
  final bool itemSelected;

  const DrawerNavigationItem({
    Key key,
    @required this.itemIcon,
    @required this.itemText,
    @required this.drawerContext,
    @required this.onClick,
    this.itemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onClick,
          leading: Icon(
            itemIcon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(itemText, style: TextTextStyle),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: constraints.maxWidth / 1.9,
                decoration: itemSelected != null && itemSelected == true
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
