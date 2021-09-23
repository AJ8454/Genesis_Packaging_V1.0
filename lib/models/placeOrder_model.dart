class PlaceOrderTodoField {
  static const createdTime = 'createdTime';
}

class PlaceOrderTodo {
  DateTime? createdTime;
  String? title;
  String? id;
  String? balanceQty;
  String? supplier;
  String? newOrder;
  bool? isDone;

  PlaceOrderTodo({
    required this.createdTime,
    required this.title,
    this.id = '',
    this.balanceQty = '',
    this.newOrder= '',
    this.supplier = '',
    this.isDone = false,
  });
}
