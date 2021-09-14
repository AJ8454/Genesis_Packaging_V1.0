import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Welcome',
                body: 'Genesis Packaging',
                image: Center(
                  child: Image.asset(
                    'assets/icons/appIcon.png',
                    width: 50.h,
                    height: 50.h,
                  ),
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
                image: Image.asset(
                  'assets/icons/appIcon.png',
                  width: 50.h,
                  height: 50.h,
                ),
                footer: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    shape: const StadiumBorder(),
                    minimumSize: Size(50.w, 40),
                  ),
                  onPressed: () => goToAuthScreen(context),
                  child: Text(
                    "Let's Go !",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                decoration: getPageDecoration(),
              ),
            ],
            skip: Text("Skip",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600)),
            next: Icon(
              FontAwesomeIcons.angleRight,
              color: Colors.red,
              size: 10.w,
            ),
            done: Text(
              "Done",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            showSkipButton: true,
            showNextButton: true,
            dotsDecorator: getDotDecorator(),
            skipFlex: 0,
            nextFlex: 0,
            onDone: () => goToAuthScreen(context),
          ),
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
