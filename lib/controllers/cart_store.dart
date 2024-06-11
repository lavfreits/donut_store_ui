import 'package:mobx/mobx.dart';

import 'item_model.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<Item> _cartItems = ObservableList<Item>();

  @computed
  List<Item> get cartItems => _cartItems;

  @action
  void addItemToCart(Item item) {
    _cartItems.add(item);
  }

  @action
  void removeItemFromCart(Item item) {
    _cartItems.remove(item);
  }

  @action
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
