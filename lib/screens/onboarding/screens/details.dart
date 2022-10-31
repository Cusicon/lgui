import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DetailsOnboarding extends StatelessWidget {
  const DetailsOnboarding({super.key});
  final url =
      'https://assets9.lottiefiles.com/private_files/lf30_vyeonnoq.json';

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
                'Enter your details',
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
                      'To proceed provide the minimal information about\n yourself.',
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
