import 'package:capyba_challenge/components/bottom_navigation_item.dart';
import 'package:capyba_challenge/screens/restricted/restricted_Screen.dart';
import 'package:capyba_challenge/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = "/main";
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<bool> bottomNavigationItemStatus = [true, false];

  Widget currentWidgetView;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentWidgetView = WelcomeScreen();
    });
  }

  setCurrentWidgetView(int index) {
    setState(() {
      switch (index) {
        case 0:
          currentWidgetView = WelcomeScreen();
          break;
        case 1:
          currentWidgetView = RestrictedScreen();
          break;
      }
      bottomNavigationItemStatus = [
        index == 0,
        index == 1,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: currentWidgetView,
      ),
      bottomNavigationBar: Container(
        height: 64,
        color: Theme.of(context).backgroundColor.withOpacity(0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationItem(
              iconData: FeatherIcons.home,
              text: "Home",
              selected: bottomNavigationItemStatus[0],
              onPress: () {
                setCurrentWidgetView(0);
              },
            ),
            BottomNavigationItem(
              iconData: FeatherIcons.shield,
              text: "Restrito",
              selected: bottomNavigationItemStatus[1],
              onPress: () {
                setCurrentWidgetView(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
