import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:provider/provider.dart';

import 'todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String? title = '';
  String? balanceQty = '';
  String? supplier = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Place New Order',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(height: 8),
                TodoFormWidget(
                    // onChangedTitle: (title) => setState(() => this.title = title),
                    // onChangedDescription: (description) =>
                    //     setState(() => this.balanceQty = description),
                    // onSavedTodo: addTodo,
                    ),
              ],
            ),
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = PlaceOrderTodo(
        id: DateTime.now().toString(),
        title: title,
        balanceQty: balanceQty,
        supplier: supplier,
        createdTime: DateTime.now(),
      );
      // final provider = Provider.of<TodosProvider>(context, listen: false);
      // provider.addTodo(todo);
      // Navigator.pop(context);
    }
  }
}