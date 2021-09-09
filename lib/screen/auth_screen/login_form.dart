import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFF808080),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 50),
              primary: Color(0xFFF4578E),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton.icon(
            icon: Icon(
              FontAwesomeIcons.google,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 50),
              primary: Color(0xFFEAEEF4),
              onPrimary: Color(0xFFFE214F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            label: Text(
              'Google',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
