import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'themes/theme.dart';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaufleute - Kennzahlen',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // To Navigate to the first page
      home: const WelcomeScreen(),
    );
  }
}
