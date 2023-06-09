import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context)=> ThemeData(
    primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.2,
          iconTheme: IconThemeData(color: Colors.black),

        )

    );
  static ThemeData darkTheme(BuildContext context)=> ThemeData(
    brightness: Brightness.dark,
  );

}