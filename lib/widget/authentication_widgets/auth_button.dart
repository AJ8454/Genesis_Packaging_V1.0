import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class AuthenticationButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  AuthenticationButton({
    Key? key,
    required this.text,
    this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(80.w, 50),
        primary: kPrimaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
