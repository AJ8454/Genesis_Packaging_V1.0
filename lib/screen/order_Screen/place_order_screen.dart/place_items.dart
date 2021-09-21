import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';


class PlaceItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? quantity;
  const PlaceItem({
    Key? key,
    required this.id,
    required this.title,
    required this.quantity,
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
            Text(
              title!,
              style: TextStyle(
                fontSize: 15.sp,
                color: kDarkColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'Bal. Qty ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  quantity!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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