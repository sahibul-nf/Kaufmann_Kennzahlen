// manage the admin theme
import 'package:flutter/material.dart';

class AppTheme {
  static const color = Colors.deepPurple;

  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(seedColor: color),
    useMaterial3: true,
  );
  static final darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
