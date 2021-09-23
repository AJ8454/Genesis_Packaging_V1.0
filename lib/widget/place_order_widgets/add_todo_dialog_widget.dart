import 'package:flutter/material.dart';
import 'todo_form_widget.dart';

class AddTodoDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
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
              TodoFormWidget(),
            ],
          ),
        ),
      );
}
