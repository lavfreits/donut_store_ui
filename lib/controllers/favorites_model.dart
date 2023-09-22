import 'package:flutter/material.dart';

import 'item_model.dart';

class LikedModel extends ChangeNotifier {
  final List<Item> _likedItems = [];

  get likedItems => _likedItems;

  void addItemToLiked(Item item) {
    _likedItems.add(item);
    notifyListeners();
  }

  void removeItemFromLiked(Item item) {
    _likedItems.remove(item);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _likedItems.length; i++) {
      totalPrice += double.parse(_likedItems[i]
          .price); // todo 1 é substituivel pelo numero da coluna q ta o preco
    }
    return totalPrice.toStringAsFixed(2);
  }
}
