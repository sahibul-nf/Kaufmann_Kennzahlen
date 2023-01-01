// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kaufmann_kennzahlen/screens/welcome_page/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _SplashScreenRoute();
    
  }

  _SplashScreenRoute() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Image.asset(
        "assets/images/view.png",
        fit: BoxFit.contain,
      ),
    ));
  }
}
