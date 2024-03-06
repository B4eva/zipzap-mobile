import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zipzap/src/utils/theme/cusomt_themes/appbar_theme.dart';
import 'package:zipzap/src/utils/theme/cusomt_themes/bottom_sheet_theme.dart';
import 'package:zipzap/src/utils/theme/cusomt_themes/checkbox_theme.dart';
import 'package:zipzap/src/utils/theme/cusomt_themes/elevated_button_theme.dart';
import 'package:zipzap/src/utils/theme/cusomt_themes/text_themes.dart';
import 'package:zipzap/src/utils/theme/cusomt_themes/textfield_theme.dart';

class ZipZapTheme {
  ZipZapTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ZipZapCustomThemes.lightTheme,
    elevatedButtonTheme: ZipZapElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: ZipZapTextFieldTheme.lightInputDecorationTheme,
    bottomSheetTheme: ZipZapBottomSheetTheme.lightBottomSheetTheme,
    appBarTheme: ZipZapAppBarTheme.lightAppBarTheme,
    checkboxTheme: ZipZapCheckBoxTheme.lightCheckBoxTheme,
  );
  static ThemeData dartTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ZipZapCustomThemes.darkTheme,
    elevatedButtonTheme: ZipZapElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: ZipZapTextFieldTheme.darkInputDecorationTheme,
    bottomSheetTheme: ZipZapBottomSheetTheme.dartBottomSheetTheme,
    appBarTheme: ZipZapAppBarTheme.darkAppBarTheme,
    checkboxTheme: ZipZapCheckBoxTheme.darkCheckBoxTheme,
  );
}
