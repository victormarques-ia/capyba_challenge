import 'package:flutter/material.dart';
import 'package:capyba_challenge/components/user_avatar.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'drawer_navigation_item.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    UserAvatar(
                      radius: 24.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Joao",
                          style: TextTextStyle,
                        ),
                        Text(
                          "Ver perfil",
                          style: InactiveTextTextStyle.copyWith(
                              color: kInactiveColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        DrawerNavigationItem(
                          drawerContext: context,
                          itemIcon: FeatherIcons.checkSquare,
                          itemText: "Confirmar conta",
                        ),
                        DrawerNavigationItem(
                          drawerContext: context,
                          itemIcon: FeatherIcons.layers,
                          itemText: "Minhas publicações",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: DrawerNavigationItem(
                  drawerContext: context,
                  itemIcon: FeatherIcons.logOut,
                  itemText: "Sair da conta",
                ),
              ),
            ],
          ),
        ));
  }
}
