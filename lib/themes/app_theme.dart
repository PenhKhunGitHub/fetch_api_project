import 'package:flutter/material.dart';

class Themes {
    final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blueGrey[300],
      brightness: Brightness.light,
    );
    final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blueGrey[800],
      brightness: Brightness.dark,
    );
}