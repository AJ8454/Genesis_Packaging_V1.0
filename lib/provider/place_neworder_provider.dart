import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/placeOrder_model.dart';
import 'package:http/http.dart' as http;

class PlaceNewOrderProvider with ChangeNotifier {
  // setter
  List<PlaceOrderTodo> _items = [];

// getter
  List<PlaceOrderTodo> get items {
    return [..._items];
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
        }),
      );
      final placeOrder = PlaceOrderTodo(
        id: json.decode(response.body)['name'],
        title: newPlaceOrder.title,
        balanceQty: newPlaceOrder.balanceQty,
        newOrder: newPlaceOrder.newOrder,
        createdTime: newPlaceOrder.createdTime,
      );
      _items.add(placeOrder);
      notifyListeners();
    } catch (error) {
      print('error deko!$error');
      throw error;
    }
  }
}
