import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.russoOne(
      fontSize: 13.0,
      fontWeight: FontWeight.w200,
      color: Colors.blueGrey[900],
    ),
    headline1: GoogleFonts.russoOne(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[900],
    ),
    headline2: GoogleFonts.russoOne(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey[900],
    ),
    headline3: GoogleFonts.russoOne(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: Colors.blueGrey[900],
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.russoOne(
      fontSize: 13.0,
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
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.blueGrey[900],
        backgroundColor: Colors.blueGrey[50],
        titleTextStyle: lightTextTheme.headline2,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[800],
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blueGrey[50],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.blueGrey[400],
        selectedIconTheme: const IconThemeData(size: 30.0),
        unselectedIconTheme: const IconThemeData(size: 30.0),
        selectedLabelStyle: lightTextTheme.bodyText1,
        unselectedLabelStyle: lightTextTheme.bodyText1,
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
        titleTextStyle: darkTextTheme.headline2,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
        selectedIconTheme: const IconThemeData(size: 30.0),
        unselectedIconTheme: const IconThemeData(size: 30.0),
        selectedLabelStyle: darkTextTheme.bodyText1,
        unselectedLabelStyle: darkTextTheme.bodyText1,
      ),
      textTheme: darkTextTheme,
    );
  }
}
