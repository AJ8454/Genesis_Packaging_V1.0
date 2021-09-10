import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'initial_page.dart';
import 'provider/google_sign_in_provider.dart';
import 'screen/auth_screen/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Genesis Packaging';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFF4578E),
          fontFamily: 'DMSans',
        ),
        title: title,
        initialRoute: '/authPage',
        routes: {
          '/': (ctx) => InitialPage(),
          '/authPage': (ctx) => AuthPage(),
        },
      ),
    );
  }
}
