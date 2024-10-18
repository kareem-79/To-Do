import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff5D9CEC);
  static Color primaryDarkColor = const Color(0xff5D9CEC);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color darkColor = const Color(0xFF141922);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: whiteColor,
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(360),
          borderSide: BorderSide(color: whiteColor, width: 3)),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: darkColor)
    ),
    iconTheme: IconThemeData(
      color: darkColor
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.inter(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
      labelSmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    secondaryHeaderColor: darkColor,
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xff060E1E),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(360),
          borderSide: BorderSide(color: darkColor, width: 3)),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: Color(0xff141922),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(color: whiteColor)
    ),
    iconTheme: IconThemeData(
      color: whiteColor
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.inter(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
      labelSmall: GoogleFonts.poppins(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    ),
  );
}
