import 'package:capyba_challenge/components/custom_bottom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/constants.dart';

Future<void> customShowBottomDialog(
  BuildContext context,
  CustomBottomDialog customBottomDialog,
  String labelDialog,
) {
  return showGeneralDialog(
    barrierLabel: labelDialog,
    barrierDismissible: true,
    barrierColor: kBackgroundColor.withOpacity(0.8),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: customBottomDialog,
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}
