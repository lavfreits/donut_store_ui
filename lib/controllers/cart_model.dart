import 'package:flutter/material.dart';

import 'item_model.dart';



class CartModel extends ChangeNotifier {
  final List<Item> _cartItems = [];

  get cartItems => _cartItems;

  void addItemToCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItemFromCart(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
