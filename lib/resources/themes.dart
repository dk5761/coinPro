import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: colorBgLightTheme,
      textTheme: GoogleFonts.nunitoSansTextTheme(
        Theme.of(context).textTheme,
      ));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: colorBgLightTheme,
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme,
      ));
}
