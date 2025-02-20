import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HousePetAllThemes {
  static OutlineInputBorder get _defaultBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get _errorBorder => _defaultBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 2),
      );

  static OutlineInputBorder get _focusBorder => _defaultBorder.copyWith(
        borderSide: BorderSide(color: Colors.deepOrange[100]!, width: 2),
      );

  static TextStyle get _defaultStyle => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      );

  static TextStyle get _errorStyle => _defaultStyle.copyWith(
        color: Colors.red,
      );

  static TextStyle get _hintStyle => _defaultStyle.copyWith(
        color: Colors.black38,
      );

  static final basic = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.deepOrange[50],
    dividerTheme: DividerThemeData(
      color: Colors.deepOrange[50],
      thickness: 2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: _defaultStyle.copyWith(
        color: Colors.black87,
      ),
      suffixIconConstraints: const BoxConstraints(minHeight: 2, minWidth: 2),
      prefixIconConstraints: const BoxConstraints(minHeight: 2, minWidth: 2),
      contentPadding: EdgeInsets.zero,
      fillColor: Colors.white,
      hintStyle: _hintStyle,
      filled: true,
      errorBorder: _errorBorder,
      errorStyle: _errorStyle,
      labelStyle: _defaultStyle,
      focusedBorder: _focusBorder,
      border: _defaultBorder,
      enabledBorder: _defaultBorder,
      focusedErrorBorder: _errorBorder,
    ),
  );

  static final darkBasic = ThemeData.dark(
    useMaterial3: true,
  );
}
