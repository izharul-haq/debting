import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ThemeProvider {
  // Dark mode theme
  static final ThemeData dark = ThemeData.dark().copyWith(
    cardTheme: _cardTheme,
    appBarTheme: _appBarTheme,
    dialogTheme: _dialogTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      floatingLabelStyle: TextStyle(color: Colors.tealAccent),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Colors.tealAccent),
      ),
      iconColor: Colors.tealAccent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.tealAccent,
    ),
  );

  // Light mode theme
  static final ThemeData light = ThemeData.light().copyWith(
    cardTheme: _cardTheme,
    appBarTheme: _appBarTheme,
    dialogTheme: _dialogTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
        ),
      ),
    ),
  );

  // Common themes
  static final AppBarTheme _appBarTheme = AppBarTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(4.w),
        bottomRight: Radius.circular(4.w),
      ),
    ),
  );

  static final CardTheme _cardTheme = CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
  );

  static final DialogTheme _dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
  );
}
