import 'package:flutter/material.dart';
import 'package:shop_app/provider/cart_provider.dart';
import '../provider/cart_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.dateTime,
      @required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orderItems = [];
  List<OrderItem> get orders {
    return [..._orderItems];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    _orderItems.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProduct));
    notifyListeners();
  }
}
