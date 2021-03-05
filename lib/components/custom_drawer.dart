import 'package:capyba_challenge/components/profile_item.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'drawer_navigation_item.dart';

class CustomDrawer extends StatelessWidget {
  final AuthService _authService = new AuthService();
  final Function setIndex;
  final int selectedIndex;

  CustomDrawer({
    Key key,
    this.setIndex,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 60.0, bottom: 40.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ProfileItem(
                    title: "Joao Silva",
                    subTitle: "Ver perfil",
                    onClick: () {
                      _drawerItemClicked(context, 1);
                    },
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: constraints.maxWidth / 2.1,
                        decoration: selectedIndex != null && selectedIndex == 1
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
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      DrawerNavigationItem(
                        drawerContext: context,
                        itemIcon: FeatherIcons.home,
                        itemText: "Home",
                        onClick: () {
                          _drawerItemClicked(context, 0);
                        },
                        itemSelected: selectedIndex == 0,
                      ),
                      DrawerNavigationItem(
                        drawerContext: context,
                        itemIcon: FeatherIcons.checkSquare,
                        itemText: "Confirmar conta",
                        onClick: () {
                          _drawerItemClicked(context, 2);
                        },
                        itemSelected: selectedIndex == 2,
                      ),
                      DrawerNavigationItem(
                        drawerContext: context,
                        itemIcon: FeatherIcons.layers,
                        itemText: "Minhas publicações",
                        onClick: () {
                          _drawerItemClicked(context, 3);
                        },
                        itemSelected: selectedIndex == 3,
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
                onClick: () async => _authService.signOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _drawerItemClicked(BuildContext context, int index) {
    setIndex(index);
    Navigator.of(context).pop();
  }
}
