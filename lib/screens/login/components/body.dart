import 'package:flutter/material.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image(
                  image: AssetImage("assets/images/capyba_simbolo.png"),
                  width: 164.0,
                ),
              ),
            ),
            Expanded(
              child: LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}
