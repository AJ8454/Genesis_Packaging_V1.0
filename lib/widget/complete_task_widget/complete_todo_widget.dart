import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:genesis_packaging_v1/provider/order_provider.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:provider/provider.dart';
import '../utils.dart';

class CompleteTaskTodoWidget extends StatelessWidget {
  final PlaceOrderTodo todo;
  const CompleteTaskTodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Slidable(
        child: buildTodo(context),
        key: Key(todo.id!),
        actionPane: const SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () {}, //=> editTodo(context, todo),
            caption: 'Edit',
            icon: Icons.edit,
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            onTap: () => deleteTodo(context, todo),
            caption: 'Delete',
            icon: Icons.delete,
          ),
        ],
      ),
    );
  }

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'Orders : ${todo.newOrder!}',
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Supplier : ${todo.supplier!}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Created : ${todo.createdTime!}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  void deleteTodo(BuildContext context, PlaceOrderTodo todo) {
    final provider = Provider.of<OrderProvider>(context, listen: false);
    provider.deletePlacenewOreder(todo.id!, 'completeTask');
    Utils.showSnackBar(context, 'Deleted the task');
  }

  // void stockUpdate(BuildContext context, PlaceOrderTodo todo) async {
  //   final newOrderprovider = Provider.of<StockProvider>(context, listen: false);
  //   newOrderprovider.updateProduct(todo.id!, todo);
  //   await Provider.of<PlaceNewOrderProvider>(context, listen: false)
  //       .deletePlacenewOreder(todo.id!);
  // }
}
