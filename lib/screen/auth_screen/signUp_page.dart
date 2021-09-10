import 'package:flutter/material.dart';
import './/widget/authentication_widgets/signIn_signUp_Label.dart';
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
                      fontSize: 25.sp,
                      color: Color(0xFF0E131C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign up to get started!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xFFA7AEB6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  SignUpForm(),
                  const Spacer(),
                  SignInAndSignUpLabel(
                    text1: 'I\'m already a member, ',
                    text2: 'Sign In',
                    onClicked: () => Navigator.of(context).pop(),
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
