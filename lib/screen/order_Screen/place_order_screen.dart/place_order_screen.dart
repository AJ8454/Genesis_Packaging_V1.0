import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/product_model.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
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

  @override
  void initState() {
    final productData = Provider.of<StockProvider>(context, listen: false);
    super.initState();
    product = productData.items.toList();
    selectedProduct = List.from(product!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text('Product'),
              ),
              DataColumn(
                label: Text('Bal. Qty'),
              ),
              DataColumn(
                label: Text('Orders'),
              ),
              DataColumn(
                label: Text('Supplier'),
              ),
            ],
            rows: selectedProduct!.asMap().entries.map((prod) {
              int? idx = prod.key;
              return DataRow(
                cells: [
                  DataCell(
                    DropdownButton<Product>(
                      value: selectedProduct![idx],
                      onChanged: (Product? newProd) {
                        setState(() {
                          selectedProduct![idx] = newProd!;
                        });
                      },
                      items: product!
                          .map<DropdownMenuItem<Product>>((Product value) {
                        return DropdownMenuItem<Product>(
                          value: value,
                          child: Text(value.title!),
                        );
                      }).toList(),
                    ),
                  ),
                  DataCell(
                    Text(
                      selectedProduct![idx].quantity!.toString(),
                    ),
                  ),
                  DataCell(
                    Text('soon'),
                  ),
                  DataCell(
                    Text(selectedProduct![idx].supplier!),
                  ),
                  // DataCell(
                  //   DropdownButton<Product>(
                  //     value: selectedProduct![idx],
                  //     onChanged: (Product? newProd) {
                  //       setState(() {
                  //         selectedProduct![idx] = newProd!;
                  //       });
                  //     },
                  //     items: product!
                  //         .map<DropdownMenuItem<Product>>((Product value) {
                  //       return DropdownMenuItem<Product>(
                  //         value: value,
                  //         child: Text(value.quantity!.toString()),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
