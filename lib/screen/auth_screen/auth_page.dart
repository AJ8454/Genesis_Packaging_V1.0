import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './/widget/authentication_widgets/signIn_signUp_Label.dart';
import 'package:sizer/sizer.dart';
import './/screen/auth_screen/signUp_page.dart';
import 'login_form.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fontSize: 25.sp,
                      color: Color(0xFF0E131C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign in to Continue!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xFFA7AEB6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  LoginForm(),
                  const Spacer(),
                  SignInAndSignUpLabel(
                    text1: 'I\'m a new user, ',
                    text2: 'Sign Up',
                    onClicked: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
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
