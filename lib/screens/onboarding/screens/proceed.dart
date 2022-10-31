import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/common/theme_helper.dart';
import 'package:login_ui/page_switcher.dart';
import 'package:lottie/lottie.dart';

class ProceedOnboarding extends StatelessWidget {
  const ProceedOnboarding({super.key});
  final url = 'https://assets9.lottiefiles.com/packages/lf20_nk5g0wbx.json';

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
                'Proceed to Dashboard',
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
                      "You're welcomed to your dashboard, kindly feel free\n around it",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageSwitcher(),
                      ),
                    );
                  },
                  child: ThemeHelper().authSubmitButton(context, 'Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
