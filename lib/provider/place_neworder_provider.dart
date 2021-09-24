import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:http/http.dart' as http;

class PlaceNewOrderProvider with ChangeNotifier {
  // setter
  List<PlaceOrderTodo> _items = [];

// getter
  List<PlaceOrderTodo> get items =>
      _items.where((todo) => todo.isDone == false).toList();

  List<PlaceOrderTodo> get todosCompleted =>
      _items.where((todo) => todo.isDone == true).toList();

  bool toggleTodoStatus(PlaceOrderTodo todo) {
    todo.isDone = !todo.isDone!;
    notifyListeners();
    return todo.isDone!;
  }

  void removeTodo(PlaceOrderTodo todo) {
    _items.remove(todo);
    notifyListeners();
  }

  Future<void> fetchAndSetNewPlaceOrder() async {
    var url =
        'https://genesis-packaging-v-1-default-rtdb.firebaseio.com/placeOrder.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<PlaceOrderTodo> loadedPlaceNewOrder = [];
      extractedData.forEach((newOrderId, newOrderData) {
        loadedPlaceNewOrder.add(PlaceOrderTodo(
          id: newOrderId,
          title: newOrderData['title'],
          balanceQty: newOrderData['balQty'],
          createdTime: newOrderData['createdTime'],
          newOrder: newOrderData['newOrder'],
          supplier: newOrderData['supplier'],
          isDone: newOrderData['isDone'],
        ));
      });
      _items = loadedPlaceNewOrder;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addPlaceOrder(PlaceOrderTodo newPlaceOrder) async {
    var url =
        'https://genesis-packaging-v-1-default-rtdb.firebaseio.com/placeOrder.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'title': newPlaceOrder.title,
          'balQty': newPlaceOrder.balanceQty,
          'supplier': newPlaceOrder.supplier,
          'createdTime': newPlaceOrder.createdTime,
          'newOrder': newPlaceOrder.newOrder,
          'isDone': newPlaceOrder.isDone,
        }),
      );
      final placeOrder = PlaceOrderTodo(
        id: json.decode(response.body)['name'],
        title: newPlaceOrder.title,
        balanceQty: newPlaceOrder.balanceQty,
        newOrder: newPlaceOrder.newOrder,
        createdTime: newPlaceOrder.createdTime,
        isDone: newPlaceOrder.isDone,
      );
      _items.add(placeOrder);
      notifyListeners();
    } catch (error) {
      print('error deko!$error');
      throw error;
    }
  }
}
