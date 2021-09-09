import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/auth_screen/auth_page.dart';
import 'screen/onboarding_screen/onboarding_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  static final String title = 'Genesis Packaging';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFE214F),
        accentColor: Color(0xFFFFDF01),
        fontFamily: 'DMSans',
      ),
      title: title,
      initialRoute: '/authPage',
      routes: {
        '/': (ctx) => OnBoardingPage(),
        '/authPage': (ctx) => AuthPage(),
      },
    );
  }
}
