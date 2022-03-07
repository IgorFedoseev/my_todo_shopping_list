import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.russoOne(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      color: Colors.black,
    ),
    headline1: GoogleFonts.russoOne(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline2: GoogleFonts.russoOne(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline3: GoogleFonts.russoOne(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.russoOne(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      color: Colors.white,
    ),
    headline1: GoogleFonts.russoOne(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline2: GoogleFonts.russoOne(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline3: GoogleFonts.russoOne(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
      ),
      textTheme: darkTextTheme,
    );
  }
}
