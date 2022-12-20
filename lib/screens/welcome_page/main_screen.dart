import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Home_page/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
         Container(
          width: width,
          height: height,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch, adjustment
                children: [
                  const SizedBox(height: 50),
                  Image.asset('assets/images/smallview.png'),
                  const Text("Welcome",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: RichText(
                      text: TextSpan(
                        text: " Kaufleute im \n E-COMMERCE\n\n",
                        //textAlign: TextAlign.center,
                        style: GoogleFonts.oswald(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        children: [
                      TextSpan(
                      text: "   GLOSARY",
                     // textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                        ),
                      ),
                      )
                        ]
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Use this glossary to learn and understand vocabulary, terms and\n  definitions.',
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "WEITER",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
