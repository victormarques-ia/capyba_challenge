import 'package:capyba_challenge/components/custom_alert_dialog.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';

showMessageFeatureInConstructior(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomAlertDialog(
        title: "Esta funcionalidade ainda está em desenvolvimento!",
        content: Column(
          children: [
            SizedBox(
              height: 32.0,
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
