import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/navigations/drawer_navigation.dart';
import 'package:capyba_challenge/screens/confirm_account/confirm_account_screen.dart';
import 'package:flutter/material.dart';

showMessageConfirmAccount(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomAlertDialog(
        title:
            "Você precisa confirmar a conta para acessar essa funcionalidade, fazer isso agora ?",
        content: Column(
          children: [
            SizedBox(
              height: 32.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    text: "Cancelar",
                    height: 32.0,
                    width: 98.0,
                    color: Theme.of(context).backgroundColor,
                    borderSideColor: Theme.of(context).primaryColor,
                    onPress: () => Navigator.of(context).pop(),
                    buttonPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    textStyle: InactiveTextTextStyle.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  RoundedButton(
                    text: "Sim",
                    height: 32.0,
                    width: 98.0,
                    color: Theme.of(context).primaryColor,
                    onPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrawerNavigation(
                                optionalCurrentWidgetView:
                                    ConfirmAccountScreen(),
                                optionalCurrentIndex: 2,
                              )),
                    ),
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
