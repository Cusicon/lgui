import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroOnboarding extends StatelessWidget {
  const IntroOnboarding({super.key});
  final url = 'https://assets2.lottiefiles.com/packages/lf20_qmvs7uqa.json';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple.shade200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Welcome to LGUI',
                style: GoogleFonts.bebasNeue(
                  fontSize: 36.0,
                  color: Colors.white,
                ),
              ),
              Column(
                children: <Widget>[
                  Lottie.network(url, height: 300.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "This is a very simple app to collect user's personal\n information.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
