import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/widget/appbar_design.dart';
import 'package:genesis_packaging_v1/widget/place_order_widgets/add_todo_dialog_widget.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({Key? key}) : super(key: key);

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarDesign(
          text: 'Place Order',
          icon: Icons.arrow_back,
        ),
        preferredSize: Size.fromHeight(100),
      ),
      // body: SafeArea(
      //   child: Center(
      //     child: Column(
      //       children: [
     
             
      //         SingleChildScrollView(
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     Expanded(child: Text('Product')),
      //                     Expanded(child: Text('Bal. Qty')),
      //                     Expanded(child: Text('Orders')),
      //                     Expanded(child: Text('Supplire')),
      //                   ],
      //                 ),
      //                 Row(
      //                   children: [
      //                     Expanded(
      //                       child: Divider(),
      //                     ),
      //                   ],
      //                 ),
      //                 ..._getItemValue(),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }

  // _getItemValue() {
  //   return selectedProduct!.asMap().entries.map((product) {
  //     int idx = product.key;
  //     return selectedProduct![idx].title == selectedValue
  //         ? Row(
  //             children: [
  //               Expanded(
  //                 child: Text(selectedProduct![idx].title!,
  //                     maxLines: 1, overflow: TextOverflow.ellipsis),
  //               ),
  //               Expanded(
  //                 child: Text(selectedProduct![idx].quantity!.toString(),
  //                     maxLines: 1, overflow: TextOverflow.ellipsis),
  //               ),
  //               Expanded(
  //                 child: Container(
  //                   margin: EdgeInsets.symmetric(horizontal: 3),
  //                   padding: EdgeInsets.only(right: 8),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3),
  //                     color: Colors.white,
  //                   ),
  //                   child: TextField(
  //                     maxLines: 1,
  //                     keyboardType: TextInputType.number,
  //                     decoration: InputDecoration(
  //                       hintText: 'No. of Orders',
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Text(selectedProduct![idx].supplier!,
  //                     maxLines: 1, overflow: TextOverflow.ellipsis),
  //               ),
  //             ],
  //           )
  //         : Container();
  //   }).toList();
  // }
}

// SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: DataTable(
//                   columns: [
//                     DataColumn(
//                       label: Text('Product'),
//                     ),
//                     DataColumn(
//                       label: Text('Bal. Qty'),
//                     ),
//                     DataColumn(
//                       label: Text('Orders'),
//                     ),
//                     DataColumn(
//                       label: Text('Supplier'),
//                     ),
//                   ],
//                   rows: product!.map((itemValues) {
//                     return DataRow(cells: [
//                                               DataCell(
//                           DropdownButton<Product>(
//                             value: itemValues[selectedValue!],
//                             onChanged: (Product? newProd) {
//                               setState(() {
//                                 selectedProduct![idx] = newProd!;
//                               });
//                             },
//                             items: product!.map<DropdownMenuItem<Product>>(
//                                 (Product value) {
//                               return DropdownMenuItem<Product>(
//                                 value: value,
//                                 child: Text(value.title!),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                     ]);
//                   }).toList(),
//                   selectedProduct!.asMap().entries.map((prod) {
//                     int? idx = prod.key;
//                     return DataRow(
//                       cells: [
//                   DataCell(
//                     DropdownButton<Product>(
//                       value: selectedProduct![idx],
//                       onChanged: (Product? newProd) {
//                         setState(() {
//                           selectedProduct![idx] = newProd!;
//                         });
//                       },
//                       items: product!.map<DropdownMenuItem<Product>>(
//                           (Product value) {
//                         return DropdownMenuItem<Product>(
//                           value: value,
//                           child: Text(value.title!),
//                         );
//                       }).toList(),
//                     ),
//                   ),
                        // DataCell(
                        //   Text(
                        //     selectedProduct![idx].quantity!.toString(),
                        //   ),
                        // ),
//                         DataCell(
//                           Text('soon'),
//                         ),
//                         DataCell(
//                           Text(selectedProduct![idx].supplier!),
//                         ),
//                         // DataCell(
//                         //   DropdownButton<Product>(
//                         //     value: selectedProduct![idx],
//                         //     onChanged: (Product? newProd) {
//                         //       setState(() {
//                         //         selectedProduct![idx] = newProd!;
//                         //       });
//                         //     },
//                         //     items: product!
//                         //         .map<DropdownMenuItem<Product>>((Product value) {
//                         //       return DropdownMenuItem<Product>(
//                         //         value: value,
//                         //         child: Text(value.quantity!.toString()),
//                         //       );
//                         //     }).toList(),
//                         //   ),
//                         // ),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
