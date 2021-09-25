import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:genesis_packaging_v1/models/product_model.dart';
import 'package:genesis_packaging_v1/provider/order_provider.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';

class TodoFormWidget extends StatefulWidget {
  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  var _isLoading = false;
  List<Product>? product;
  List<Product>? selectedProduct;
  String? selectedValue;
  final _orderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _editProduct = PlaceOrderTodo(
    id: null,
    title: '',
    balanceQty: '',
    newOrder: '',
    supplier: '',
    createdTime: null,
  );

  @override
  void initState() {
    final productData = Provider.of<StockProvider>(context, listen: false);
    super.initState();
    product = productData.items.toList();
    selectedProduct = product;
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<OrderProvider>(context, listen: false)
          .addPlaceOrder(_editProduct, 'placeOrder', false)
          .then(
            (_) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Place new Order',
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              ),
            ),
          );
    } catch (e) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error occured!'),
          content: Text('Something went wrong.'),
          actions: [
            TextButton(
              child: Text('Okay', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => _isLoading
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Column(
          children: [
            const SizedBox(height: 10.0),
            buildDropdownTitle(),
            const SizedBox(height: 8),
            ..._getItemValue(),
          ],
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
                    Flexible(
                      child: Container(
                        child: Text(
                          'Supplier : ${selectedProduct![idx].supplier}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text('Order :'),
                    const SizedBox(width: 5.0),
                    Form(
                      key: _formKey,
                      child: Container(
                        child: Flexible(
                          child: TextFormField(
                            controller: _orderController,
                            decoration: InputDecoration(
                              hintText: 'No. of Orders',
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _editProduct = PlaceOrderTodo(
                                title: selectedValue,
                                balanceQty:
                                    selectedProduct![idx].quantity!.toString(),
                                supplier: selectedProduct![idx].supplier!,
                                newOrder: value,
                                createdTime: DateTime.now().toString(),
                                id: selectedProduct![idx].id,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the order';
                              }
                              return null;
                            },
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
          onPressed: () => _submitForm(),
          child: const Text('Save'),
        ),
      );
}
