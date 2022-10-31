import 'package:flutter/material.dart';
import 'package:login_ui/page_switcher.dart';
import 'package:login_ui/screens/onboarding/screens/details.dart';
import 'package:login_ui/screens/onboarding/screens/intro.dart';
import 'package:login_ui/screens/onboarding/screens/proceed.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[
      IntroOnboarding(),
      DetailsOnboarding(),
      ProceedOnboarding(),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: pages,
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Colors.white.withOpacity(0.5),
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void nextPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
