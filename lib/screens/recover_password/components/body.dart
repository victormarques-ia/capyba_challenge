import 'package:capyba_challenge/screens/recover_password/components/recover_password_form.dart';
import 'package:capyba_challenge/screens/recover_password/components/token_email_form.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget currentWidgetView;
  int widgetIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentWidgetView = TokenEmailForm(
        setIndex: setCurrentWidgetView,
      );
    });
  }

  setCurrentWidgetView(int index) {
    setState(() {
      widgetIndex = index;
      switch (index) {
        case 0:
          currentWidgetView = TokenEmailForm(
            setIndex: setCurrentWidgetView,
          );
          break;
        case 1:
          currentWidgetView = RecoverPasswordForm();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: Builder(
                builder: (context) {
                  return currentWidgetView;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
