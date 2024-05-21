import 'package:flutter/material.dart';
import '../splash/firstSplash.dart';
import '../splash/secondSplash.dart';
import '../splash/thirdSplash.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          FirstSplash(nextPage: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          }),
          SecondSplash(nextPage: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          }, previousPage: () {
            _pageController.previousPage(
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          }),
          ThirdSplash(),
        ],
      ),
    );
  }
}