import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const[
            Text(
              "Postanschrift",
              style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Dr. Marius Ebert\nHauptstraße 127\n69117 Heidelberg\nBiswajit Behera\nEmail: info@spasslerndenk.de",
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
