import 'package:flutter/material.dart';
import 'package:kaufmann_kennzahlen/screens/Splash_page/Splash_page.dart';
import 'constants/colors.dart';
import 'constants/theme.dart';
import 'screens/welcome_page/main_screen.dart';


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
      home: const SplashScreen(),
      color: AppColors.color,
    );
  }
}
