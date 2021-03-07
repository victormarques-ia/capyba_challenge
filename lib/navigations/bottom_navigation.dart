import 'package:capyba_challenge/components/custom_bottom_navigation_bar.dart';
import 'package:capyba_challenge/screens/home/home_screen.dart';
import 'package:capyba_challenge/screens/restricted/restricted_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = "/bottom_navigation";
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
      currentWidgetView = HomeScreen();
    });
  }

  setCurrentWidgetView(int index) {
    setState(() {
      bottomIndex = index;
      switch (index) {
        case 0:
          currentWidgetView = HomeScreen();
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
