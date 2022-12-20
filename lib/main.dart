import 'package:flutter/material.dart';
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
      title: 'NASA Abbreviation',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // To Navigate to the first page
      home: const WelcomeScreen(),
      color: AppColors.color,
    );
  }
}
