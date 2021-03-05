import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kMainColor,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: appBarTheme,
    canvasColor: kBackgroundColor,
    backgroundColor: kBackgroundColor,
    splashColor: kDetailsColor.withOpacity(0.3),
    brightness: Brightness.dark,
    errorColor: kErrorColor,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kBackgroundColor.withOpacity(0.05),
      selectedItemColor: kMainColor,
      unselectedItemColor: kInactiveColor,
      selectedIconTheme: IconThemeData(color: kDetailsColor),
      showUnselectedLabels: true,
    ),
    iconTheme: IconThemeData(color: kMainColor),
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(
          bodyColor: kTextColor,
        )
        .copyWith(
          headline6: TitleTextStyle,
          subtitle1: SubTitleTextStyle,
          bodyText1: TextTextStyle,
          caption: InactiveTextTextStyle,
        ),
    colorScheme:
        ColorScheme.light(primary: kMainColor, secondary: kDetailsColor),
  );
}

final appBarTheme = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  color: kBackgroundColor,
);
