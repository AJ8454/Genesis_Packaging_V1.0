import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/widget/homePage_widgets/homePage_app_bar.dart';
import 'package:genesis_packaging_v1/widget/homePage_widgets/app_drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: canvasColor,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageAppBar(scaffoldKey: _scaffoldKey),
              const SizedBox(height: 10),
              Text(
                'All Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                child: CupertinoSearchTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   final provider =
//                       Provider.of<GoogleSignInProvider>(context, listen: false);
//                   provider.logout();
//                 },
//                 child: Text('Logout'),
//               ),
//             ),