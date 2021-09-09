import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome',
              body: 'Genesis Packaging',
              image: Center(
                child: Image.asset('assets/icons/appIcon.png'),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Welcome',
              body: 'Genesis Packaging',
              image: Image.asset('assets/icons/appIcon.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Welcome',
              body: 'Genesis Packaging',
              image: Image.asset('assets/icons/appIcon.png'),
              footer: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  shape: const StadiumBorder(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 14.0),
                ),
                onPressed: () => goToAuthScreen(context),
                child: const Text(
                  "Let's Go !",
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          skip: const Text("Skip",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600)),
          next: const Icon(FontAwesomeIcons.angleRight,
              color: Colors.red, size: 30.0),
          done: const Text(
            "Done",
            style: TextStyle(
                color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
          showSkipButton: true,
          showNextButton: true,
          dotsDecorator: getDotDecorator(),
          skipFlex: 0,
          nextFlex: 0,
          onDone: () => goToAuthScreen(context),
        ),
      ),
    );
  }

  void goToAuthScreen(context) =>
      Navigator.of(context).pushReplacementNamed('/authPage');

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20.0),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
      );

  DotsDecorator getDotDecorator() => DotsDecorator(
        color: Color(0xFFDBDBDB),
        activeColor: Colors.orange,
        size: Size(10, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        activeSize: Size(15, 8),
      );
}
