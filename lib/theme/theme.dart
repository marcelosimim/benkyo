import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF1E1B2E),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFE1E1E6),
            textStyle: GoogleFonts.poppins(color: Color(0xFF1C1C24)),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          )
      ),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.poppins(fontSize: 20, color: Color(0xFFE1E1E6)),
        bodyText2: GoogleFonts.poppins(fontSize: 20, color: Color(0xFFE1E1E6)),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.white
          )
      ),
    );
  }
}
