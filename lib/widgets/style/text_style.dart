import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle extends StatelessWidget {
  const AppTextStyle(
       this.text,
      {
    Key? key,

    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300,
    this.color = Colors.black,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.russoOne(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ));
  }
}
