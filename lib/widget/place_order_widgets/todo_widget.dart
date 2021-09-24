import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:genesis_packaging_v1/provider/place_neworder_provider.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class PlaceTodoWidget extends StatelessWidget {
  final PlaceOrderTodo todo;
  const PlaceTodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => ClipRRect(
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

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<PlaceNewOrderProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);
                Utils.showSnackBar(
                  context,
                  isDone ? 'Task Completed' : 'Task marked incomplete',
                );
              },
            ),
            const SizedBox(width: 20),
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
    final provider = Provider.of<PlaceNewOrderProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task');
  }
}
