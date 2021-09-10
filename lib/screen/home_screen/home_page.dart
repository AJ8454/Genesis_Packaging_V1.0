import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.logout();
      },
      child: Text('Logout'),
    )));
  }
}
