import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              icon: Icon(
                FontAwesomeIcons.bars,
                color: darkColor,
                size: 18.0,
              ),
            ),
            Text(
              'GP',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: GoogleFonts.caveat().fontFamily,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.search,
                color: darkColor,
                size: 18.0,
              ),
            ),
            // const NameTitle(),
            // Consumer<CartProvider>(
            //   builder: (_, cart, ch) => Badge(
            //     child: ch!,
            //     value: cart.itemCount.toString(),
            //   ),
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.shopping_cart_rounded,
            //       size: 25,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pushNamed('/cart');
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
// Center(
//         child: ElevatedButton(
//           onPressed: () {
//             final provider =
//                 Provider.of<GoogleSignInProvider>(context, listen: false);
//             provider.logout();
//           },
//           child: Text('Logout'),
//         ),
//       ),