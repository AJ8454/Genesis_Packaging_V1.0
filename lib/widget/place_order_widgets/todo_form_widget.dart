import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:genesis_packaging_v1/models/product_model.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';

class TodoFormWidget extends StatefulWidget {
  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  List<Product>? product;
  List<Product>? selectedProduct;
  String? selectedValue;

  @override
  void initState() {
    final productData = Provider.of<StockProvider>(context, listen: false);
    super.initState();
    product = productData.items.toList();
    selectedProduct = product;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10.0),
            buildDropdownTitle(),
            const SizedBox(height: 8),
            ..._getItemValue(),
          ],
        ),
      );

  Widget buildDropdownTitle() => Container(
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
      );

  _getItemValue() {
    return selectedProduct!.asMap().entries.map((product) {
      int idx = product.key;
      return selectedProduct![idx].title == selectedValue
          ? Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Bal Qty : ${selectedProduct![idx].quantity!.toString()}',
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'Supplier : ${selectedProduct![idx].supplier}',
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text('Order :'),
                    const SizedBox(width: 5.0),
                    Container(
                      child: Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'No. of Orders',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                buildButton(context),
              ],
            )
          : Container();
    }).toList();
  }

  Widget buildButton(context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Save'),
        ),
      );
}
