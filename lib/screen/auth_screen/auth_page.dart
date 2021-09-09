import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/screen/auth_screen/signUp_page.dart';
import 'login_form.dart';

class AuthPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Color(0xFF0E131C),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sign in to Continue!',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xFFA7AEB6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              LoginForm(formKey: _formKey),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'I\'m a new user, ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF4E4E5A),
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFFD64F7C),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
