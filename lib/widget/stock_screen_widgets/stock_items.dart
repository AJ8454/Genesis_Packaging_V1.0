import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:provider/provider.dart';

class StockItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? type;
  const StockItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: AssetImage(imageUrl!),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: kDarkColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  type!,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: kGreyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.edit,
                size: 22.0,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/stockEditScreen', arguments: id);
              },
              color: Colors.brown,
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                size: 22.0,
              ),
              onPressed: () async {
                try {
                  await Provider.of<StockProvider>(context, listen: false)
                      .deleteProduct(id!);
                  // .then(
                  //   (_) => snackbar.showSnackBar(
                  //     SnackBar(
                  //       content: Text('Product Deleted',
                  //           textAlign: TextAlign.center),
                  //       backgroundColor: Colors.red[400],
                  //     ),
                  //   ),
                  // );
                } catch (error) {
                  // snackbar.showSnackBar(
                  //   SnackBar(
                  //     content: Text('Deleting Failed',
                  //         textAlign: TextAlign.center),
                  //   ),
                  // );
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}

// margin: EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: kBgColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         title: Text(title!),
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(
        //     imageUrl!,
        //   ),
//         ),
//         trailing: Container(
//           width: double.infinity,
//           child: Row(
//             children: [
              // IconButton(
              //   icon: Icon(Icons.edit),
              //   onPressed: () {
              //     Navigator.of(context)
              //         .pushNamed('/EditProductScreen', arguments: id);
              //   },
              //   color: Colors.brown,
              // ),
              // IconButton(
              //   icon: Icon(Icons.delete),
              //   onPressed: () async {
              //     try {
              //       await Provider.of<StockProvider>(context, listen: false)
              //           .deleteProduct(id!);
              //       // .then(
              //       //   (_) => snackbar.showSnackBar(
              //       //     SnackBar(
              //       //       content: Text('Product Deleted',
              //       //           textAlign: TextAlign.center),
              //       //       backgroundColor: Colors.red[400],
              //       //     ),
              //       //   ),
              //       // );
              //     } catch (error) {
              //       // snackbar.showSnackBar(
              //       //   SnackBar(
              //       //     content: Text('Deleting Failed',
              //       //         textAlign: TextAlign.center),
              //       //   ),
              //       // );
              //     }
              //   },
              //   color: Theme.of(context).errorColor,
              // ),
      //       ],
      //     ),
      //   ),
      // ),