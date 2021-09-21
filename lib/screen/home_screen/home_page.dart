import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genesis_packaging_v1/widget/homePage_widgets/stock_grid.dart';
import 'package:genesis_packaging_v1/widget/shadow_appbar_button.dart';
import 'package:sizer/sizer.dart';
import 'package:genesis_packaging_v1/widget/homePage_widgets/app_drawer.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kCanvasColor,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShadowAppBarButton(
                    icon: FontAwesomeIcons.bars,
                    onClicked: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        child: Image(
                          image: NetworkImage(
                            (user!.photoURL!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'All Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                height: 40,
                child: CupertinoSearchTextField(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: StockGrid(),
                ),
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