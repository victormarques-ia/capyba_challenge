import 'package:capyba_challenge/components/custom_bottom_navigation_bar.dart';
import 'package:capyba_challenge/screens/restricted/restricted_Screen.dart';
import 'package:capyba_challenge/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = "/main";
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  Widget currentWidgetView;
  int bottomIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentWidgetView = WelcomeScreen();
    });
  }

  setCurrentWidgetView(int index) {
    setState(() {
      bottomIndex = index;
      switch (index) {
        case 0:
          currentWidgetView = WelcomeScreen();
          break;
        case 1:
          currentWidgetView = RestrictedScreen();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: Builder(
          builder: (context) {
            return currentWidgetView;
          },
        ),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return CustomBottomNavigationBar(
      selectedIndex: bottomIndex,
      setIndex: setCurrentWidgetView,
    );
  }
}
