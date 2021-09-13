import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/google_sign_in_provider.dart';
import 'screen/auth_screen/auth_page.dart';
import 'screen/home_screen/home_page.dart';
import 'screen/onboarding_screen/onboarding_page.dart';
import 'utils/user_simple_preferences.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool? newUser;

  @override
  void initState() {
    super.initState();
    
    newUser = UserSimplePreferences.getUser() ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);
            if (provider.isSigningIn) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return newUser! ? OnBoardingPage() : AuthPage();
            }
          },
        ),
      ),
    );
  }
}
