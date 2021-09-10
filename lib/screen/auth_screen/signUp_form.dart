import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genesis_packaging_v1/widget/google_signIn_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool? _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: TextField(
                //controller: ,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Enter Full Name",
                  labelStyle: TextStyle(
                    color: Color(0xFFA7AEB6),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFA7AEB6),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF4578E),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              //controller: ,
              decoration: InputDecoration(
                labelText: "Email ID",
                hintText: "Enter Email ID",
                labelStyle: TextStyle(
                  color: Color(0xFFA7AEB6),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFA7AEB6),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFF4578E),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              //controller: ,
              obscureText: !_passwordVisible!,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter Password",
                labelStyle: TextStyle(
                  color: Color(0xFFA7AEB6),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFA7AEB6),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFF4578E),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: 15.0),
                  icon: Icon(
                    !_passwordVisible!
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                  ),
                  color: Theme.of(context).primaryColor,
                  iconSize: 18.0,
                  onPressed: () => setState(
                    () {
                      _passwordVisible = !_passwordVisible!;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(80.w, 50),
                primary: Color(0xFFF4578E),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}
