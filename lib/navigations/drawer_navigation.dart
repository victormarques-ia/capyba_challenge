import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:capyba_challenge/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'bottom_navigation.dart';

GlobalKey<ScaffoldState> _key = GlobalKey();

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: buildDrawer(),
      appBar: CustomAppBar(
        appBarIcon: FeatherIcons.menu,
        drawerKey: _key,
      ),
      body: Builder(
        builder: (context) {
          return BottomNavigation();
        },
      ),
    );
  }

  Widget buildDrawer() {
    return CustomDrawer();
  }
}
