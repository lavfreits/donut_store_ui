import 'package:get/get.dart';

import 'item_model.dart';

class CartController extends GetxController {
  final _cartItems = <Item>[].obs;

  get cartItems => _cartItems;

  var totalPrice = 0.0.obs;

  void addItemToCart(Item item) {
    _cartItems.add(item);

    totalPrice.value = double.parse(calculateTotal());
  }

  void removeItemFromCart(Item item) {
    _cartItems.remove(item);
    totalPrice.value = double.parse(calculateTotal());
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
