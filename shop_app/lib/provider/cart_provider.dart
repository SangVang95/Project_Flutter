import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get item {
    return {..._items};
  }

  // int get itemCount() {
  //   return _items.length;
  // }

  int get itemCount {
    return _items.length;
  }

  void addItems(String id, double price, String title) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (currentItems) => CartItem(
              id: currentItems.id,
              title: currentItems.title,
              quantity: currentItems.quantity + 1,
              price: currentItems.price));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: null));
    }
    notifyListeners();
  }
}
