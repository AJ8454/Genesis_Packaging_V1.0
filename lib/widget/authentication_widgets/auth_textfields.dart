import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class AuthenticationTextFields extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  const AuthenticationTextFields({
    Key? key,
    this.controller,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: ,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: kGreyColor,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kGreyColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kPrimaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
