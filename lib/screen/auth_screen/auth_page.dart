import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:genesis_packaging_v1/screen/auth_screen/signUp_page.dart';
import 'login_form.dart';

class AuthPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    'Welcome,',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Color(0xFF0E131C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign in to Continue!',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Color(0xFFA7AEB6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  LoginForm(),
                  const Spacer(),
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
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
