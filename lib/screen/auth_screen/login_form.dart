import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:genesis_packaging_v1/widget/authentication_widgets/auth_button.dart';
import 'package:genesis_packaging_v1/widget/authentication_widgets/auth_passwordfield.dart';
import 'package:genesis_packaging_v1/widget/authentication_widgets/auth_textfields.dart';
import 'package:genesis_packaging_v1/widget/authentication_widgets/google_signIn_button.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthenticationTextFields(
              labelText: "Email ID",
              hintText: "Enter Email ID",
            ),
            const SizedBox(height: 20.0),
            // password textFiels
            PasswordField(
              labelText: "Password",
              hintText: "Enter Password",
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: kGreyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            AuthenticationButton(
              text: 'Login',
            ),
            const SizedBox(height: 10.0),
            GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}
