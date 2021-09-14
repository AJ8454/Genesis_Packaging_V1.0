import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import './/widget/authentication_widgets/signIn_signUp_Label.dart';
import 'package:flutter/services.dart';
import 'signUp_form.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    style: kLabelTextStyle,
                  ),
                  Text(
                    'Sign up to get started!',
                    style: kLabelTextStyle2,
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
