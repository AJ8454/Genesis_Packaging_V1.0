import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'initial_page.dart';
import 'provider/google_sign_in_provider.dart';
import 'screen/auth_screen/auth_page.dart';
import 'screen/stock_items_screen/stock_edit_screen.dart';
import 'screen/stock_items_screen/stock_items.dart';
import 'utils/constants.dart';
import 'utils/user_simple_preferences.dart';

// TODO: have to work on EditStock scren

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserSimplePreferences.init();
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
        ChangeNotifierProvider(create: (ctx) => StockProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.pink,
              scaffoldBackgroundColor: kBgColor,
              fontFamily: 'DMSans',
            ),
            title: title,
            initialRoute: '/',
            routes: {
              '/': (ctx) => InitialPage(),
              '/authPage': (ctx) => AuthPage(),
              '/stockItems': (ctx) => StockItems(),
              '/stockEditScreen': (ctx) => EditStockScreen(),
            },
          );
        },
      ),
    );
  }
}
