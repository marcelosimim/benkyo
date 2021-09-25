import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: Color(0xFF1E1B2E),
      appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1E1B2E)),
      scaffoldBackgroundColor: Color(0xFF1E1B2E),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFE1E1E6),
            onPrimary: Color(0xFF1C1C24),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            minimumSize: Size(100, 50)
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
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xFF444053)),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFF444053))
    );
  }
}
