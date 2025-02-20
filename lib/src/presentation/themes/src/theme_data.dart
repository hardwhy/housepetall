import 'package:flutter/material.dart';

class HousePetAllThemes {
  static final basic = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.deepOrange[50],
    dividerTheme: DividerThemeData(color: Colors.deepOrange[50], thickness: 2),
  );
  static final darkBasic = ThemeData.dark(
    useMaterial3: true,
  );
}
