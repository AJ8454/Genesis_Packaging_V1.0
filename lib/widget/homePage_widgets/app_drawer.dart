import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/google_sign_in_provider.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        elevation: 8,
        child: ListView(shrinkWrap: true, children: [
          SizedBox(
            height: 60,
            child: DrawerHeader(
              child: Text(
                'Genesis Packaging',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.ptSerif().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          DrawerListTile(
            name: 'Stock',
            icon: Icons.production_quantity_limits,
            onClicked: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/stockItems');
            },
          ),
          DrawerListTile(
            name: 'Attendance',
            icon: Icons.person_outline,
            onClicked: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/stockItems');
            },
          ),
          DrawerListTile(
            name: 'Employees',
            icon: Icons.person,
            onClicked: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/EmployeeScreen');
            },
          ),
          DrawerListTile(
            name: 'Orders',
            icon: Icons.local_shipping_rounded,
            onClicked: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/OrderScreen');
            },
          ),
          DrawerListTile(
            name: 'Production',
            icon: Icons.poll_rounded,
            // navigate: '',
          ),
          DrawerListTile(
            name: 'Tasks',
            icon: Icons.task_alt,
            // navigate: '',
          ),
          DrawerListTile(
            name: 'Supplier Record',
            icon: Icons.receipt_long_outlined,
            // navigate: '',
          ),
          DrawerListTile(
            name: 'Purchase Record',
            icon: Icons.receipt,
            // navigate: '',
          ),
          DrawerListTile(
            name: 'Sign Out',
            icon: Icons.exit_to_app,
            onClicked: () => provider.logout(),
          ),
        ]),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String? name, navigate;
  final IconData icon;
  final VoidCallback? onClicked;

  DrawerListTile({
    Key? key,
    required this.name,
    this.navigate,
    this.onClicked,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Theme(
        data: ThemeData(splashColor: Colors.pink),
        child: Ink(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ListTile(
              leading: Icon(
                icon,
                color: kGreyColor,
              ),
              title: Text(
                name!,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onTap: onClicked,
            ),
          ),
        ),
      ),
    );
  }
}
