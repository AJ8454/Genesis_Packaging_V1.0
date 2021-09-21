import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/product_model.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:genesis_packaging_v1/widget/appbar_design.dart';
import 'package:genesis_packaging_v1/widget/shimmer_loading_widget.dart';
import 'package:genesis_packaging_v1/widget/stock_screen_widgets/stock_items.dart';
import 'package:provider/provider.dart';
import 'place_items.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({Key? key}) : super(key: key);

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  List<Product>? product;
  List<Product>? selectedProduct;
  String? selectedValue;
  String? itemId;

  @override
  void initState() {
    final productData = Provider.of<StockProvider>(context, listen: false);
    super.initState();
    product = productData.items.toList();
    selectedProduct = List.from(product!);
  }

  String? value;

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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black38, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      hint: Text('Select Product'),
                      items: product!.map((item) {
                        return DropdownMenuItem(
                          child: Text(item.title!),
                          value: item.title,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue as String?;
                        });
                      },
                      value: selectedValue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Product'),
                          Text('Bal. Qty'),
                          Text('Orders'),
                          Text('Supplire'),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ..._getItemValue(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getItemValue() {
    return selectedProduct!.asMap().entries.map((product) {
      int idx = product.key;
      return selectedProduct![idx].title == selectedValue
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedProduct![idx].title!,
                ),
                Text(
                  selectedProduct![idx].quantity!.toString(),
                ),
                Text('soon'),
                Text(
                  selectedProduct![idx].supplier!,
                ),
              ],
            )
          : Container();
    }).toList();
  }
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
