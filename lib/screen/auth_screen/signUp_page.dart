import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'signUp_form.dart';

class SignUpPage extends StatelessWidget {
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
                    'Create Account,',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Color(0xFF0E131C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign up to get started!',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Color(0xFFA7AEB6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  SignUpForm(),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'I\'m already a member, ',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF4E4E5A),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFD64F7C),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).pop(),
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
