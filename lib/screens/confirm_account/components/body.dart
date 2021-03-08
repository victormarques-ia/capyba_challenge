import 'dart:async';

import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/custom_bottom_dialog.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:capyba_challenge/utils/custom_show_bottom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  final _authService = AuthService();
  User user;
  Timer timer;

  @override
  void initState() {
    user = _auth.currentUser;

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  "Clique no botão abaixo para ser enviado um link de confirmação para o e-mail cadastrado:",
                  style: MediumTextStyle,
                ),
                SizedBox(
                  height: 34.0,
                ),
                Center(
                  child: HeaderScreenItem(
                    titleHeaderItem: "Solicitar link",
                    onClick: () =>
                        _showConfirmAccountDialog(context, user.email),
                    bottomLine: true,
                    iconHeaderItem: FeatherIcons.key,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = _auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      await showCustomDialogConfirmAccountSuccess(context);
      _authService.userFromFirebaseUser(user);
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DrawerNavigation()));
    }
  }

  Future<void> showCustomDialogConfirmAccountSuccess(
      BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage: "Sucesso ao verificar conta.",
        backgroundColor: kMainColor,
        iconMessage: FeatherIcons.check,
        labelDialog: "AccountVerify",
      ),
      "AccountVerify",
    );
  }

  _showConfirmAccountDialog(BuildContext context, String userEmail) {
    user.sendEmailVerification();
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "Um e-mail foi enviado para $userEmail, por favor verifique!",
          content: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      text: "Ok",
                      height: 32.0,
                      width: 98.0,
                      color: Theme.of(context).primaryColor,
                      onPress: () => Navigator.of(context).pop(),
                      buttonPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      textStyle: InactiveTextTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
