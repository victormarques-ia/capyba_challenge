import 'package:capyba_challenge/components/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

showCustomProgressIndication() {
  return Column(
    children: [
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: CustomProgressIndicator(),
        ),
      ),
    ],
  );
}
