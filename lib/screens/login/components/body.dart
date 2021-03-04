import 'package:flutter/material.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 16.0,
              ),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Image(
                      image: AssetImage("assets/images/capyba_simbolo.png"),
                      width: 164.0,
                    ),
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
