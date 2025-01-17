import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:capyba_challenge/components/custom_drawer.dart';
import 'package:capyba_challenge/screens/confirm_account/confirm_account_screen.dart';
import 'package:capyba_challenge/screens/profile/profile_screen.dart';
import 'package:capyba_challenge/screens/profile_configurations/profile_configurations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'bottom_navigation.dart';

class DrawerNavigation extends StatefulWidget {
  static String routeName = "/drawer_navigation";
  final Widget optionalCurrentWidgetView;
  final int optionalCurrentIndex;

  const DrawerNavigation(
      {Key key, this.optionalCurrentWidgetView, this.optionalCurrentIndex})
      : super(key: key);
  @override
  _DrawerNavigationState createState() =>
      _DrawerNavigationState(optionalCurrentWidgetView, optionalCurrentIndex);
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  UserModel _user;
  final Widget optionalCurrentWidgetView;
  final int optionalCurrentIndex;
  Widget currentWidgetView;
  int drawerIndex = 0;

  _DrawerNavigationState(
      this.optionalCurrentWidgetView, this.optionalCurrentIndex);

  @override
  void initState() {
    super.initState();
    setState(() {
      _getUser();
      if (optionalCurrentIndex != null) {
        drawerIndex = optionalCurrentIndex;
      }
      currentWidgetView = optionalCurrentWidgetView != null
          ? optionalCurrentWidgetView
          : BottomNavigation();
    });
  }

  Future<void> _getUser() async {
    UserModel us = await AuthService().getUserData();
    setState(() {
      _user = us;
    });
  }

  setCurrentWidgetView(int index) {
    setState(() {
      drawerIndex = index;
      switch (index) {
        case 0:
          currentWidgetView = BottomNavigation();
          break;
        case 1:
          currentWidgetView = ProfileConfigurationsScreen();
          break;
        case 2:
          currentWidgetView = ConfirmAccountScreen();
          break;
        case 3:
          currentWidgetView = ProfileScreen();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: buildDrawer(),
      appBar: CustomAppBar(
        appBarIcon: FeatherIcons.menu,
        drawerKey: _key,
      ),
      body: _user != null
          ? AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: Builder(
                builder: (context) {
                  return currentWidgetView;
                },
              ),
            )
          : null,
    );
  }

  Widget buildDrawer() {
    return CustomDrawer(
      selectedIndex: drawerIndex,
      setIndex: setCurrentWidgetView,
      userData: _user,
    );
  }
}
