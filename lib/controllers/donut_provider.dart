import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../donut_model.dart';

class DonutProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Donut> _favorites = [];

  List<Donut> get favorites => _favorites;

  Future<void> fetchFavorites() async {
    try {
      final snapshot = await _firestore.collection('favorites').get();
      _favorites =
          snapshot.docs.map((doc) => Donut.fromFirestore(doc.data())).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching favorites: $error');
    }
  }

  void saveFavorites(List<Donut> favorites) {
    for (var donut in favorites) {
      _firestore
          .collection('favorites')
          .doc(donut.name)
          .set(donut.toFirestore());
    }
  }

  void addFavorite(Donut donut) {
    _favorites.add(donut);
    _firestore.collection('favorites').doc(donut.name).set(donut.toFirestore());
    saveFavorites(_favorites);
    notifyListeners();
  }

  void removeFavorite(Donut donut) {
    _favorites.removeWhere((favorite) => favorite.name == donut.name);
    _firestore.collection('favorites').doc(donut.name).delete();
    saveFavorites(_favorites);
    notifyListeners();
  }
}
