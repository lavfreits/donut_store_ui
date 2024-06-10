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
}
