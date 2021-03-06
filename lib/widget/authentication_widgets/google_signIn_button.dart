import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:genesis_packaging_v1/utils/user_simple_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genesis_packaging_v1/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        FontAwesomeIcons.google,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(80.w, 50),
        primary: Color(0xFFEAEEF4),
        onPrimary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login().then((_) => UserSimplePreferences.setUser(false));
      },
      label: Text(
        'Google',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
